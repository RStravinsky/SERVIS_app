#ifndef QSPREADSHEETHEADERVIEW
#define QSPREADSHEETHEADERVIEW

#include <QHeaderView>
#include <QCheckBox>
#include <QMenu>
#include <QSignalMapper>
#include <QWidgetAction>
#include <QMessageBox>
#include <QDebug>
#include "SortFilterProxyModel.h"

/*!
    \class QSpreadsheetHeaderView
    \brief The QSpreadsheetHeaderView class is a special QHeaderView that mimic Google Spreadsheet header.
    version 1.0
    \sa QHeaderView
*/
class QSpreadsheetHeaderView : public QHeaderView
{
    Q_OBJECT

public:
    QSpreadsheetHeaderView(Qt::Orientation orientation, int column_minimum, int column_maximum, QWidget * parent = 0);
    QAction * actions[23];
    int columns_min;
    int columns_max;
    bool set_checkbox;
    QMenu * menu;
    QAction *sortAZ;
    QAction *sortZA ;
    QAction *clear_sort;
    QAction *hideCol;
    QAction *clear_hideCol;
    QWidgetAction  * addition;
    QAction * previous_sender=NULL;
    bool freeze;
    int logicalIndex;
    bool * checked_columns=NULL;
    void check_hidden_column();

signals:
    void sendHiddenColums(bool * ichecked_columns);

protected:
    void mousePressEvent(QMouseEvent * event);
    void mouseMoveEvent(QMouseEvent * event);
    void paintSection(QPainter *painter, const QRect &rect, int logicalIndex) const;
    QRect sectionRect(int logicalIndex) const;
    QRect buttonMenuRect(int logicalIndex) const;
    QRect prevRect(int logicalIndex) const;
    QRect nextRect(int logicalIndex) const;
    void drawMenuButton(QPainter *painter, int logicalIndex, bool enabled) const;
    void drawPrevButton(QPainter *painter, int logicalIndex) const;
    void drawNextButton(QPainter *painter, int logicalIndex) const;

public slots:
    void action(QAction *action);

private slots:
    void hide_selected_column(bool checked);

private:

};

#endif // QSPREADSHEETHEADERVIEW

