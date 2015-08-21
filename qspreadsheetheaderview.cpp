#include <QPainter>
#include <QCursor>
#include <QHoverEvent>
#include <QMenu>
#include <QRegExp>
#include <QApplication>
#include <QSignalMapper>
#include <QWidgetAction>
#include "QSpreadsheetHeaderView.h"

#define DEBUG_ACTIVE false

QSpreadsheetHeaderView::QSpreadsheetHeaderView(Qt::Orientation orientation, int column_minimum,int column_maximum,QWidget * parent)
    : QHeaderView(orientation, parent)
{
    // Required to refresh button menu when the mouse leave the header.
    setAttribute(Qt::WA_Hover, true);
    columns_min=column_minimum;
    columns_max=column_maximum;
    #if (DEBUG_ACTIVE==true)
        qDebug()<<columns_min;
        qDebug()<<columns_max;
    #endif
    set_checkbox=false;
    freeze=false;
}

void QSpreadsheetHeaderView::mousePressEvent ( QMouseEvent * event )
{
    QHeaderView::mousePressEvent(event);

    logicalIndex = logicalIndexAt(event->pos());

    if (buttonMenuRect(logicalIndex).contains(event->pos())) {

        if(set_checkbox==false)
        {
            menu = new QMenu(this);

            sortAZ = menu->addAction("Sortuj A->Z");
            sortZA = menu->addAction("Sortuj Z->A");
            clear_sort = menu->addAction("Anuluj");
            menu->addSeparator();
            hideCol = menu->addAction("Ukryj kolumnę");
            clear_hideCol = menu->addAction("Odkryj wszystkie");

                   for(int i = 0; i <model()->columnCount(); i++)
                   {
                       actions[i] = new QAction(menu);
                       actions[i] = menu->addAction(model()->headerData(i, Qt::Horizontal).toString());
                       actions[i]->setCheckable(true);
                       connect(actions[i],SIGNAL(triggered(bool)),this,SLOT(hide_selected_column(bool)));
                       if(i<columns_min)actions[i]->setChecked(true);

                   }

            set_checkbox=true;
            connect(menu, SIGNAL(triggered(QAction*)), this, SLOT(action(QAction*)));
        }

        // Disable hide column if only one column remains. Otherwise
        // the gui is no more available to show them back.
        hideCol->setEnabled(hiddenSectionCount() < count() - 1);
        if(hideCol->isEnabled()==false)
        {
            for(int i = 0; i <model()->columnCount(); i++)
            {
                if(actions[i]->isChecked()==true)
                {
                    previous_sender=actions[i];
                    freeze=true;
                    actions[i]->setEnabled(false);
                    break;
                }
            }
        }

        menu->popup(mapToGlobal(event->pos()));
    }

        // Catch previous arrow mouse click.
    else if (prevRect(logicalIndex).contains(event->pos()) && set_checkbox==true)  {

            showSection(logicalIndex - 1);
            actions[logicalIndex - 1]->setChecked(true);
            updateSection(logicalIndex - 2);
            if(freeze==true)      { previous_sender->setEnabled(true); freeze=false;}

            check_hidden_column();
        }

        // Catch next arrow mouse click.
    else if (nextRect(logicalIndex).contains(event->pos()) && set_checkbox==true) {


            showSection(logicalIndex + 1);
            actions[logicalIndex + 1]->setChecked(true);
            updateSection(logicalIndex + 2);
            if(freeze==true)     { previous_sender->setEnabled(true); freeze=false; }

            check_hidden_column();
        }


}

void QSpreadsheetHeaderView::action(QAction *action) {


    if (action == hideCol)
    {
        hideSection(logicalIndex);
        actions[logicalIndex]->setChecked(false);
        updateSection(logicalIndex-1);
        check_hidden_column();
    }

    if (action == sortAZ)
        model()->sort(logicalIndex, Qt::AscendingOrder);

    if (action == sortZA)
        model()->sort(logicalIndex, Qt::DescendingOrder);

    if (action == clear_hideCol){
        for(int i = 0; i <model()->columnCount(); i++)
        {
            showSection(i);
            actions[i]->setChecked(true);
            actions[i]->setEnabled(true);
            if(freeze==true)      { previous_sender->setEnabled(true); freeze=false;}
        }

        check_hidden_column();
    }

    if (action == clear_sort){

    }

}

void QSpreadsheetHeaderView::hide_selected_column(bool checked)
{
    menu->show();
    QAction * senderCHECK = qobject_cast<QAction *>(this->sender());

    check_hidden_column();

    for(int i=0;i<23;i++)
            {
                if(senderCHECK==actions[i])
                {
                    if(checked==false && freeze==false)
                    {
                        hideSection(i);
                        actions[i]->setChecked(false);
                    }

                    else if(checked==true && freeze==true)
                    {
                        hideCol->setEnabled(true);
                        previous_sender->setEnabled(true);
                        showSection(i);
                        actions[i]->setChecked(true);
                        freeze=false;

                    }

                    else if(checked==true)
                    {
                        showSection(i);
                        actions[i]->setChecked(true);
                    }
                }
            }

    if(count()-hiddenSectionCount()==1)
    {
        freeze=true;
        hideCol->setEnabled(false);
        for(int i=0;i<23;i++)
        {
            if(actions[i]->isChecked()==true)
            {
                previous_sender=actions[i];
                actions[i]->setEnabled(false);
                break;
            }
        }
    }
}

void QSpreadsheetHeaderView::check_hidden_column()
{
    delete checked_columns;
    checked_columns = new bool[columns_max];
    for(int i=0;i<columns_max;i++)
    {
        checked_columns[i]=actions[i]->isChecked(); // 1-visible columns, 0 - hidden columns
        #if (DEBUG_ACTIVE==true)
             qDebug()<<"Header (signal) hidden columns"<<i<<":"<<checked_columns[i];
        #endif
    }

    emit sendHiddenColums(checked_columns);
}

void QSpreadsheetHeaderView::mouseMoveEvent(QMouseEvent * event)
{
    QHeaderView::mouseMoveEvent(event);

    // Required to refresh the button menu enable/disable state.
    int logicalIndex = logicalIndexAt(event->pos());
    updateSection(logicalIndex);
}

void QSpreadsheetHeaderView::paintSection(QPainter *painter, const QRect &rect, int logicalIndex) const
{
    painter->save();

    QHeaderView::paintSection(painter, rect, logicalIndex);

    painter->restore();

    if (!rect.isValid() || isSortIndicatorShown())
        return;

    if (isSectionHidden(logicalIndex - 1)) {
        drawPrevButton(painter, logicalIndex);
    }

    if (isSectionHidden(logicalIndex + 1)) {
        drawNextButton(painter, logicalIndex);
    }

    QPoint pos = mapFromGlobal(QCursor::pos());
    if (rect.contains(pos)) {
        drawMenuButton(painter, logicalIndex, buttonMenuRect(logicalIndex).contains(pos));
    }
}

QRect QSpreadsheetHeaderView::sectionRect(int logicalIndex) const
{
    return QRect(sectionViewportPosition(logicalIndex), 0, sectionSize(logicalIndex), height());
}

QRect QSpreadsheetHeaderView::buttonMenuRect(int logicalIndex) const
{
    QRect sr = sectionRect(logicalIndex);

    return QRect(sr.right() - 5 - 13, sr.center().y() - 6, 13, 13);
}

QRect QSpreadsheetHeaderView::prevRect(int logicalIndex) const
{
    if (isSectionHidden(logicalIndex))
        return QRect();

    QRect sr = sectionRect(logicalIndex);

    return QRect(sr.left() + 1, sr.center().y() - 6, 13, 13);
}

QRect QSpreadsheetHeaderView::nextRect(int logicalIndex) const
{
    if (isSectionHidden(logicalIndex))
        return QRect();

    QRect sr = sectionRect(logicalIndex);

    return QRect(sr.right() - 13, sr.center().y() - 6, 13, 13);
}

void QSpreadsheetHeaderView::drawMenuButton(QPainter *painter, int logicalIndex, bool enabled) const
{
    QRect brect = buttonMenuRect(logicalIndex);

    painter->setPen(enabled ? QColor(186,186,186) : QColor(223, 223, 223));
    painter->setBrush(QColor(246,246,246));
    painter->drawRect(brect.adjusted(0,0,-1,-1));

    painter->setPen(enabled ? QColor(71,71,71) : QColor(193, 193, 193));
    painter->drawLine(brect.left()+3, brect.top()+5, brect.right()-3, brect.top()+5);
    painter->drawLine(brect.left()+4, brect.top()+6, brect.right()-4, brect.top()+6);
    painter->drawLine(brect.left()+5, brect.top()+7, brect.right()-5, brect.top()+7);
    painter->drawPoint(brect.left()+6, brect.top()+8);
}

void QSpreadsheetHeaderView::drawPrevButton(QPainter *painter, int logicalIndex) const
{
    QRect rect = prevRect(logicalIndex);

    painter->setPen(QColor(71,71,71));
    painter->drawLine(rect.left()+1, rect.center().y() - 3, rect.left()+1, rect.center().y() + 3);
    painter->drawLine(rect.left()+2, rect.center().y() - 2, rect.left()+2, rect.center().y() + 2);
    painter->drawLine(rect.left()+3, rect.center().y() - 1, rect.left()+3, rect.center().y() + 1);
    painter->drawPoint(rect.left()+4, rect.center().y());
}

void QSpreadsheetHeaderView::drawNextButton(QPainter *painter, int logicalIndex) const
{
    QRect rect = nextRect(logicalIndex);

    painter->setPen(QColor(71,71,71));
    painter->drawLine(rect.right()-2, rect.center().y() - 3, rect.right()-2, rect.center().y() + 3);
    painter->drawLine(rect.right()-3, rect.center().y() - 2, rect.right()-3, rect.center().y() + 2);
    painter->drawLine(rect.right()-4, rect.center().y() - 1, rect.right()-4, rect.center().y() + 1);
    painter->drawPoint(rect.right()-5, rect.center().y());
}
