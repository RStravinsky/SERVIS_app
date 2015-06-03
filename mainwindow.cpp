#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    installEventFilter(this);
    /* Information image */
    INFOlabel = new QLabel(this);
    QImage information("C:/Users/rstrawinski/Pictures/mark.png");
    INFOlabel->setPixmap(QPixmap::fromImage(information.scaled(30,30,Qt::KeepAspectRatio,Qt::FastTransformation)));
    INFOlabel->setVisible(false);

    ui->stackedWidget->setCurrentIndex(0);

    /* TOP FRAME *******************************************************************/

    /* Logo */
    QImage image("C:/Users/rstrawinski/Pictures/sigma_LOGO_3D.png");
    ui->logo_label->setPixmap(QPixmap::fromImage(image.scaled(120,120,Qt::KeepAspectRatio,Qt::FastTransformation)));

    /* Buttons */
    ui->Calendarbutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/calendar.png"));
    ui->Calendarbutton->setIconSize(QSize(40, 40));
    ui->Calendarbutton->setStyleSheet("QPushButton {border: none}");

    ui->Viewbutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/search.png"));
    ui->Viewbutton->setIconSize(QSize(40, 40));
    ui->Viewbutton->setStyleSheet("QPushButton {border: none}");

    ui->Editbutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/edit.png"));
    ui->Editbutton->setIconSize(QSize(40, 40));
    ui->Editbutton->setStyleSheet("QPushButton {border: none}");

    ui->Add_Removebutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/add.png"));
    ui->Add_Removebutton->setIconSize(QSize(40, 40));
    ui->Add_Removebutton->setStyleSheet("QPushButton {border: none}");

    ui->Creatorbutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/creator.png"));
    ui->Creatorbutton->setIconSize(QSize(40, 40));
    ui->Creatorbutton->setStyleSheet("QPushButton {border: none}");

    ui->Helpbutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/help.png"));
    ui->Helpbutton->setIconSize(QSize(40, 40));
    ui->Helpbutton->setStyleSheet("QPushButton {border: none}");

    ui->Notebutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/note.png"));
    ui->Notebutton->setIconSize(QSize(40, 40));
    ui->Notebutton->setStyleSheet("QPushButton {border: none}");

    ui->Logoutbutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/exit.png"));
    ui->Logoutbutton->setIconSize(QSize(40, 40));
    ui->Logoutbutton->setStyleSheet("QPushButton {border: none}");

    ui->Viewbutton->installEventFilter( this );
    ui->Editbutton->installEventFilter( this );
    ui->Add_Removebutton->installEventFilter( this );
    ui->Creatorbutton->installEventFilter( this );
    ui->Helpbutton->installEventFilter( this );
    ui->Notebutton->installEventFilter( this );
    ui->Logoutbutton->installEventFilter( this );
    ui->Calendarbutton->installEventFilter( this );
    ui->pushButton_submit_VIEW->installEventFilter( this );

    /* STATUS BAR *******************************************************************/

    QFont Status_Font("Calibri Light", 12, QFont::Light ,false);
    Statprogress = new QProgressBar(this);
    Statbutton = new QPushButton(this);
    Statlabel = new QLabel(this);
    Statlabel->setFont(Status_Font);
    Statbutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/info.png"));
    Statbutton->setIconSize(QSize(25, 25));
    Statbutton->setStyleSheet("QPushButton {border: none}");
    Statprogress->setStyleSheet("QProgressBar {"
                                            "background-color: qlineargradient(x1: 0, y1: 0, x2: 0, y2: 1,  stop: 0 #a6a6a6, stop: 0.08 #7f7f7f,stop: 0.39999 #717171, stop: 0.4 #626262,stop: 0.9 #4c4c4c, stop: 1 #333333);"
                                            "}"
                                             );
    Statprogress->setFont(Status_Font);
    QColor color(8, 140, 142, 255);
    QPalette p = Statprogress->palette();
    p.setColor(QPalette::Highlight,color);
    Statprogress->setPalette(p);

    ui->statusBar->addWidget(Statlabel);
    ui->statusBar->addPermanentWidget(Statprogress);
    ui->statusBar->addPermanentWidget(Statbutton);
    ui->statusBar->setFont(Status_Font);
    ui->statusBar->setStyleSheet("QStatusBar {"
                                      "background-color: qlineargradient(x1: 0, y1: 0, x2: 0, y2: 1,  stop: 0 #a6a6a6, stop: 0.08 #7f7f7f,stop: 0.39999 #717171, stop: 0.4 #626262,stop: 0.9 #4c4c4c, stop: 1 #333333);"
                                      "}"
                                       );

    /* signal & slots */
    connect(Statbutton, SIGNAL (released()), this, SLOT (info_button()));

    /* VIEW PAGE *******************************************************************/

    dynamic_table = new QString[1];
    before_column_additional=1;
    dynamic_table[0]="TEST";

    ui->ReturnButton_VIEW->setIcon(QIcon("C:/Users/rstrawinski/Pictures/return.png"));
    ui->ReturnButton_VIEW->setIconSize(QSize(40, 40));

    ui->SelectButton_VIEW->setIcon(QIcon("C:/Users/rstrawinski/Pictures/select_all.png"));
    ui->SelectButton_VIEW->setIconSize(QSize(20, 20));

    ui->Clearbutton_VIEW->setIcon(QIcon("C:/Users/rstrawinski/Pictures/clear_all.png"));
    ui->Clearbutton_VIEW->setIconSize(QSize(20, 20));

    ui->SubmitFilterbutton_VIEW->setIcon(QIcon("C:/Users/rstrawinski/Pictures/select_all.png"));
    ui->SubmitFilterbutton_VIEW->setIconSize(QSize(20, 20));

    ui->ClearFilterbutton_VIEW->setIcon(QIcon("C:/Users/rstrawinski/Pictures/clear_all.png"));
    ui->ClearFilterbutton_VIEW->setIconSize(QSize(20, 20));

    ui->ClearSearchbutton_VIEW->setIcon(QIcon("C:/Users/rstrawinski/Pictures/clear_all.png"));
    ui->ClearSearchbutton_VIEW->setIconSize(QSize(20, 20));

    ui->pushButton_submit_VIEW->setIcon(QIcon("C:/Users/rstrawinski/Pictures/accept.png"));
    ui->pushButton_submit_VIEW->setIconSize(QSize(35, 35));

    QImage arrow("C:/Users/rstrawinski/Pictures/arrow.png");
    ui->label_arrow_VIEW->setPixmap(QPixmap::fromImage(arrow.scaled(40,40,Qt::KeepAspectRatio,Qt::FastTransformation)));
    ui->label_arrow_VIEW->setEnabled(false);

    column_const = BRAK;
    column_additional = 0;
    column_all=0;
    sumbit_view=false;
    add_table_active=false;
    search_for_all=false;
    ui->tableView->setModel(0);
    ui->stackedWidget_2->setEnabled(false);
    ui->pushButton->setVisible(false);
    ui->pushButton_2->setVisible(false);
    ui->pushButton_3->setVisible(false);
    ui->pushButton_4->setVisible(false);
    ui->pushButton_5->setVisible(false);
    ui->pushButton_6->setVisible(false);
    ui->pushButton_7->setVisible(false);
    ui->pushButton_8->setVisible(false);
    ui->pushButton_9->setVisible(false);
    ui->pushButton_10->setVisible(false);
    ui->pushButton_11->setVisible(false);
    ui->ReturnButton_VIEW->setVisible(false);
    ui->label_add_table_VIEW->setVisible(false);
    ui->comboBox_which_column_VIEW->addItem("Wybierz kolumnę");
    create_comboBox();

    /* signal & slots */
    connect(ui->comboBox_which_column_VIEW, SIGNAL (activated(int)), this, SLOT (combobox_selected_column(int)));

    //ui->listWidget->setVisible(false);


}

MainWindow::~MainWindow()
{
    LoginDialog login;
    login.closeDB();
    delete ui;
}


const QString MainWindow::Sektor_checklist[3] = {"Miejsca", "Daneosobowe", "Maszyny"};
const QString MainWindow::Miejsca_checklist[4] = {"Sektory", "Daneosobowe", "Maszyny","Zlecenia"};

/* MAIN WINDOW ****************************************************************************/

void MainWindow::column_change(QModelIndex one,QModelIndex two)
{
 QMessageBox::information(this,"ZMIANA",last_error);
}

/*
 * reciveAccess() - slot to recive information from logindialog about access
*/

void MainWindow::receiveAccess(QString login,QString password)
{

   Statprogress->setValue(100);
   if(login=="root" && password=="sigmasa")
   {
       access=true;
       Statlabel->setText("<font color='white'>Połączono jako Admnistrator</font>");
       ui->Editbutton->setEnabled(true);
       ui->Add_Removebutton->setEnabled(true);
       ui->Creatorbutton->setEnabled(true);


   }
   else if(login=="serwis" && password=="serwisV1")
   {
       access=false;
       Statlabel->setText("<font color='white'>Połączono jako użytkownik</font>");
       ui->Editbutton->setEnabled(false);
       ui->Add_Removebutton->setEnabled(false);
       ui->Creatorbutton->setEnabled(false);
   }
}

/*
 * reciveEvent() - event to change size of some widgets when resizing
*/

void MainWindow::resizeEvent(QResizeEvent* event)
{
     if(event->type() == QEvent::Resize)
     {

        QFont f("Calibri Light", 11, QFont::Bold ,false);
        QFontMetrics metrics(f);
        QSize size = metrics.size(0, ui->label_clear_all_VIEW->text()); //Get size of text
        float factorw = ui->label_clear_all_VIEW->width() / (float)size.width(); //Get the width factor
        float factorh = ui->label_clear_all_VIEW->height() / (float)size.height(); //Get the height factor
        float factor = qMin(factorw, factorh);    //To fit contents in the screen select as factor
                                                  //the minimum factor between width and height

        f.setPointSizeF(f.pointSizeF() * factor); //Set font size
        ui->label_clear_all_VIEW->setFont(f); //Set the adjusted font to the label
        ui->label_select_all_VIEW->setFont(f);

        /* change position of INFOlabel */
        if(INFOlabel->isVisible()==true)
        {
            int height;
            int width;

            if(INFOlabel->y()<300)
            {
                height=ui->topFrame->size().height();
                width=ui->listWidget_VIEW->size().width();
                INFOlabel->setGeometry(width-50,height+25,30,30);
            }

            else if(INFOlabel->y()>=300)
            {
                width=ui->centralWidget->size().width();
                height=ui->centralWidget->size().height();
                INFOlabel->setGeometry(width-50,height-50,30,30);
            }

            INFOlabel->setVisible(true);
        }
    }

}


/*
 * info_button() - information about previous database error
*/
void MainWindow::info_button()
{
    if(last_error=="")  QMessageBox::information(this,"Informacja","Nie znaleziono błędów.");
    else QMessageBox::information(this,"Informacja",last_error);
}

/*
 * eventFilter() - event of main buttons
*/

bool MainWindow::eventFilter(QObject *obj, QEvent *event)
{
    if (obj == (QObject*)ui->Calendarbutton)
    {
            if (event->type() == QEvent::HoverEnter)
            {
                ui->Calendarbutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/calendar.png"));
                ui->Calendarbutton->setIconSize(QSize(45, 45));
                return true;

            } else if (event->type() == QEvent::HoverLeave)
            {
                ui->Calendarbutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/calendar.png"));
                ui->Calendarbutton->setIconSize(QSize(40, 40));
                return true;
            }

            else if (event->type() == QEvent::MouseButtonRelease)
            {
                ui->Calendarbutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/calendar.png"));
                ui->Calendarbutton->setIconSize(QSize(45, 45));
                return true;
            }

            else if (event->type() == QEvent::MouseButtonPress)
            {
                ui->Calendarbutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/calendar.png"));
                ui->Calendarbutton->setIconSize(QSize(30, 30));
                return true;
            }

    }


    if(event->type() == QEvent::WindowStateChange)
    {

        if( windowState() == Qt::WindowNoState )
            {
                this->resize(1024,768);
            }
    }

    if (obj == (QObject*)ui->Helpbutton)
    {
            if (event->type() == QEvent::HoverEnter)
            {
                ui->Helpbutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/help.png"));
                ui->Helpbutton->setIconSize(QSize(45, 45));
                return true;

            } else if (event->type() == QEvent::HoverLeave)
            {
                ui->Helpbutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/help.png"));
                ui->Helpbutton->setIconSize(QSize(40, 40));
                return true;
            }

            else if (event->type() == QEvent::MouseButtonRelease)
            {
                ui->Helpbutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/help.png"));
                ui->Helpbutton->setIconSize(QSize(45, 45));
                return true;
            }

            else if (event->type() == QEvent::MouseButtonPress)
            {
                ui->Helpbutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/help.png"));
                ui->Helpbutton->setIconSize(QSize(30, 30));
                return true;
            }

    }

    if (obj == (QObject*)ui->Notebutton)
    {
            if (event->type() == QEvent::HoverEnter)
            {
                ui->Notebutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/note.png"));
                ui->Notebutton->setIconSize(QSize(45, 45));
                return true;

            } else if (event->type() == QEvent::HoverLeave)
            {
                ui->Notebutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/note.png"));
                ui->Notebutton->setIconSize(QSize(40, 40));
                return true;
            }

            else if (event->type() == QEvent::MouseButtonRelease)
            {
                ui->Notebutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/note.png"));
                ui->Notebutton->setIconSize(QSize(45, 45));
                return true;
            }

            else if (event->type() == QEvent::MouseButtonPress)
            {
                ui->Notebutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/note.png"));
                ui->Notebutton->setIconSize(QSize(30, 30));
                return true;
            }

    }

    if (obj == (QObject*)ui->Logoutbutton)
    {
            if (event->type() == QEvent::HoverEnter)
            {
                ui->Logoutbutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/exit.png"));
                ui->Logoutbutton->setIconSize(QSize(45, 45));
                return true;

            } else if (event->type() == QEvent::HoverLeave)
            {
                ui->Logoutbutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/exit.png"));
                ui->Logoutbutton->setIconSize(QSize(40, 40));
                return true;
            }

            else if (event->type() == QEvent::MouseButtonRelease)
            {
                ui->Logoutbutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/exit.png"));
                ui->Logoutbutton->setIconSize(QSize(45, 45));
                qDebug() << "Performing application reboot...";
                qApp->exit( MainWindow::EXIT_CODE_REBOOT );
                return true;
            }

            else if (event->type() == QEvent::MouseButtonPress)
            {
                ui->Logoutbutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/exit.png"));
                ui->Logoutbutton->setIconSize(QSize(30, 30));
                return true;
            }

    }

    if (obj == (QObject*)ui->Viewbutton)
    {
            if (event->type() == QEvent::HoverEnter)
            {
                ui->Viewbutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/search.png"));
                ui->Viewbutton->setIconSize(QSize(45, 45));
                return true;

            } else if (event->type() == QEvent::HoverLeave)
            {
                ui->Viewbutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/search.png"));
                ui->Viewbutton->setIconSize(QSize(40, 40));
                return true;
            }

            else if (event->type() == QEvent::MouseButtonRelease)
            {
                ui->Viewbutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/search.png"));
                ui->Viewbutton->setIconSize(QSize(45, 45));
                ui->stackedWidget->setCurrentIndex(0);
                return true;
            }

            else if (event->type() == QEvent::MouseButtonPress)
            {
                ui->Viewbutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/search.png"));
                ui->Viewbutton->setIconSize(QSize(30, 30));
                return true;
            }

    }

    if(access==true)
    {

    if (obj == (QObject*)ui->Editbutton)
    {
            if (event->type() == QEvent::HoverEnter)
            {
                ui->Editbutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/edit.png"));
                ui->Editbutton->setIconSize(QSize(45, 45));
                return true;

            } else if (event->type() == QEvent::HoverLeave)
            {
                ui->Editbutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/edit.png"));
                ui->Editbutton->setIconSize(QSize(40, 40));
                return true;
            }

            else if (event->type() == QEvent::MouseButtonRelease)
            {
                ui->Editbutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/edit.png"));
                ui->Editbutton->setIconSize(QSize(45, 45));
                ui->stackedWidget->setCurrentIndex(1);
                Clear_VIEW();
                return true;
            }

            else if (event->type() == QEvent::MouseButtonPress)
            {
                ui->Editbutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/edit.png"));
                ui->Editbutton->setIconSize(QSize(30, 30));
                return true;
            }

    }

    if (obj == (QObject*)ui->Add_Removebutton)
    {
            if (event->type() == QEvent::HoverEnter)
            {
                ui->Add_Removebutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/add.png"));
                ui->Add_Removebutton->setIconSize(QSize(45, 45));

                return true;

            } else if (event->type() == QEvent::HoverLeave)
            {
                ui->Add_Removebutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/add.png"));
                ui->Add_Removebutton->setIconSize(QSize(40, 40));

                return false;
            }

            else if (event->type() == QEvent::MouseButtonRelease)
            {
                ui->Add_Removebutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/add.png"));
                ui->Add_Removebutton->setIconSize(QSize(45, 45));
                ui->stackedWidget->setCurrentIndex(2);
                return false;
            }

            if (event->type() == QEvent::MouseButtonPress)
            {
                ui->Add_Removebutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/add.png"));
                ui->Add_Removebutton->setIconSize(QSize(30, 30));
                return true;
            }

    }

    if (obj == (QObject*)ui->Creatorbutton)
    {

            if (event->type() == QEvent::HoverEnter)
            {
                ui->Creatorbutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/creator.png"));
                ui->Creatorbutton->setIconSize(QSize(45, 45));

                return true;

            } else if (event->type() == QEvent::HoverLeave)
            {
                ui->Creatorbutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/creator.png"));
                ui->Creatorbutton->setIconSize(QSize(40, 40));

                return false;
            }

            else if (event->type() == QEvent::MouseButtonRelease)
            {
                ui->Creatorbutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/creator.png"));
                ui->Creatorbutton->setIconSize(QSize(45, 45));
                ui->stackedWidget->setCurrentIndex(3);
                return false;
            }

        if (event->type() == QEvent::MouseButtonPress)
            {
                ui->Creatorbutton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/creator.png"));
                ui->Creatorbutton->setIconSize(QSize(30, 30));
                return true;
            }

    }

    }

    else
    {
        // pass the event on to the parent class

        return QMainWindow::eventFilter(obj, event);
    }


    return 0;
}

/* VIEW *********************************************************************************/

/*
 * create_comboBox - create comboBox for filter
*/

void MainWindow::create_comboBox()
{
    QFont Combo_font("Calibri Light", 14, QFont::Light ,false);
    comboBox_column_VIEW = new QComboBox(ui->stackedWidget);
    comboBox_column_VIEW->setFont(Combo_font);
    comboBox_column_VIEW->setGeometry(1210,23,231,31);
    comboBox_column_VIEW->addItem("Wybierz kolumnę");
    comboBox_column_VIEW->setVisible(true);
    comboBox_column_VIEW->setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Preferred);
    comboBox_column_VIEW->setMinimumWidth(170);
    comboBox_column_VIEW->setMaximumWidth(300);
    ui->horizontalLayout_FIND_COLUMN->insertWidget(2,comboBox_column_VIEW);
}

/*
 * listWidget ITEM CLICKED - visible arrow
*/

void MainWindow::on_listWidget_VIEW_clicked()
{
 ui->label_arrow_VIEW->setEnabled(true);
 ui->stackedWidget_2->setEnabled(true);
 INFOlabel->setVisible(false);
}


/*
 * listWidget ITEM CHANGE - Clear all parameter when index changed
*/

void MainWindow::on_listWidget_VIEW_currentRowChanged()
{
    ui->label_TEST->setText("ZRUJE");
    ui->listWidget->clear();
    ClearArray(dynamic_table);
    column_additional=0;
    before_column_additional=1;
    unselect_all_CHECKBOX();
}

/*
 * listWidget ITEM PRESS - connection between listWidet item and checkboxes
*/

void MainWindow::on_listWidget_VIEW_itemPressed(QListWidgetItem *item)
{

    if(ui->listWidget_VIEW->item(0)==item)
    {
        ui->stackedWidget_2->setCurrentIndex(0);
        main_table = "Sektory";
        column_const=Sektory;
    }
    else if(ui->listWidget_VIEW->item(1)==item)
    {
        ui->stackedWidget_2->setCurrentIndex(1);
        main_table = "Miejsca";
        column_const=Miejsca;
    }
    else if(ui->listWidget_VIEW->item(2)==item)
    {
      ui->stackedWidget_2->setCurrentIndex(2);
      main_table = "Daneosobowe";
      column_const=Pracownicy;
    }
    else if(ui->listWidget_VIEW->item(3)==item)
    {
      ui->stackedWidget_2->setCurrentIndex(3);
      main_table = "Maszyny";
      column_const= Maszyny;
    }
    else if(ui->listWidget_VIEW->item(4)==item)
    {
      ui->stackedWidget_2->setCurrentIndex(4);
      main_table = "Zlecenia";
      column_const= Zlecenia;
    }
    else if(ui->listWidget_VIEW->item(5)==item)
    {
      ui->stackedWidget_2->setCurrentIndex(5);
      main_table = "Konkurencja";
      column_const= Konkurencja;
    }
    else if(ui->listWidget_VIEW->item(6)==item)
    {
      ui->stackedWidget_2->setCurrentIndex(6);
      main_table = "WykazkkKooperantow";
      column_const= WykazKooperantow;
    }
    else if(ui->listWidget_VIEW->item(7)==item)
    {
      ui->stackedWidget_2->setCurrentIndex(7);
      main_table = "Raportyserwisowe";
      column_const= RaportySerwisowe;
    }
    else if(ui->listWidget_VIEW->item(8)==item)
    {
      ui->stackedWidget_2->setCurrentIndex(8);
      main_table = "Zgloszeniaserwisowe";
      column_const= ZgloszeniaSerwisowe;
    }
    else if(ui->listWidget_VIEW->item(9)==item)
    {
      ui->stackedWidget_2->setCurrentIndex(9);
      main_table = "Czesci";
      column_const= Czesci;
    }
    else if(ui->listWidget_VIEW->item(10)==item)
    {
      ui->stackedWidget_2->setCurrentIndex(10);
      main_table = "Klienci";
      column_const= Klienci;
    }

}

/*
 * unselect_all_CHECKBOX() - unselect all chcecbox in VIEW
*/
void MainWindow::unselect_all_CHECKBOX()
{
ui->checkBox_miejsca_SEKTOR->setChecked(false);
ui->checkBox_daneosobowe_SEKTOR->setChecked(false);
ui->checkBox_maszyny_SEKTOR->setChecked(false);
ui->checkBox_daneosobowe_MIEJSCA->setChecked(false);
ui->checkBox_sektor_MIEJSCA->setChecked(false);
ui->checkBox_maszyny_MIEJSCA->setChecked(false);
ui->checkBox_zlecenia_MIEJSCA->setChecked(false);
}

/*
 * SELECT ALL - select checkboxes
*/
void MainWindow::on_SelectButton_VIEW_clicked()
{

if(ui->stackedWidget_2->isEnabled()==true)
{
    ClearArray(dynamic_table);
    column_additional=0;
    before_column_additional=1;

    if(ui->stackedWidget_2->currentIndex()==Sektory_idx)
    {
        ui->checkBox_miejsca_SEKTOR->setChecked( true );
        ui->checkBox_daneosobowe_SEKTOR->setChecked( true );
        ui->checkBox_maszyny_SEKTOR->setChecked( true );

        FillArray(dynamic_table, Sektor_checklist, 3);
        for(int i=0;i<3;i++)
        {
            ui->listWidget->addItem(dynamic_table[i]);
        }

    }

    if(ui->stackedWidget_2->currentIndex()==Miejsca_idx)
    {
        ui->checkBox_sektor_MIEJSCA->setChecked( true );
        ui->checkBox_daneosobowe_MIEJSCA->setChecked( true );
        ui->checkBox_maszyny_MIEJSCA->setChecked( true );
        ui->checkBox_zlecenia_MIEJSCA->setChecked( true );

        FillArray(dynamic_table, Miejsca_checklist, 4);
        for(int i=0;i<4;i++)
        {
            ui->listWidget->addItem(dynamic_table[i]);
        }


    }

}
else {
    QMessageBox::information(this,"Informacja", "Proszę wybrać tabelę z listy.");
    int height;
    int width;
    height=ui->topFrame->size().height();
    width=ui->listWidget_VIEW->size().width();
    INFOlabel->setGeometry(width-50,height+25,30,30);
    INFOlabel->setVisible(true);
    }
}

/*
 * CLEAR ALL - clear checkboxes
*/

void MainWindow::on_Clearbutton_VIEW_clicked()
{
if(ui->stackedWidget_2->isEnabled()==true)
{
    ClearArray(dynamic_table);
    column_additional=0;
    before_column_additional=1;  
    unselect_all_CHECKBOX();
    /*
    if(ui->stackedWidget_2->currentIndex()==Sektory_idx)
    {
        ui->checkBox_miejsca_SEKTOR->setChecked( false );
        ui->checkBox_pracownicy_SEKTOR->setChecked( false );
        ui->checkBox_maszyny_SEKTOR->setChecked( false );
    }

    if(ui->stackedWidget_2->currentIndex()==Miejsca_idx)
    {
        ui->checkBox_sektor_MIEJSCA->setChecked( false );
        ui->checkBox_pracownicy_MIEJSCA->setChecked( false );
        ui->checkBox_maszyny_MIEJSCA->setChecked( false );
        ui->checkBox_zlecenia_MIEJSCA->setChecked( false );
    }
    */
}
else {
    QMessageBox::information(this,"Informacja", "Proszę wybrać tabelę z listy.");
    int height;
    int width;
    height=ui->topFrame->size().height();
    width=ui->listWidget_VIEW->size().width();
    INFOlabel->setGeometry(width-50,height+25,30,30);
    INFOlabel->setVisible(true);}
}

/*
 * CLEAR VIEW - clear all VIEW variables
*/
void MainWindow::Clear_VIEW()
{
 INFOlabel->setVisible(false);
 main_table="";
 main_view="";
 column_const = BRAK;
 column_additional = 0;
 column_all=0;
 sumbit_view=false;
 //ui->listWidget->setVisible(false);
 ui->listWidget_VIEW->clearSelection();
 ui->label_arrow_VIEW->setEnabled(false);
 ui->stackedWidget_2->setEnabled(false);
 ui->pushButton->setVisible(false);
 ui->pushButton_2->setVisible(false);
 ui->pushButton_3->setVisible(false);
 ui->pushButton_4->setVisible(false);
 ui->pushButton_5->setVisible(false);
 ui->pushButton_6->setVisible(false);
 ui->pushButton_7->setVisible(false);
 ui->pushButton_8->setVisible(false);
 ui->pushButton_9->setVisible(false);
 ui->pushButton_10->setVisible(false);
 ui->pushButton_11->setVisible(false);
 ui->ReturnButton_VIEW->setVisible(false);
 ui->label_add_table_VIEW->setVisible(false);
 unselect_all_CHECKBOX();
 ui->lineEdit_Filtr_VIEW->setText("");
 if(sumbit_view==true)
 {
     model->clear();
     proxy->clear();
     delete proxy;
     delete model;
 }
 ui->comboBox_which_column_VIEW->clear();
 ui->comboBox_which_column_VIEW->addItem("Wybierz kolumnę");
 ui->tableView->setModel(0);
 delete comboBox_column_VIEW;

 create_comboBox();

}

/*
 * combobox_selected_column - slot which connect comboboxes
*/

void MainWindow::combobox_selected_column(int index)
{
    if(index!=0)
    {
        comboBox_column_VIEW->setModel(proxy);
        comboBox_column_VIEW->setModelColumn(index-1);
    }

    else if(index==0)
    {
        delete comboBox_column_VIEW;
        create_comboBox();
    }
}


/*
 * View_button_visible - make visible button depend of selected checkboxes
*/
void MainWindow::View_button_visible()
{

    ui->pushButton->setVisible(false);
    ui->pushButton_2->setVisible(false);
    ui->pushButton_3->setVisible(false);

    ui->label_TEST->setText(QString::number(column_additional));

    if(column_additional==0)
    {
        ui->label_add_table_VIEW->setVisible(false);
        ui->ReturnButton_VIEW->setVisible(false);
    }
    if(column_additional>=1)
    {
        ui->pushButton->setVisible(true);
        ui->pushButton->setText(dynamic_table[0]);
    }
    if(column_additional>=2)
    {
        ui->pushButton_2->setVisible(true);
        ui->pushButton_2->setText(dynamic_table[1]);
    }
    if(column_additional>=3)
    {
        ui->pushButton_3->setVisible(true);
        ui->pushButton_3->setText(dynamic_table[2]);
    }
    if(column_additional>=4)
    {
        ui->pushButton_4->setVisible(true);
        ui->pushButton_4->setText(dynamic_table[3]);
    }
    if(column_additional>=5)
    {
        ui->pushButton_5->setVisible(true);
        ui->pushButton_5->setText(dynamic_table[4]);
    }
    if(column_additional>=6)
    {
        ui->pushButton_6->setVisible(true);
        ui->pushButton_6->setText(dynamic_table[5]);
    }
    if(column_additional>=7)
    {
        ui->pushButton_7->setVisible(true);
        ui->pushButton_7->setText(dynamic_table[6]);
    }
    if(column_additional>=8)
    {
        ui->pushButton_8->setVisible(true);
        ui->pushButton_8->setText(dynamic_table[7]);
    }
    if(column_additional>=9)
    {
        ui->pushButton_9->setVisible(true);
        ui->pushButton_9->setText(dynamic_table[8]);
    }
    if(column_additional>=10)
    {
        ui->pushButton_10->setVisible(true);
        ui->pushButton_10->setText(dynamic_table[9]);
    }
    if(column_additional>=11)
    {
        ui->pushButton_11->setVisible(true);
        ui->pushButton_11->setText(dynamic_table[10]);
    }
}

/*
 * SUMBIT FOR VIEW !!!
*/

void MainWindow::on_pushButton_submit_VIEW_clicked()
{

if(ui->stackedWidget_2->isEnabled()==true)
{
    clear_add_button();
    add_table_active=false;

    INFOlabel->setVisible(false);
    sumbit_view=true;
    column_all = column_const + column_additional;
    QString s = QString::number(column_all);
    ui->label_TEST->setText(s);

    ui->ReturnButton_VIEW->setVisible(true);
    ui->label_add_table_VIEW->setVisible(true);

    std::sort(dynamic_table,dynamic_table+column_additional);

    ui->listWidget->clear();
    for(int i=0;i<column_additional;i++)
    {
        ui->listWidget->addItem(dynamic_table[i]);
    }

    model = new QSqlTableModel;
    model->setEditStrategy(QSqlTableModel::OnManualSubmit);

    View_button_visible();

    for(int i=0;i<column_additional;i++)
    {
        dynamic_table[i] = dynamic_table[i].remove(" ");
    }

    view=main_table;
    for(int i=0;i<column_additional;i++)
    {
        view+="_"+dynamic_table[i];
    }
    view=view+"_Widok";

    main_view=view;
    ui->label_TEST->setText(view);

    //ui->tableView->setModel(view);
    model->setTable(view);

    model->select();
    proxy = new QSortFilterProxyModel(this);
    proxy->setDynamicSortFilter(true);
    proxy->setSourceModel(model);
    proxy->setFilterKeyColumn(-1);
    ui->tableView->setModel(proxy);
    ui->tableView->setEditTriggers(QAbstractItemView::NoEditTriggers);
    ui->tableView->setSelectionMode(QAbstractItemView::SingleSelection);
    ui->tableView->horizontalHeader()->setSectionResizeMode(QHeaderView::Stretch);
    ui->tableView->verticalHeader()->setFixedWidth(50);
    //ui->tableView->setColumnHidden(0,true);


    /*inicjalizacja comoboxa COLUMN*/
    delete comboBox_column_VIEW;

    create_comboBox();
    /************/

    /*inicjalizacja comoboxa WHICH*/
    ui->comboBox_which_column_VIEW->clear();
    ui->comboBox_which_column_VIEW->addItem("Wybierz kolumnę");
    QStringList headers;
    for(int i = 0; i < proxy->columnCount(); i++)
    {
      headers.append(proxy->headerData(i, Qt::Horizontal).toString());
    }
    ui->comboBox_which_column_VIEW->addItems(headers);
    /************/


}
else {
    QMessageBox::information(this,"Informacja", "Proszę wybrać tabelę z listy.");
    int height;
    int width;
    height=ui->topFrame->size().height();
    width=ui->listWidget_VIEW->size().width();
    INFOlabel->setGeometry(width-50,height+25,30,30);
    INFOlabel->setVisible(true);}
}

/*
 * Fill array
*/
void MainWindow::FillArray(QString *& Array, const QString * Array_checklist, int size)
{

    QString * newArray = new QString[size];
    for(int i=0;i<size;i++)
    {
        newArray[i]=Array_checklist[i];
    }
    delete[] Array;
    Array=newArray;

    column_additional=size;
    before_column_additional=size-1;
}

/*
 * Clear array
*/

void MainWindow::ClearArray(QString *& Array)
{
  QString * newArray = new QString[1];
  newArray[0]="TEST";
  delete[] Array;
  Array=newArray;
  ui->listWidget->clear();
}

/*
 * Resize array
*/

void MainWindow::ResizeArray(QString *&Array, int size, int newsize, QString tableName, bool direction)
{
    QString * newArray = new QString[newsize];
    int idx_DELETE=0;
    int l=0;
    int inc_old_idx=0;

    /* add elements */
    if(direction==true)
    {
        for (int l = 0; l < size; l++) newArray[l] = Array[l];
        newArray[newsize-1] = tableName;
    }

    /* remove elements */
    else if(direction==false)
    {
        for (l = 0; l < newsize; l++)
        {
            if(Array[l]==tableName) idx_DELETE=l; //find index position for remove
        }

        l=0;
        while(l<size)
            {
            if(inc_old_idx==0)
                {
                if(l==idx_DELETE)
                    {
                    inc_old_idx=1;
                    continue;
                    }
                }
                newArray[l] = Array[l+inc_old_idx];
                l++;
            }


      }

    delete[] Array;
    Array=newArray;

}

/*
 * checkbox_select - add and remove selected checbox to/from dynamic_table[]
*/

void MainWindow::checkbox_select(bool checked, QString tableName)
{

    if(column_additional!=0)before_column_additional = column_additional;

    if(checked==true)
    {
        column_additional=column_additional+1;
        ResizeArray(dynamic_table,before_column_additional,column_additional,tableName,true);
    }

    else if(checked==false)
    {
        column_additional=column_additional-1;
        ResizeArray(dynamic_table,column_additional,before_column_additional,tableName,false);

    }

}

/*
 * open_additional_table - opening table selected in checkboxes
*/
void MainWindow::open_additional_table(QString tableName)
{

    view=tableName+"_"+main_table+"_Widok";
    ui->label_TEST->setText(view);

    model = new QSqlTableModel;
    model->setEditStrategy(QSqlTableModel::OnManualSubmit);

    model->setTable(view);

    model->select();
    proxy = new QSortFilterProxyModel(this);
    proxy->setDynamicSortFilter(true);
    proxy->setSourceModel(model);
    proxy->setFilterKeyColumn(-1);
    ui->tableView->setModel(proxy);
    ui->tableView->setEditTriggers(QAbstractItemView::NoEditTriggers);
    ui->tableView->setSelectionMode(QAbstractItemView::SingleSelection);
    ui->tableView->horizontalHeader()->setSectionResizeMode(QHeaderView::Stretch);
    ui->tableView->verticalHeader()->setFixedWidth(50);
    //ui->tableView->setColumnHidden(0,true);

    /*inicjalizacja comoboxa COLUMN*/
    delete comboBox_column_VIEW;
    create_comboBox();
    /************/

    /*inicjalizacja comoboxa WHICH*/
    ui->comboBox_which_column_VIEW->clear();
    ui->comboBox_which_column_VIEW->addItem("Wybierz kolumnę");
    QStringList headers;
    for(int i = 0; i < proxy->columnCount(); i++)
    {
      headers.append(proxy->headerData(i, Qt::Horizontal).toString());
    }
    ui->comboBox_which_column_VIEW->addItems(headers);
    /************/
}


/* FILTER FOR VIEW *******************************************/

void MainWindow::on_lineEdit_Filtr_VIEW_textChanged(const QString &arg1)
{
if(search_for_all==true)
    {
    if(sumbit_view==true)
    {
        QRegExp regExp(arg1, Qt::CaseInsensitive, QRegExp::Wildcard);
        proxy->setFilterRegExp(regExp);
        delete comboBox_column_VIEW;

        create_comboBox();
        ui->comboBox_which_column_VIEW->setCurrentIndex(0);
    }
    else
    {
        if(arg1!="")
        {
            if(ui->stackedWidget_2->isEnabled()==true)
                {
                QMessageBox::information(this,"Informacja", "Brak tabeli. Proszę zatwierdzić");
                int width,high;
                width=ui->centralWidget->size().width();
                high=ui->centralWidget->size().height();
                INFOlabel->setGeometry(width-50,high-50,30,30);
                }
            else if(ui->stackedWidget_2->isEnabled()==false)
                {
                QMessageBox::information(this,"Informacja", "Brak tabeli. Proszę wybrać tabelę, a następnie zatwierdzić");
                int height;
                int width;
                height=ui->topFrame->size().height();
                width=ui->listWidget_VIEW->size().width();
                INFOlabel->setGeometry(width-50,height+25,30,30);
                }
        INFOlabel->setVisible(true);
        ui->lineEdit_Filtr_VIEW->setText("");
        }
    }
    }
else
    {

    }
}

void MainWindow::on_SubmitFilterbutton_VIEW_clicked()
{
    if(sumbit_view==true)
    {
        QString arg1;
        arg1=comboBox_column_VIEW->currentText();
        if(arg1!="Wybierz kolumnę")
        {
            QRegExp regExp(arg1, Qt::CaseInsensitive, QRegExp::Wildcard);
            proxy->setFilterRegExp(regExp);
        }
    }
    else
    {
        if(ui->stackedWidget_2->isEnabled()==true)
            {
            QMessageBox::information(this,"Informacja", "Brak tabeli. Proszę zatwierdzić");
            int width,high;
            width=ui->centralWidget->size().width();
            high=ui->centralWidget->size().height();
            INFOlabel->setGeometry(width-50,high-50,30,30);
            }
        else if(ui->stackedWidget_2->isEnabled()==false)
            {
            QMessageBox::information(this,"Informacja", "Brak tabeli. Proszę wybrać tabelę, a następnie zatwierdzić");
            int height;
            int width;
            height=ui->topFrame->size().height();
            width=ui->listWidget_VIEW->size().width();
            INFOlabel->setGeometry(width-50,height+25,30,30);
            }
        INFOlabel->setVisible(true);
    }

}

void MainWindow::on_ClearFilterbutton_VIEW_clicked()
{
if(sumbit_view==true)
{
    QRegExp regExp("", Qt::CaseInsensitive, QRegExp::Wildcard);
    proxy->setFilterRegExp(regExp);
    delete comboBox_column_VIEW;

    create_comboBox();

    ui->comboBox_which_column_VIEW->setCurrentIndex(0);
}
else
{
    if(ui->stackedWidget_2->isEnabled()==true)
        {
        QMessageBox::information(this,"Informacja", "Brak tabeli. Proszę zatwierdzić");
        int width,high;
        width=ui->centralWidget->size().width();
        high=ui->centralWidget->size().height();
        INFOlabel->setGeometry(width-50,high-50,30,30);
        }
    else if(ui->stackedWidget_2->isEnabled()==false)
        {
        QMessageBox::information(this,"Informacja", "Brak tabeli. Proszę wybrać tabelę, a następnie zatwierdzić");
        int height;
        int width;
        height=ui->topFrame->size().height();
        width=ui->listWidget_VIEW->size().width();
        INFOlabel->setGeometry(width-50,height+25,30,30);
        }
    INFOlabel->setVisible(true);
}
}

void MainWindow::on_ClearSearchbutton_VIEW_clicked()
{
    if(sumbit_view==true)
    {
        ui->lineEdit_Filtr_VIEW->clear();
        QRegExp regExp("", Qt::CaseInsensitive, QRegExp::Wildcard);
        proxy->setFilterRegExp(regExp);
        delete comboBox_column_VIEW;

        create_comboBox();

        ui->comboBox_which_column_VIEW->setCurrentIndex(0);
    }
    else
    {
        if(ui->stackedWidget_2->isEnabled()==true)
            {
            QMessageBox::information(this,"Informacja", "Brak tabeli. Proszę zatwierdzić");
            int width,high;
            width=ui->centralWidget->size().width();
            high=ui->centralWidget->size().height();
            INFOlabel->setGeometry(width-50,high-50,30,30);
            }
        else if(ui->stackedWidget_2->isEnabled()==false)
            {
            QMessageBox::information(this,"Informacja", "Brak tabeli. Proszę wybrać tabelę, a następnie zatwierdzić");
            int height;
            int width;
            height=ui->topFrame->size().height();
            width=ui->listWidget_VIEW->size().width();
            INFOlabel->setGeometry(width-50,height+25,30,30);
            }
        INFOlabel->setVisible(true);
    }
}

/* Checkbox for SEKTOR *******************************************/

void MainWindow::on_checkBox_miejsca_SEKTOR_clicked(bool checked)
{
    checkbox_select(checked, "Miejsca");

    ui->listWidget->clear();
    for(int i=0;i<column_additional;i++)
    {
        ui->listWidget->addItem(dynamic_table[i]);
    }
}

void MainWindow::on_checkBox_daneosobowe_SEKTOR_clicked(bool checked)
{
    checkbox_select(checked, "Dane osobowe");

    ui->listWidget->clear();
    for(int i=0;i<column_additional;i++)
    {
        ui->listWidget->addItem(dynamic_table[i]);
    }
}

void MainWindow::on_checkBox_maszyny_SEKTOR_clicked(bool checked)
{
    checkbox_select(checked, "Maszyny");

    ui->listWidget->clear();
    for(int i=0;i<column_additional;i++)
    {
        ui->listWidget->addItem(dynamic_table[i]);
    }
}

/* ***************************************************************/

/* Checkbox for MIEJSCA ******************************************/

void MainWindow::on_checkBox_sektor_MIEJSCA_clicked(bool checked)
{
    checkbox_select(checked,"Sektory");
    ui->listWidget->clear();
    for(int i=0;i<column_additional;i++)
    {
        ui->listWidget->addItem(dynamic_table[i]);
    }
}

void MainWindow::on_checkBox_daneosobowe_MIEJSCA_clicked(bool checked)
{
    checkbox_select(checked,"Dane osobowe");
    ui->listWidget->clear();
    for(int i=0;i<column_additional;i++)
    {
        ui->listWidget->addItem(dynamic_table[i]);
    }
}

void MainWindow::on_checkBox_maszyny_MIEJSCA_clicked(bool checked)
{
    checkbox_select(checked,"Maszyny");
    ui->listWidget->clear();
    for(int i=0;i<column_additional;i++)
    {
        ui->listWidget->addItem(dynamic_table[i]);
    }
}

void MainWindow::on_checkBox_zlecenia_MIEJSCA_clicked(bool checked)
{
     checkbox_select(checked,"Zlecenia");
     ui->listWidget->clear();
     for(int i=0;i<column_additional;i++)
     {
         ui->listWidget->addItem(dynamic_table[i]);
     }
}

/*****************************************************************/


void MainWindow::on_pushButton_clicked()
{
    clear_add_button();
    QString button_name;
    add_table_active=true;
    button_name= ui->pushButton->text();
    if(button_name=="Części") button_name="Czesci";
    button_name = button_name.remove(" ");
    open_additional_table(button_name);
    ui->pushButton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/select_all.png"));
    ui->pushButton->setIconSize(QSize(20, 20));
}

void MainWindow::on_pushButton_2_clicked()
{
    clear_add_button();
    QString button_name;
    add_table_active=true;
    button_name= ui->pushButton_2->text();
    if(button_name=="Części") button_name="Czesci";
    button_name = button_name.remove(" ");
    open_additional_table(button_name);
    ui->pushButton_2->setIcon(QIcon("C:/Users/rstrawinski/Pictures/select_all.png"));
    ui->pushButton_2->setIconSize(QSize(20, 20));
}

void MainWindow::on_pushButton_3_clicked()
{
    clear_add_button();
    QString button_name;
    add_table_active=true;
    button_name= ui->pushButton_3->text();
    if(button_name=="Części") button_name="Czesci";
    button_name = button_name.remove(" ");
    open_additional_table(button_name);
    ui->pushButton_3->setIcon(QIcon("C:/Users/rstrawinski/Pictures/select_all.png"));
    ui->pushButton_3->setIconSize(QSize(20, 20));

}

void MainWindow::on_pushButton_4_clicked()
{
    clear_add_button();
    QString button_name;
    add_table_active=true;
    button_name= ui->pushButton_4->text();
    if(button_name=="Części") button_name="Czesci";
    button_name = button_name.remove(" ");
    open_additional_table(button_name);
    ui->pushButton_4->setIcon(QIcon("C:/Users/rstrawinski/Pictures/select_all.png"));
    ui->pushButton_4->setIconSize(QSize(20, 20));
}

void MainWindow::on_pushButton_5_clicked()
{
    clear_add_button();
    QString button_name;
    add_table_active=true;
    button_name= ui->pushButton_5->text();
    if(button_name=="Części") button_name="Czesci";
    button_name = button_name.remove(" ");
    open_additional_table(button_name);
    ui->pushButton_5->setIcon(QIcon("C:/Users/rstrawinski/Pictures/select_all.png"));
    ui->pushButton_5->setIconSize(QSize(20, 20));
}

void MainWindow::on_pushButton_6_clicked()
{
    clear_add_button();
    QString button_name;
    add_table_active=true;
    button_name= ui->pushButton_6->text();
    if(button_name=="Części") button_name="Czesci";
    button_name = button_name.remove(" ");
    open_additional_table(button_name);
    ui->pushButton_6->setIcon(QIcon("C:/Users/rstrawinski/Pictures/select_all.png"));
    ui->pushButton_6->setIconSize(QSize(20, 20));
}

void MainWindow::on_pushButton_7_clicked()
{
    clear_add_button();
    QString button_name;
    add_table_active=true;
    button_name= ui->pushButton_7->text();
    if(button_name=="Części") button_name="Czesci";
    button_name = button_name.remove(" ");
    open_additional_table(button_name);
    ui->pushButton_7->setIcon(QIcon("C:/Users/rstrawinski/Pictures/select_all.png"));
    ui->pushButton_7->setIconSize(QSize(20, 20));
}

void MainWindow::on_pushButton_8_clicked()
{
    clear_add_button();
    QString button_name;
    add_table_active=true;
    button_name= ui->pushButton_8->text();
    if(button_name=="Części") button_name="Czesci";
    button_name = button_name.remove(" ");
    open_additional_table(button_name);
    ui->pushButton_8->setIcon(QIcon("C:/Users/rstrawinski/Pictures/select_all.png"));
    ui->pushButton_8->setIconSize(QSize(20, 20));

}

void MainWindow::on_pushButton_9_clicked()
{
    clear_add_button();
    QString button_name;
    add_table_active=true;
    button_name= ui->pushButton_9->text();
    if(button_name=="Części") button_name="Czesci";
    button_name = button_name.remove(" ");
    open_additional_table(button_name);
    ui->pushButton_9->setIcon(QIcon("C:/Users/rstrawinski/Pictures/select_all.png"));
    ui->pushButton_9->setIconSize(QSize(20, 20));
}

void MainWindow::on_pushButton_10_clicked()
{
    clear_add_button();
    QString button_name;
    add_table_active=true;
    button_name= ui->pushButton_10->text();
    if(button_name=="Części") button_name="Czesci";
    button_name = button_name.remove(" ");
    open_additional_table(button_name);
    ui->pushButton_10->setIcon(QIcon("C:/Users/rstrawinski/Pictures/select_all.png"));
    ui->pushButton_10->setIconSize(QSize(20, 20));
}

void MainWindow::on_pushButton_11_clicked()
{
    clear_add_button();
    QString button_name;
    add_table_active=true;
    button_name= ui->pushButton_11->text();
    if(button_name=="Części") button_name="Czesci";
    button_name = button_name.remove(" ");
    open_additional_table(button_name);
    ui->pushButton_11->setIcon(QIcon("C:/Users/rstrawinski/Pictures/select_all.png"));
    ui->pushButton_11->setIconSize(QSize(20, 20));
}

void MainWindow::clear_add_button()
{
    ui->pushButton->setIcon(QIcon());
    ui->pushButton_2->setIcon(QIcon());
    ui->pushButton_3->setIcon(QIcon());
    ui->pushButton_4->setIcon(QIcon());
    ui->pushButton_5->setIcon(QIcon());
    ui->pushButton_6->setIcon(QIcon());
    ui->pushButton_7->setIcon(QIcon());
    ui->pushButton_8->setIcon(QIcon());
    ui->pushButton_9->setIcon(QIcon());
    ui->pushButton_10->setIcon(QIcon());
    ui->pushButton_11->setIcon(QIcon());
}

void MainWindow::on_ReturnButton_VIEW_clicked()
{

if(add_table_active==true)
{

    clear_add_button();
    ui->label_TEST->setText(main_view);

    model = new QSqlTableModel;
    model->setEditStrategy(QSqlTableModel::OnManualSubmit);

    model->setTable(main_view);

    model->select();
    proxy = new QSortFilterProxyModel(this);
    proxy->setDynamicSortFilter(true);
    proxy->setSourceModel(model);
    proxy->setFilterKeyColumn(-1);
    ui->tableView->setModel(proxy);
    ui->tableView->setEditTriggers(QAbstractItemView::NoEditTriggers);
    ui->tableView->setSelectionMode(QAbstractItemView::SingleSelection);
    ui->tableView->horizontalHeader()->setSectionResizeMode(QHeaderView::Stretch);
    ui->tableView->verticalHeader()->setFixedWidth(50);

    /*inicjalizacja comoboxa COLUMN*/
    delete comboBox_column_VIEW;
    create_comboBox();
    /************/

    /*inicjalizacja comoboxa WHICH*/
    ui->comboBox_which_column_VIEW->clear();
    ui->comboBox_which_column_VIEW->addItem("Wybierz kolumnę");
    QStringList headers;
    for(int i = 0; i < proxy->columnCount(); i++)
    {
      headers.append(proxy->headerData(i, Qt::Horizontal).toString());
    }
    ui->comboBox_which_column_VIEW->addItems(headers);
    /************/

    add_table_active=false;

  }
 else
    {
          QMessageBox::information(this,"Informacja", "Przycisk nie aktywny. Nie wybrano tabeli dodatkowej.");
    }

}

void MainWindow::on_checkBox_clicked(bool checked)
{
    search_for_all=true;
}


