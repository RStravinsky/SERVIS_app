#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QStandardItem>

#define DEBUG_ACTIVE false
#define MAX_COLUMNS  23

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    path=dir.absolutePath();

    ui->stackedWidget->setCurrentIndex(0);

    /* Information image */
    INFOlabel = new QLabel(this);
    QImage information(path + "/obrazy/mark.png");
    INFOlabel->setPixmap(QPixmap::fromImage(information.scaled(30,30,Qt::KeepAspectRatio,Qt::FastTransformation)));
    INFOlabel->setVisible(false);

    /* TOP FRAME *******************************************************************/

    /* Logo */
    QImage image(path + "/obrazy/sigma_LOGO_3D.png");
    ui->logo_label->setPixmap(QPixmap::fromImage(image.scaled(120,120,Qt::KeepAspectRatio,Qt::FastTransformation)));

    /* Buttons */
    ui->Calendarbutton->setIcon(QIcon(path + "/obrazy/calendar.png"));
    ui->Calendarbutton->setIconSize(QSize(40, 40));
    ui->Calendarbutton->setStyleSheet("QPushButton {border: none}");

    ui->Viewbutton->setIcon(QIcon(path + "/obrazy/search.png"));
    ui->Viewbutton->setIconSize(QSize(40, 40));

    ui->Viewbutton->setStyleSheet("QPushButton {"
                                  "background-color: qlineargradient(cx: 0.3, cy: -0.4,fx: 0.3, fy: -0.4,radius: 1.35, stop: 0 #fff, stop: 1 #888);"
                                  "}"
                                   );

    ui->Add_Removebutton->setIcon(QIcon(path + "/obrazy/add.png"));
    ui->Add_Removebutton->setIconSize(QSize(40, 40));
    ui->Add_Removebutton->setStyleSheet("QPushButton {border: none}");

    ui->Helpbutton->setIcon(QIcon(path + "/obrazy/help.png"));
    ui->Helpbutton->setIconSize(QSize(40, 40));
    ui->Helpbutton->setStyleSheet("QPushButton {border: none}");

    ui->Backupbutton->setIcon(QIcon(path + "/obrazy/backup.png"));
    ui->Backupbutton->setIconSize(QSize(40, 40));
    ui->Backupbutton->setStyleSheet("QPushButton {border: none}");

    ui->Logoutbutton->setIcon(QIcon(path + "/obrazy/exit.png"));
    ui->Logoutbutton->setIconSize(QSize(40, 40));
    ui->Logoutbutton->setStyleSheet("QPushButton {border: none}");

    ui->Viewbutton->installEventFilter( this );
    ui->Add_Removebutton->installEventFilter( this );
    ui->Helpbutton->installEventFilter( this );
    ui->Backupbutton->installEventFilter( this );
    ui->Logoutbutton->installEventFilter( this );
    ui->Calendarbutton->installEventFilter( this );
    ui->tableView_ADD->installEventFilter(this);

    /* STATUS BAR *******************************************************************/

    QFont Status_Font("Calibri Light", 12, QFont::Light ,false);
    Statprogress = new QProgressBar(this);
    Statbutton = new QPushButton(this);
    Statlabel = new QLabel(this);
    Statlabel->setFont(Status_Font);
    Statbutton->setIcon(QIcon(path + "/obrazy/info.png"));
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

    ui->pushButton_submit_filter_VIEW->setIcon(QIcon(path + "/obrazy/select_all.png"));
    ui->pushButton_submit_filter_VIEW->setIconSize(QSize(20, 20));

    ui->pushButton_clear_filter_VIEW->setIcon(QIcon(path + "/obrazy/clear_all.png"));
    ui->pushButton_clear_filter_VIEW->setIconSize(QSize(20, 20));

    ui->pushButton_clear_search_VIEW->setIcon(QIcon(path + "/obrazy/clear_all.png"));
    ui->pushButton_clear_search_VIEW->setIconSize(QSize(20, 20));

    QImage arrow(path + "/obrazy/arrow.png");
    ui->label_arrow_VIEW->setPixmap(QPixmap::fromImage(arrow.scaled(40,40,Qt::KeepAspectRatio,Qt::FastTransformation)));
    ui->label_arrow_VIEW->setEnabled(false);

    column_const = BRAK;
    column_additional = 0;
    column_max=BRAK_max;
    sumbit_view=false;
    filter_i=false;
    ui->tableView_VIEW->setModel(0);
    ui->stackedWidget_VIEW->setVisible(false);
    ui->pushButton->setVisible(false);
    ui->pushButton_2->setVisible(false);
    ui->pushButton_3->setVisible(false);
    ui->label_additional_table_VIEW->setVisible(false);

    /* signal & slots */
    connect(ui->comboBox_which_column_VIEW, SIGNAL (activated(QString)), this, SLOT (combobox_selected_column(QString)));

    connect(ui->lineEdit_Filtr_VIEW, SIGNAL(textChanged(QString)),
               this, SLOT(filterRegExpChanged()));

    connect(ui->checkBox_case_VIEW, SIGNAL(toggled(bool)),
               this, SLOT(filterRegExpChanged()));

    ui->tableView_VIEW->setContextMenuPolicy(Qt::CustomContextMenu);
    connect(ui->tableView_VIEW, SIGNAL(customContextMenuRequested(const QPoint&)),this,SLOT(ShowContextMenu(const QPoint&)));


   /* ADD PAGE *******************************************************************/

    row_block=false;

    ui->groupBox->setVisible(false);

    ui->pushButton_submit_filter_ADD->setIcon(QIcon(path + "/obrazy/select_all.png"));
    ui->pushButton_submit_filter_ADD->setIconSize(QSize(20, 20));

    ui->pushButton_clear_filter_ADD->setIcon(QIcon(path + "/obrazy/clear_all.png"));
    ui->pushButton_clear_filter_ADD->setIconSize(QSize(20, 20));

    ui->pushButton_clear_search_ADD->setIcon(QIcon(path + "/obrazy/clear_all.png"));
    ui->pushButton_clear_search_ADD->setIconSize(QSize(20, 20));

    ui->pushButton_submit_ADD->setIcon(QIcon(path + "/obrazy/accept_database.png"));
    ui->pushButton_submit_ADD->setIconSize(QSize(50, 50));

    ui->pushButton_add_ADD->setIcon(QIcon(path + "/obrazy/add_database.png"));
    ui->pushButton_add_ADD->setIconSize(QSize(50, 50));

    ui->pushButton_delete_ADD->setIcon(QIcon(path + "/obrazy/delete_database.png"));
    ui->pushButton_delete_ADD->setIconSize(QSize(50, 50));

    ui->pushButton_refresh_ADD->setIcon(QIcon(path + "/obrazy/refresh_database.png"));
    ui->pushButton_refresh_ADD->setIconSize(QSize(50, 50));

    connect(ui->comboBox_which_column_ADD_REMOVE, SIGNAL (activated(QString)), this, SLOT (combobox_selected_column_ADD(QString)));
    connect(ui->lineEdit_Filtr_ADD, SIGNAL(textChanged(QString)),
               this, SLOT(filterRegExpChanged_ADD()));


}

MainWindow::~MainWindow()
{
    LoginDialog login;
    login.closeDB();

    //free memory
    delete INFOlabel;
    delete Statprogress;
    delete Statbutton;
    delete Statlabel;
    delete[] dynamic_table;
    delete ui;
}

const QString MainWindow::Daneosobowe_checklist[2] = {"Maszyny","Miejsca"};
const QString MainWindow::Konkurencja_checklist[1] = {"Maszyny"};
const QString MainWindow::Miejsca_checklist[2] = {"Maszyny","Dane osobowe"};
const QString MainWindow::Maszyny_checklist[3] = {"Dane osobowe","Zlecenia","Części"};
const QString MainWindow::Raportyserwisowe_checklist[2] = {"Maszyny", "Zgłoszenia serwisowe"};
const QString MainWindow::Zgloszeniaserwisowe_checklist[2] = {"Maszyny","Raporty serwisowe"};
const QString MainWindow::Czesci_checklist[2]= {"Maszyny","Miejsca"};
const QString MainWindow::Zgloszeniaserwisowe_Miejsca_checklist[2]={"Maszyny","Miejsca"};

/* MAIN WINDOW ****************************************************************************/

void MainWindow::create_backup()
{
    QString init_path = "//k1/DBIR/Programowanie/Aplikacja SERWIS/Kopia_zapasowa_SERWIS";
    QString _time=QTime::currentTime().toString();
    _time.replace(":","_");
    QUrl filename = init_path;
    QString path_bu= filename.toString()+"/Serwis_BACKUP_"+QDate::currentDate().toString()+"_"+_time+".sql";
    path_bu.replace("file:","");
    if(path_bu.contains(':'))path_bu=path_bu.right(path_bu.size()-3);
    QString Cmd = QString("mysqldump.exe -u%1 -h%2 -p%3 --routines serwis_v8").arg("root","127.0.0.1","sigmasa");
    QString Path = QString("%1").arg(path_bu);
    QProcess poc;
    poc.setStandardOutputFile(Path);
    poc.start(Cmd);
    poc.waitForFinished( 30000 );
    QMessageBox::information(this,"Informacja", "Kopia zapasowa została zapisana w folderze \n"
                                                "//k1/DBIR/Programowanie/Aplikacja SERWIS/Kopia_zapasowa_SERWIS");
}

//reciveAccess() - slot to recive information from login dialog about access
void MainWindow::receiveAccess(QString login,QString password)
{
   Statprogress->setValue(100);
   if(login=="root" && password=="Serwis4q@")
   {
       access=true;
       Statlabel->setText("<font color='white'>Połączono jako Admnistrator</font>");
   }
   else if(login=="serwis" && password=="Serwis_V1")
   {
       Statprogress->setValue(50);
       access=false;
       Statlabel->setText("<font color='white'>Połączono jako użytkownik</font>");
       ui->listWidget_ADD->item(3)->setForeground(Qt::green);
       ui->pushButton_10->setEnabled(false);
       ui->Backupbutton->setEnabled(false);
   }
}

// reciveEvent() - event to change size of some widgets when resizing
void MainWindow::resizeEvent(QResizeEvent* event)
{
     if(event->type() == QEvent::Resize)
     {
        QFont font = ui->tableView_VIEW->font();
        int fontSize = 50;
        #if (DEBUG_ACTIVE==true)
            qDebug()<<"SZEROKOŚĆ OKNA:"<<ui->centralWidget->width();
        #endif

        QFont a(font);
        a.setPixelSize( fontSize );
        if(ui->centralWidget->width()>1620 && ui->centralWidget->width()<=1920)fontSize=14.5;
        if(ui->centralWidget->width()>=1320 && ui->centralWidget->width()<=1620)fontSize=13.5;
        if(ui->centralWidget->width()<=1320)fontSize=12.5;
        font.setPixelSize(fontSize);
        ui->tableView_VIEW->setFont(font);
        ui->tableView_VIEW->horizontalHeader()->setFont(font);
        ui->tableView_VIEW->verticalHeader()->setFont(font);

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

//info_button() - information about previous database error
void MainWindow::info_button()
{
    if(last_error=="") QMessageBox::information(this,"Informacja","Nie znaleziono błędów.");
    else QMessageBox::information(this,"Informacja",last_error);
}

//eventFilter() - event of top frame buttons
bool MainWindow::eventFilter(QObject *obj, QEvent *event)
{
    if (obj == (QObject*)ui->Calendarbutton)
    {
            if (event->type() == QEvent::HoverEnter)
            {
                ui->Calendarbutton->setIcon(QIcon(path + "/obrazy/calendar.png"));
                ui->Calendarbutton->setIconSize(QSize(45, 45));
                return true;

            } else if (event->type() == QEvent::HoverLeave)
            {
                ui->Calendarbutton->setIcon(QIcon(path + "/obrazy/calendar.png"));
                ui->Calendarbutton->setIconSize(QSize(40, 40));
                return true;
            }

            else if (event->type() == QEvent::MouseButtonRelease)
            {
                ui->Calendarbutton->setIcon(QIcon(path + "/obrazy/calendar.png"));
                ui->Calendarbutton->setIconSize(QSize(45, 45));
                QDialog description_dialog_2;
                description_dialog_2.setWindowIcon(QIcon(path+"/obrazy/calendar.png"));
                description_dialog_2.setWindowTitle("Kalendarz");
                description_dialog_2.setWindowFlags((description_dialog_2.windowFlags() | Qt::CustomizeWindowHint) & ~Qt::WindowContextHelpButtonHint);
                QGridLayout * lay=new QGridLayout(&description_dialog_2);
                QCalendarWidget *calendarWidget = new QCalendarWidget();
                calendarWidget->setGridVisible(true);
                calendarWidget->setFirstDayOfWeek(Qt::Monday);
                calendarWidget->setHorizontalHeaderFormat(QCalendarWidget::LongDayNames);
                calendarWidget->setVerticalHeaderFormat(QCalendarWidget::NoVerticalHeader);
                lay->addWidget(calendarWidget);
                description_dialog_2.exec();
                return true;
            }

            else if (event->type() == QEvent::MouseButtonPress)
            {
                ui->Calendarbutton->setIcon(QIcon(path + "/obrazy/calendar.png"));
                ui->Calendarbutton->setIconSize(QSize(30, 30));
                return true;
            }

    }

    if (event->type() == QEvent::KeyPress)
       {
        if(obj == (QObject*)ui->tableView_ADD)
           {
               QKeyEvent *keyEvent = static_cast<QKeyEvent *>(event);
               QString header_name=ui->tableView_ADD->model()->headerData(ui->tableView_ADD->currentIndex().column(), Qt::Horizontal).toString();

               if(keyEvent->key() == Qt::Key_Return && !header_name.contains("Opis") && !header_name.contains("Link") && !header_name.contains("Nr zgłoszenia"))
               {
                   ui->tableView_ADD->edit(ui->tableView_ADD->currentIndex());
               }

//               if(keyEvent->key() == Qt::Key_F1)
//               {

//               }
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
                ui->Helpbutton->setIcon(QIcon(path + "/obrazy/help.png"));
                ui->Helpbutton->setIconSize(QSize(45, 45));
                return true;

            } else if (event->type() == QEvent::HoverLeave)
            {
                ui->Helpbutton->setIcon(QIcon(path + "/obrazy/help.png"));
                ui->Helpbutton->setIconSize(QSize(40, 40));
                return true;
            }

            else if (event->type() == QEvent::MouseButtonRelease)
            {
                QFont Font("Calibri Light", 12, QFont::Light ,false);
                ui->Helpbutton->setIcon(QIcon(path + "/obrazy/help.png"));
                ui->Helpbutton->setIconSize(QSize(45, 45));
                QDialog description_dialog_2;
                QVBoxLayout layout(&description_dialog_2);
                QLabel description_label_2;
                description_dialog_2.setWindowIcon(QIcon(path+"/obrazy/help.png"));
                description_dialog_2.setWindowTitle("Pomoc");
                description_dialog_2.setWindowFlags((description_dialog_2.windowFlags() | Qt::CustomizeWindowHint) & ~Qt::WindowContextHelpButtonHint);
                description_dialog_2.resize(300, 100);
                description_dialog_2.setMinimumHeight(100);
                description_dialog_2.setMinimumWidth(300);
                description_label_2.setText("W przypadku problemów z poprawnym działaniem programu proszę kontaktować się mailowo: rafal.strawinski@sigmasa.pl");
                description_label_2.setFont(Font);
                description_label_2.setWordWrap(true);
                layout.addWidget(&description_label_2);
                description_dialog_2.exec();
                return true;
            }

            else if (event->type() == QEvent::MouseButtonPress)
            {
                ui->Helpbutton->setIcon(QIcon(path + "/obrazy/help.png"));
                ui->Helpbutton->setIconSize(QSize(30, 30));
                return true;
            }

    }

    if (obj == (QObject*)ui->Backupbutton && access==true)
    {
            if (event->type() == QEvent::HoverEnter)
            {
                ui->Backupbutton->setIcon(QIcon(path + "/obrazy/backup.png"));
                ui->Backupbutton->setIconSize(QSize(45, 45));
                return true;

            } else if (event->type() == QEvent::HoverLeave)
            {
                ui->Backupbutton->setIcon(QIcon(path + "/obrazy/backup.png"));
                ui->Backupbutton->setIconSize(QSize(40, 40));
                return true;
            }

            else if (event->type() == QEvent::MouseButtonRelease)
            {
                ui->Backupbutton->setIcon(QIcon(path + "/obrazy/backup.png"));
                ui->Backupbutton->setIconSize(QSize(45, 45));
                create_backup();
                return true;
            }

            else if (event->type() == QEvent::MouseButtonPress)
            {
                ui->Backupbutton->setIcon(QIcon(path + "/obrazy/backup.png"));
                ui->Backupbutton->setIconSize(QSize(30, 30));
                return true;
            }

    }


    if (obj == (QObject*)ui->Logoutbutton)
    {
            if (event->type() == QEvent::HoverEnter)
            {
                ui->Logoutbutton->setIcon(QIcon(path + "/obrazy/exit.png"));
                ui->Logoutbutton->setIconSize(QSize(45, 45));
                return true;

            } else if (event->type() == QEvent::HoverLeave)
            {
                ui->Logoutbutton->setIcon(QIcon(path + "/obrazy/exit.png"));
                ui->Logoutbutton->setIconSize(QSize(40, 40));
                return true;
            }

            else if (event->type() == QEvent::MouseButtonRelease)
            {
                ui->Logoutbutton->setIcon(QIcon(path + "/obrazy/exit.png"));
                ui->Logoutbutton->setIconSize(QSize(45, 45));
                qDebug() << "Performing application reboot...";
                qApp->exit( MainWindow::EXIT_CODE_REBOOT );
                return true;
            }

            else if (event->type() == QEvent::MouseButtonPress)
            {
                ui->Logoutbutton->setIcon(QIcon(path + "/obrazy/exit.png"));
                ui->Logoutbutton->setIconSize(QSize(30, 30));
                return true;
            }

    }

    if (obj == (QObject*)ui->Viewbutton)
    {
            if (event->type() == QEvent::HoverEnter)
            {
                ui->Viewbutton->setIcon(QIcon(path + "/obrazy/search.png"));
                ui->Viewbutton->setIconSize(QSize(45, 45));
                return true;

            } else if (event->type() == QEvent::HoverLeave)
            {
                ui->Viewbutton->setIcon(QIcon(path + "/obrazy/search.png"));
                ui->Viewbutton->setIconSize(QSize(40, 40));
                return true;
            }

            else if (event->type() == QEvent::MouseButtonRelease)
            {
                ui->Viewbutton->setIcon(QIcon(path + "/obrazy/search.png"));
                ui->Viewbutton->setIconSize(QSize(45, 45));
                ui->Viewbutton->setStyleSheet("QPushButton {"
                                              "background-color: qlineargradient(cx: 0.3, cy: -0.4,fx: 0.3, fy: -0.4,radius: 1.35, stop: 0 #fff, stop: 1 #888);"
                                              "}"
                                               );
                ui->Add_Removebutton->setStyleSheet("");
                Clear_ADD();
                ui->stackedWidget->setCurrentIndex(0);
                return true;
            }

            else if (event->type() == QEvent::MouseButtonPress)
            {
                ui->Viewbutton->setIcon(QIcon(path + "/obrazy/search.png"));
                ui->Viewbutton->setIconSize(QSize(30, 30));
                return true;
            }

    }


    if (obj == (QObject*)ui->Add_Removebutton)
    {
            if (event->type() == QEvent::HoverEnter)
            {
                ui->Add_Removebutton->setIcon(QIcon(path + "/obrazy/add.png"));
                ui->Add_Removebutton->setIconSize(QSize(45, 45));

                return true;

            } else if (event->type() == QEvent::HoverLeave)
            {
                ui->Add_Removebutton->setIcon(QIcon(path + "/obrazy/add.png"));
                ui->Add_Removebutton->setIconSize(QSize(40, 40));

                return false;
            }

            else if (event->type() == QEvent::MouseButtonRelease)
            {
                ui->Add_Removebutton->setIcon(QIcon(path + "/obrazy/add.png"));
                ui->Add_Removebutton->setIconSize(QSize(45, 45));
                ui->Add_Removebutton->setStyleSheet("QPushButton {"
                                              "background-color: qlineargradient(cx: 0.3, cy: -0.4,fx: 0.3, fy: -0.4,radius: 1.35, stop: 0 #fff, stop: 1 #888);"
                                              "}"
                                               );
                ui->Viewbutton->setStyleSheet("");
                Clear_VIEW();
                ui->stackedWidget->setCurrentIndex(1);
                return false;
            }

            if (event->type() == QEvent::MouseButtonPress)
            {
                ui->Add_Removebutton->setIcon(QIcon(path + "/obrazy/add.png"));
                ui->Add_Removebutton->setIconSize(QSize(30, 30));
                return true;
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

//[SLOT] - emitted when clicked on List Widget
void MainWindow::on_listWidget_VIEW_clicked()
{
 INFOlabel->setVisible(false);

#if (DEBUG_ACTIVE==true)
    qDebug()<<"Wartość pierwszego comobobxa - indeks 0: "<<ui->comboBox_which_column_VIEW->itemText(0);

#endif
 if(ui->comboBox_which_column_VIEW->itemText(0)!="Wybierz kolumnę")
 {
     ui->comboBox_which_column_VIEW->addItem("Wybierz kolumnę");
     ui->comboBox_items_VIEW->addItem("Wybierz kolumnę");
 }
}

//[SLOT] - emitted when row on List Widget changed. Used to clear all parameter after changing the row.
void MainWindow::on_listWidget_VIEW_currentRowChanged()
{
    ClearArray(dynamic_table);
}

//[SLOT]- emitted when an item is pressed. Used for communications between listWidet items and checkboxes
void MainWindow::on_listWidget_VIEW_itemPressed(QListWidgetItem *item)
{
    int size=0;

    if(ui->listWidget_VIEW->item(Miejsca_idx)==item)
    {
        size=2;
        main_table = "Miejsca";
        main_view = "Miejsca_Widok";
        column_const = Miejsca;
        column_max = Miejsca_max;
        FillArray(dynamic_table, Miejsca_checklist, size);
    }
    else if(ui->listWidget_VIEW->item(Daneosobowe_idx)==item)
    {
        size=2;
        main_table = "Daneosobowe";
        main_view = "Daneosobowe_Widok";
        column_const = Daneosobowe;
        column_max = Daneosobowe_max;
        FillArray(dynamic_table, Daneosobowe_checklist, size);
    }
    else if(ui->listWidget_VIEW->item(Maszyny_idx)==item)
    {
        size=3;
        main_table = "Maszyny";
        main_view = "Maszyny_Widok";
        column_const=Maszyny;
        column_max = Maszyny_max;
        FillArray(dynamic_table, Maszyny_checklist, size);
    }
    else if(ui->listWidget_VIEW->item(Konkurencja_idx)==item)
    {
        size=1;
        main_table = "Konkurencja";
        main_view = "Konkurencja_Widok";
        column_const=Konkurencja;
        column_max=Konkurencja_max;
        FillArray(dynamic_table, Konkurencja_checklist, size);
    }
    else if(ui->listWidget_VIEW->item(RaportySerwisowe_idx)==item)
    {
        size=2;
        main_table = "Raportyserwisowe";
        main_view = "Raportyserwisowe_Widok";
        column_const=RaportySerwisowe;
        column_max = RaportySerwisowe_max;
        FillArray(dynamic_table, Raportyserwisowe_checklist, size);
    }
    else if(ui->listWidget_VIEW->item(ZgloszeniaSerwisowe_idx)==item)
    {
        size=2;
        main_table = "Zgloszeniaserwisowe";
        main_view = "Zgloszeniaserwisowe_Widok";
        column_const= ZgloszeniaSerwisowe;
        column_max = ZgloszeniaSerwisowe_max;
        FillArray(dynamic_table, Zgloszeniaserwisowe_checklist, size);
    }
    else if(ui->listWidget_VIEW->item(Czesci_idx)==item)
    {
        size=2;
        main_table = "Czesci";
        main_view = "Czesci_Widok";
        column_const=Czesci;
        column_max = Czesci_max;
        FillArray(dynamic_table, Czesci_checklist, size);
    }
    else if(ui->listWidget_VIEW->item(Zlecenia_idx)==item)
    {
        size=0;
        main_table = "Zlecenia";
        main_view = "Zlecenia_Widok";
        column_const=Zlecenia;
        column_max = Zlecenia_max;
        //FillArray(dynamic_table, Czesci_checklist, size);
    }

#if (DEBUG_ACTIVE==true)
    qDebug()<<"Główna tabela: "<<main_table;
    qDebug()<<"Główny widok: "<<main_view;
    qDebug()<<"ilość minimalna column: "<<column_const;
    qDebug()<<"ilość maksymalna column: "<<column_max;
    qDebug()<<"ilość tabel dodatkowych:"<<size;
#endif
}

//Function to create model on main table
void MainWindow::create_model(QSortFilterProxyModel * _proxy, QSqlTableModel * _model, QString _view, QTableView * _table, bool header_active, bool editable)
{

#if (DEBUG_ACTIVE==true)
    qDebug()<<"Funkcja create_model()";
    qDebug()<<"ADRES _proxy w funkcji create_model()"<<_proxy;
    qDebug()<<"ADRES delegete in create_model-początek: "<<delegate;
#endif

    QFont Font("Calibri Light", 12, QFont::Light ,false);

    #if (DEBUG_ACTIVE==true)
        qDebug()<<"Creating QSqlTableModel ...";
    #endif
    _model->setEditStrategy(QSqlTableModel::OnManualSubmit);
    _model->setTable(_view);
    if(!editable)_model->setSort(0,Qt::AscendingOrder);
    _model->select();
    if(!editable)set_headers_basic(main_table,*_model);

    #if (DEBUG_ACTIVE==true)
        qDebug()<<"Creating SortFilterProxyModel ...";
    #endif
    _proxy->setSourceModel(_model);
    _proxy->setFilterKeyColumn(-1);
    _proxy->setDynamicSortFilter(true);

    _table->setModel(_proxy);

    if(header_active==true)
    {
        #if (DEBUG_ACTIVE==true)
            qDebug()<<"Creating Header ...";
        #endif
        header = new QSpreadsheetHeaderView(Qt::Horizontal, column_const,column_max, _table);
        connect(header,SIGNAL(sendHiddenColums(bool*)),this,SLOT(receiveHiddenColumns_MAIN(bool*)));
        header->setFont(Font);
        _table->setHorizontalHeader(header);
    }

    _table->horizontalHeader()->setVisible(true);
    if(editable)_table->setEditTriggers(QAbstractItemView::NoEditTriggers);
    _table->verticalHeader()->setFixedWidth(50);
    _table->horizontalHeader()->setFixedHeight(30);
    for (int col=1; col<_proxy->columnCount(); col++)
    {
      _table->setColumnWidth(col,230);
    }


    if(header_active==true)
    {
        for(int i=0;i<column_max;i++)
        {
            if(i<column_const)_table->setColumnHidden(i,false);
            else if(i>=column_const) _table->setColumnHidden(i,true);
        }
    }

    if(!editable)
    {
        ui->tableView_ADD->hideColumn(0);
        delegate=new mySqlRelationalDelegate(this);
        ui->tableView_ADD->setItemDelegate(delegate);
        #if (DEBUG_ACTIVE==true)
            qDebug()<<"ADRES delegete in create_model-koniec: "<<delegate;
        #endif
    }

}

//Function to create model on main table
void MainWindow::create_model_own(CerSimpleDynamics::Models::SortFilterProxyModel * _proxy, QSqlTableModel * _model, QString _view, QTableView * _table, bool header_active, bool editable)
{   
    #if (DEBUG_ACTIVE==true)
        qDebug()<<"Funkcja create_model_own()";
        qDebug()<<"ADRES _proxy w funkcji create_model_own()"<<_proxy;
        qDebug()<<"ADRES _model w funkcji create_model_own()"<<_model;
    #endif

    QFont Font("Calibri Light", 12, QFont::Light ,false);

    #if (DEBUG_ACTIVE==true)
        qDebug()<<"Creating QSqlTableModel ...";
    #endif
    _model->setEditStrategy(QSqlTableModel::OnManualSubmit);
    _model->setTable(_view);
    _model->select();

    #if (DEBUG_ACTIVE==true)
        qDebug()<<"Creating SortFilterProxyModel ...";
    #endif
    _proxy->setSourceModel(_model);
    _proxy->setFilterKeyColumn(-1);
    _proxy->setDynamicSortFilter(true);

    _table->setModel(_proxy);

    if(header_active==true)
    {
        #if (DEBUG_ACTIVE==true)
            qDebug()<<"Creating Header ...";
        #endif
        header = new QSpreadsheetHeaderView(Qt::Horizontal, column_const,column_max, _table);
        connect(header,SIGNAL(sendHiddenColums(bool*)),this,SLOT(receiveHiddenColumns_MAIN(bool*)));
        header->setFont(Font);
        _table->setHorizontalHeader(header);
    }

    _table->horizontalHeader()->setVisible(true);
    if(editable)_table->setEditTriggers(QAbstractItemView::NoEditTriggers);
    for (int col=0; col<_proxy->columnCount(); col++)
    {
      _table->setColumnWidth(col,230);
    }
    _table->horizontalHeader()->setFixedHeight(30);


    if(header_active==true)
    {
        for(int i=0;i<column_max;i++)
        {
            if(i<column_const)_table->setColumnHidden(i,false);
            else if(i>=column_const) _table->setColumnHidden(i,true);
        }
    }

    QObject::connect(header, SIGNAL(sendHiddenColums(bool*)),
                     _proxy, SLOT(receiveHiddenColumns(bool*)));

}

//[SLOT] - slot which create menu on main table
void MainWindow::ShowContextMenu(const QPoint& pos)
{ 
    bool url_active=false;
    #if (DEBUG_ACTIVE==true)
        qDebug()<<"Funkcja ShowContextMenu()";
        qDebug()<<"ADRES myMenu w funkcji ShowContextMenu()"<<myMenu;
    #endif

    if(!myMenu)
    {
        #if (DEBUG_ACTIVE==true)
            qDebug()<<"Deleting myMenu w funkcji ShowContextMenu()";
        #endif

        delete myMenu;
        myMenu=NULL;
        #if (DEBUG_ACTIVE==true)
            qDebug()<<myMenu<<endl;
        #endif
    }

    myMenu=new QMenu(ui->tableView_VIEW);
    #if (DEBUG_ACTIVE==true)
        qDebug()<<"ADRES myMenu w funkcji ShowContextMenu()-po inicjalizacji"<<myMenu<<endl;
    #endif
    QPoint globalPos = ui->tableView_VIEW->mapToGlobal(pos);
    QModelIndex index=ui->tableView_VIEW->indexAt(pos);
    item_name_menu=index.data(Qt::DisplayRole).toString();
    QString header_name=ui->tableView_VIEW->model()->headerData(index.column(), Qt::Horizontal).toString();
    if(header_name.contains("link",Qt::CaseInsensitive))url_active=true;

    connect(myMenu, SIGNAL(triggered(QAction*)), this, SLOT(open_additional_table_SLOT(QAction*)));

    if( (main_table=="Miejsca" && (header_name=="Miejsce" || header_name=="Dział")) ||
        (main_table=="Maszyny" && (header_name=="Maszyna" || header_name=="Nr fabryczny" || header_name=="Miejsce" || header_name=="Nr zlecenia" || header_name=="Temat zlecenia")) ||
        (main_table=="Zgloszeniaserwisowe" && (header_name=="Nr zgłoszenia" || header_name=="Nr fabryczny" || header_name=="Maszyna" || header_name=="Opis")) ||
        (main_table=="Raportyserwisowe" && (header_name=="Data" || header_name=="Maszyna" || header_name=="Nr fabryczny" || header_name=="Opis" || header_name=="Nr zgłoszenia" || header_name=="Opis zgłoszenia")) ||
        (main_table=="Czesci" && (header_name=="Część" || header_name=="Nr części" || header_name=="Miejsce" || header_name=="Maszyna" || header_name=="Nr fabryczny"|| header_name=="Miejsce kooperanta")) ||
        (main_table=="Daneosobowe" && (header_name=="Imię" || header_name=="Nazwisko" || header_name=="Miejsce" || header_name=="Maszyna" || header_name=="Nr fabryczny" || header_name=="Miejsce kooperanta")) ||
        (main_table=="Konkurencja" && (header_name=="Konkurencja" || header_name=="Opis" || header_name=="Maszyna" || header_name=="Nr fabryczny"))
       )
    {
        for(int i = 0; i < column_additional; i++)
        {
            actions_table_VIEW[i] = new QAction(myMenu);
            actions_table_VIEW[i] = myMenu->addAction(dynamic_table[i]);
        }
    }

    if(url_active)
    {
        myMenu->addSeparator();
        myMenu->addAction("Otwórz załącznik");
        myMenu->addAction("Otwórz folder");
    }

    myMenu->addSeparator();
    myMenu->addAction("Rozwiń opis");

    myMenu->exec(globalPos);

}

//[SLOT] - slot which open additional table when the action is selected
void MainWindow::open_additional_table_SLOT(QAction *action)
{
 #if (DEBUG_ACTIVE==true)
        qDebug()<<"open_additional_table_SLOT()"<<myMenu;
 #endif
  myMenu->hide();
  QString action_name = action->text();

  if(action_name=="Otwórz załącznik")
  {
      QString last_char = item_name_menu.right(item_name_menu.size()-(item_name_menu.size()-1));
      if(!item_name_menu.contains('.') || last_char =="/" || item_name_menu.isEmpty() || !QDesktopServices::openUrl(QUrl(item_name_menu)))
            QMessageBox::warning(this,"Informacja", "Link jest niepoprawny.");
  }
  else if(action_name=="Otwórz folder")
  {
      QString last_char = item_name_menu.right(item_name_menu.size()-(item_name_menu.size()-1));
      QFile HelpFile(item_name_menu);
      int idx = item_name_menu.lastIndexOf("/");
      QString file = item_name_menu.left(item_name_menu.size()-(item_name_menu.size()-(idx+1)));
      if(last_char =="/" || item_name_menu.isEmpty() || !QDesktopServices::openUrl(QUrl(file)))
            QMessageBox::warning(this,"Informacja", "Link jest niepoprawny.");
  }
  else if(action_name=="Rozwiń opis")
  {
      QDialog description_dialog_2;
      QVBoxLayout layout(&description_dialog_2);
      QScrollArea scroll;
      QLabel description_label_2;
      description_label_2.setText(item_name_menu);
      description_label_2.setWordWrap(true);
      scroll.setWidget(&description_label_2);
      layout.addWidget(&scroll);
      description_dialog_2.setWindowTitle("Opis");
      description_dialog_2.setWindowIcon(QIcon(path+"/obrazy/services_icon.png"));
      description_dialog_2.exec();
    }

  else
  {
      additional_filter_isSet=true;
      open_additional_table(get_add_button_name(action_name));

      QButtonGroup buttons_group;
      buttons_group.addButton(ui->pushButton,1);
      buttons_group.addButton(ui->pushButton_2,2);
      buttons_group.addButton(ui->pushButton_3,3);

      for(int i=1;i<4;i++)
      {
        if(buttons_group.button(i)->text()==action_name)
        {
            buttons_group.button(i)->setIcon(QIcon(path + "/obrazy/select_all.png"));
            buttons_group.button(i)->setIconSize(QSize(20, 20));
        }
      }
  }
}

//[SLOT] - slot which fill first combobox depending on hidden columns
void MainWindow::receiveHiddenColumns_MAIN(bool* ichecked_columns)
{

    #if (DEBUG_ACTIVE==true)
        qDebug()<<"Fill first "
                  " depending on hidden columns ..."<<endl;
    #endif

  checked_columns_MAIN=ichecked_columns;

  ui->comboBox_which_column_VIEW->clear();
  ui->comboBox_which_column_VIEW->addItem("Wybierz kolumnę");

  QStringList headers;
  for(int i = 0; i < proxy_own->columnCount(); i++)
  {
    if(ichecked_columns[i]==true)
      headers.append(proxy_own->headerData(i, Qt::Horizontal).toString());
  }
  ui->comboBox_which_column_VIEW->addItems(headers);

}

// Clear "VIEW tuck
void MainWindow::Clear_VIEW()
{    
    #if (DEBUG_ACTIVE==true)
        qDebug()<<"Clearing VIEW ...";
    #endif
     // enable
     ui->label_arrow_VIEW->setEnabled(false);
     ui->stackedWidget_VIEW->setVisible(false);

     // visible
     ui->pushButton->setVisible(false);
     ui->pushButton_2->setVisible(false);
     ui->pushButton_3->setVisible(false);
     ui->label_additional_table_VIEW->setVisible(false);
     INFOlabel->setVisible(false);

     ui->lineEdit_Filtr_VIEW->setText("");

     // deleting models
     if(sumbit_view==true)
     {
        #if (DEBUG_ACTIVE==true)
               qDebug()<<"Deleting model and proxy_own";
        #endif
         delete model;
         delete proxy_own;
         model=NULL;
         proxy_own=NULL;
     }

     if(model_additional!=0)
     {
        #if (DEBUG_ACTIVE==true)
               qDebug()<<"Deleting model_additional and proxy_additional";
        #endif

         delete model_additional;
         delete proxy_additional;
         model_additional=NULL;
         proxy_additional=NULL;
     }

     // clearing comboboxes
     ui->comboBox_which_column_VIEW->clear();
     ui->comboBox_items_VIEW->clear();

     // clearing OTHERS
     if(myMenu!=NULL)
     {
        #if (DEBUG_ACTIVE==true)
               qDebug()<<"Deleting myMenu"<<myMenu;
        #endif
         myMenu=NULL;
         delete myMenu;
     }

     clear_additional_dialog();
     delete[] dynamic_table;
     dynamic_table=NULL;
     ui->tableView_VIEW->setModel(0);
     main_table="";
     main_view="";
     column_const = BRAK;
     column_additional = 0;
     column_max=BRAK_max;
     sumbit_view=false;
     ui->listWidget_VIEW->clearSelection();
}

//[SLOT] - slot which connect comboboxes
void MainWindow::combobox_selected_column(QString column_name)
{

    #if (DEBUG_ACTIVE==true)
        qDebug()<<"Combobox item name"<<column_name<<endl;
    #endif
    if(column_name=="Wybierz kolumnę")
    {
        ui->comboBox_items_VIEW->clear();
        ui->comboBox_items_VIEW->addItem("Wybierz kolumnę");
    }

    else
    {
        QAbstractItemModel *tableModel =  ui->tableView_VIEW->model();
        int iRows = tableModel->rowCount();
        QStringList list;
        QModelIndex idx;
        QString str;
        int index;

        ui->comboBox_items_VIEW->clear();

        for(int i=0; i<tableModel->columnCount();i++)
        {
            if(tableModel->headerData(i,Qt::Horizontal).toString()==column_name)
            {
                index=i;
            }
        }

        for(int i=0;i<iRows;i++)
        {
           idx = tableModel->index(i, index);
           str = tableModel->data(idx,Qt::DisplayRole).toString();
           if( !list.contains(str) && str!="" )list.append(str);
        }

        ui->comboBox_items_VIEW->addItems(list);
    }

}

//Sets the visibility of buttons depending on the selected checkboxes
void MainWindow::View_button_visible()
{
    ui->pushButton->setVisible(false);
    ui->pushButton_2->setVisible(false);
    ui->pushButton_3->setVisible(false);

    if(column_additional==0)
    {
        ui->label_additional_table_VIEW->setVisible(false);
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

    else if(column_additional>4) QMessageBox::critical(this,"ERROR","Zbyt dużo tabel dodatkowych");

#if (DEBUG_ACTIVE==true)
    qDebug()<<"Number of creating PushButtons: "<<column_additional<<endl;
#endif

}

// Fill additional comboboxes in VIEW
void MainWindow::fill_additional_comboboxes(QString _main_table)
{
    if(_main_table=="Maszyny")
    {
        ui->label_machines_for_type->setText("0");
        ui->comboBox_8->setCurrentIndex(0);
        QAbstractItemModel *tableModel_machine =  ui->tableView_VIEW->model();
        int iRows = tableModel_machine->rowCount();
        QStringList list_place;
        QStringList list_order;
        QModelIndex idx_place;
        QModelIndex idx_order;
        QString str_place;
        QString str_order;

        ui->comboBox_2->clear();
        ui->comboBox_2->addItem("WYBIERZ MIEJSCE");
        ui->comboBox_3->clear();
        ui->comboBox_3->addItem("WYBIERZ ZLECENIE");


        for(int i=0;i<iRows;i++)
        {
           idx_place = tableModel_machine->index(i, 2);
           idx_order = tableModel_machine->index(i, 7);
           str_place = tableModel_machine->data(idx_place,Qt::DisplayRole).toString();
           str_order = tableModel_machine->data(idx_order,Qt::DisplayRole).toString();
           if( !list_place.contains(str_place) && str_place!="" )list_place.append(str_place);
           if( !list_order.contains(str_order) && str_order!="" )list_order.append(str_order);
        }

        ui->comboBox_2->addItems(list_place);
        ui->comboBox_3->addItems(list_order);

    }

    else if(_main_table=="Zgloszeniaserwisowe")
    {
        ui->label_notification_for_active->setText("0");
        ui->comboBox_10->setCurrentIndex(0);

        ui->label_notification_for_type->setText("0");
        ui->comboBox_9->setCurrentIndex(0);

        QAbstractItemModel *tableModel_notification =  ui->tableView_VIEW->model();
        int iRows = tableModel_notification->rowCount();
        QStringList list_notification;
        QModelIndex idx_notification;
        QString str_notification;

        ui->comboBox_7->clear();
        ui->comboBox_7->addItem("WYBIERZ MIEJSCE");

        for(int i=0;i<iRows;i++)
        {
           idx_notification = tableModel_notification->index(i, 3);
           str_notification = tableModel_notification->data(idx_notification,Qt::DisplayRole).toString();
           if( !list_notification.contains(str_notification) && str_notification!="" )list_notification.append(str_notification);
        }

        ui->comboBox_7->addItems(list_notification);

    }

    else if(_main_table=="Raportyserwisowe")
    {
        ui->label_raport_hours->setText("0");
        QAbstractItemModel *tableModel_raports =  ui->tableView_VIEW->model();
        int iRows = tableModel_raports->rowCount();
        QStringList list_machine;
        QStringList list_notification;
        QModelIndex idx_machine;
        QModelIndex idx_notification;
        QString str_machine;
        QString str_notification;

        ui->comboBox_5->clear();
        ui->comboBox_5->addItem("WYBIERZ MASZYNĘ");
        ui->comboBox_6->clear();
        ui->comboBox_6->addItem("WYBIERZ ZGŁOSZENIE");


        for(int i=0;i<iRows;i++)
        {
           idx_machine = tableModel_raports->index(i, 1);
           idx_notification = tableModel_raports->index(i, 7);
           str_machine = tableModel_raports->data(idx_machine,Qt::DisplayRole).toString();
           str_notification = tableModel_raports->data(idx_notification,Qt::DisplayRole).toString();
           if( !list_machine.contains(str_machine) && str_machine!="" )list_machine.append(str_machine);
           if( !list_notification.contains(str_notification) && str_notification!="" )list_notification.append(str_notification);
        }

        ui->comboBox_5->addItems(list_machine);
        ui->comboBox_6->addItems(list_notification);

    }

}

void MainWindow::on_listWidget_VIEW_clicked(const QModelIndex &index)
{
        Q_UNUSED(index);
        ui->label_arrow_VIEW->setEnabled(true);
        ui->stackedWidget_VIEW->setVisible(true);
        ui->stackedWidget_VIEW->setCurrentIndex(ui->listWidget_VIEW->currentRow());
        //clear_additional_options(main_table);

    #if (DEBUG_ACTIVE==true)
        qDebug()<<"Funkcja on_pushButton_submit_VIEW_clicked()"<<endl;
        qDebug()<<"ADRES proxy_own w funkcji on_pushButton_submit_VIEW_clicked()-początek"<<proxy_own;
        qDebug()<<"ADRES model w funkcji on_pushButton_submit_VIEW_clicked()-początek"<<model;
    #endif

        additional_filter_isSet=false;
        clear_additional_dialog();
        filter_i=false;

        clear_add_button();
        if(additional_table_dialog!=NULL)additional_table_dialog->close();
        add_table_active=false;
        INFOlabel->setVisible(false);
        sumbit_view=true;
        ui->label_additional_table_VIEW->setVisible(true);

        std::sort(dynamic_table,dynamic_table+column_additional);
        View_button_visible();

    #if (DEBUG_ACTIVE==true)
        qDebug()<<"Created MAIN VIEW: "<<main_view<<endl;
    #endif

        delete model;
        delete proxy_own;
        model=NULL;
        proxy_own=NULL;
    #if (DEBUG_ACTIVE==true)
        qDebug()<<"ADRES proxy_own w funkcji on_pushButton_submit_VIEW_clicked()-po delete"<<proxy_own;
        qDebug()<<"ADRES model w funkcji on_pushButton_submit_VIEW_clicked()-po delete"<<model;
    #endif

        model = new QSqlTableModel(this);
        proxy_own = new CerSimpleDynamics::Models::SortFilterProxyModel(column_max,column_const,this);

    #if (DEBUG_ACTIVE==true)
        qDebug()<<"ADRES proxy_own w funkcji on_pushButton_submit_VIEW_clicked()-po inicjalizacji"<<proxy_own;
        qDebug()<<"ADRES model w funkcji on_pushButton_submit_VIEW_clicked()-po inicjalizacji"<<model;
    #endif

        create_model_own(proxy_own,model,main_view,ui->tableView_VIEW,true,true);

        fill_additional_comboboxes(main_table);

        // init second combobox
        ui->comboBox_items_VIEW->clear();
        ui->comboBox_items_VIEW->addItem("Wybierz kolumnę");

        // init first combobox
        ui->comboBox_which_column_VIEW->clear();
        ui->comboBox_which_column_VIEW->addItem("Wybierz kolumnę");

        QStringList headers;
        for(int i = 0; i < proxy_own->columnCount(); i++)
        {
          if(!ui->tableView_VIEW->isColumnHidden(i))
            headers.append(proxy_own->headerData(i, Qt::Horizontal).toString());
        }
        ui->comboBox_which_column_VIEW->addItems(headers);
}


// Fulfillment of a dynamic array using an constant array
void MainWindow::FillArray(QString *& Array, const QString * Array_checklist, int size)
{
    Array = new QString[size];
    for(int i=0;i<size;i++)
    {
        Array[i]=Array_checklist[i];
    }

    column_additional=size;
    before_column_additional=size-1;

#if (DEBUG_ACTIVE==true)
    qDebug()<<"Filled dynamic array:";
    for(int i=0;i<size;i++)qDebug()<<i<<"element ="<<dynamic_table[i];
    qDebug()<<endl;
#endif
}

//Clear dynamic array
void MainWindow::ClearArray(QString *& Array)
{
     if(!dynamic_table)delete[] Array;
     column_additional=0;
     before_column_additional=1;

   #if (DEBUG_ACTIVE==true)
     qDebug()<<"Clearing dynamic array ..."<<endl;
   #endif
}

//Function to open choosen additional table
void MainWindow::open_additional_table(QString tableName)
{
    int nWidth =  800;
    int nHeight = 400;

    clear_additional_dialog();

#if (DEBUG_ACTIVE==true)
    qDebug()<<"Creating additional dialog ..."<<endl;
#endif

    // create DIALOG
    additional_table_dialog=new QDialog(this);
    connect(additional_table_dialog, SIGNAL(rejected()), this, SLOT(closing_table_dialog()));
    mainLayout = new QVBoxLayout(additional_table_dialog);
    additional_table_dialog->setWindowTitle("Tabela dodatkowa "+tableName);
    additional_table_dialog->setWindowFlags((additional_table_dialog->windowFlags() | Qt::CustomizeWindowHint) & ~Qt::WindowContextHelpButtonHint);
    additional_table_dialog->resize(nWidth, nHeight);
    additional_table_dialog->setMinimumHeight(nHeight);
    additional_table_dialog->setMinimumWidth(nWidth);

    if(!additional_filter_isSet)additional_lineedit =new QLineEdit(additional_table_dialog);
    else additional_lineedit =new QLineEdit(item_name_menu,additional_table_dialog);

    connect(additional_lineedit,SIGNAL(textChanged(QString)),this,SLOT(additional_filterRegExpChanged()));

    additional_table = new QTableView(additional_table_dialog);
    mainLayout->addWidget(additional_lineedit);
    mainLayout->addWidget(additional_table);
    additional_table_dialog->show();
    //****************

    view=tableName+"_"+main_table+"_Widok";

#if (DEBUG_ACTIVE==true)
    qDebug()<<"View of additional table: "<<view<<endl;
#endif

    delete proxy_additional;
    delete model_additional;
    proxy_additional=NULL;
    model_additional=NULL;
    model_additional = new QSqlTableModel(this);
    proxy_additional = new QSortFilterProxyModel(this);
    create_model(proxy_additional, model_additional,view,additional_table,false,true);

    if(additional_filter_isSet) additional_filterRegExpChanged();
    additional_filter_isSet=false;
}

// [SLOT] - slot when closing additional table dialog
void MainWindow::closing_table_dialog()
{ 
    #if (DEBUG_ACTIVE==true)
        qDebug()<<"Closeing additional dialog ..."<<endl;
    #endif
    clear_additional_dialog();
    clear_add_button();
}

//Function which free memory of additional table dialog
void MainWindow::clear_additional_dialog()
{
    #if (DEBUG_ACTIVE==true)
        qDebug()<<"Clearing additional dialog ..."<<endl;
    #endif

    if(additional_table_dialog!=NULL)
    {
        #if (DEBUG_ACTIVE==true)
            qDebug()<<"deleting additional_table_dialog w funkcji clear_additional_dialog()"<<endl;
        #endif
        additional_table_dialog->close();
        delete additional_table;
        delete additional_lineedit;
        delete mainLayout;
        delete additional_table_dialog;
        additional_table_dialog=NULL;
        mainLayout=NULL;
        additional_table=NULL;
        additional_lineedit=NULL;
    }
    #if (DEBUG_ACTIVE==true)
        qDebug()<<"Clearing additional dialog ... -after"<<endl;
    #endif
}

/* ADDITIONAL BUTTONS FOR VIEW ********************************/
void MainWindow::on_pushButton_clicked()
{
    QString button_name;
    button_name= ui->pushButton->text();
    open_additional_table(get_add_button_name(button_name));
    ui->pushButton->setIcon(QIcon(path + "/obrazy/select_all.png"));
    ui->pushButton->setIconSize(QSize(20, 20));
}

void MainWindow::on_pushButton_2_clicked()
{
    QString button_name;
    button_name= ui->pushButton_2->text();
    open_additional_table(get_add_button_name(button_name));
    ui->pushButton_2->setIcon(QIcon(path + "/obrazy/select_all.png"));
    ui->pushButton_2->setIconSize(QSize(20, 20));
}

void MainWindow::on_pushButton_3_clicked()
{
    QString button_name;
    button_name= ui->pushButton_3->text();
    open_additional_table(get_add_button_name(button_name));
    ui->pushButton_3->setIcon(QIcon(path + "/obrazy/select_all.png"));
    ui->pushButton_3->setIconSize(QSize(20, 20));
}

void MainWindow::clear_add_button()
{
    ui->pushButton->setIcon(QIcon());
    ui->pushButton_2->setIcon(QIcon());
    ui->pushButton_3->setIcon(QIcon());
}

QString MainWindow::get_add_button_name(QString button_name)
{
    clear_add_button();
    add_table_active=true;
    if(button_name=="Części") button_name="Czesci";
    else if(button_name=="Zgłoszenia serwisowe") button_name="Zgloszenia serwisowe";
    button_name = button_name.remove(" ");

    return button_name;
}

/* FILTER FOR VIEW *******************************************/
void MainWindow::on_pushButton_clear_search_VIEW_clicked()
{

    if(sumbit_view==true)
    {
        emit sendFilterBehavior(false,0);
        filter_i=false;
        ui->lineEdit_Filtr_VIEW->clear();
        QRegExp regExp("", Qt::CaseInsensitive, QRegExp::Wildcard);
        proxy_own->setFilterRegExp(regExp);

        ui->comboBox_items_VIEW->clear();
        ui->comboBox_items_VIEW->addItem("Wybierz kolumnę");
        ui->comboBox_which_column_VIEW->setCurrentIndex(0);
    }
    else
    {
        QMessageBox::information(this,"Informacja", "Brak tabeli. Proszę zatwierdzić");
        int height;
        int width;
        height=ui->topFrame->size().height();
        width=ui->listWidget_VIEW->size().width();
        INFOlabel->setGeometry(width-50,height+25,30,30);
        INFOlabel->setVisible(true);
    }

}

void MainWindow::on_pushButton_clear_filter_VIEW_clicked()
{

    if(sumbit_view==true)
    {
        emit sendFilterBehavior(false,0);
        proxy_own->setFilterKeyColumn(-1);
        QRegExp regExp("", Qt::CaseInsensitive, QRegExp::Wildcard);
        proxy_own->setFilterRegExp(regExp);

        ui->comboBox_items_VIEW->clear();
        ui->comboBox_items_VIEW->addItem("Wybierz kolumnę");
        ui->comboBox_which_column_VIEW->setCurrentIndex(0);
    }
    else
    {
        QMessageBox::information(this,"Informacja", "Brak tabeli. Proszę zatwierdzić");
        int height;
        int width;
        height=ui->topFrame->size().height();
        width=ui->listWidget_VIEW->size().width();
        INFOlabel->setGeometry(width-50,height+25,30,30);
        INFOlabel->setVisible(true);
    }
}

void MainWindow::on_pushButton_submit_filter_VIEW_clicked()
{
    if(sumbit_view==true)
    {
        int idx;
        QString search_header_name=ui->comboBox_which_column_VIEW->currentText();

        for(int i=0;i<proxy_own->columnCount();i++)
        {
            QString header_name=ui->tableView_VIEW->model()->headerData(i, Qt::Horizontal).toString();
            if(header_name==search_header_name) {
                idx=i;
                break;
            }
        }

        connect(this,SIGNAL(sendFilterBehavior(bool,int)),proxy_own,SLOT(receiveFilterBehavior(bool,int)));
        emit sendFilterBehavior(true,idx);

        QString arg1;
        arg1=ui->comboBox_items_VIEW->currentText();
        if(arg1!="Wybierz kolumnę")
        {

           Qt::CaseSensitivity caseSensitivity =
                     ui->checkBox_case_VIEW->isChecked() ? Qt::CaseSensitive
                                                                : Qt::CaseInsensitive;

           QRegExp regExp(arg1, caseSensitivity, QRegExp::Wildcard);
           proxy_own->setFilterRegExp(regExp);

        }
    }
    else
    {
        QMessageBox::information(this,"Informacja", "Brak tabeli. Proszę zatwierdzić");
        int height;
        int width;
        height=ui->topFrame->size().height();
        width=ui->listWidget_VIEW->size().width();
        INFOlabel->setGeometry(width-50,height+25,30,30);
        INFOlabel->setVisible(true);
    }
}

void MainWindow::filterRegExpChanged()
{

      if(sumbit_view==true)
        {
             emit sendFilterBehavior(false,0);
             Qt::CaseSensitivity caseSensitivity =
                      ui->checkBox_case_VIEW->isChecked() ? Qt::CaseSensitive
                                                                 : Qt::CaseInsensitive;
            QRegExp regExp(ui->lineEdit_Filtr_VIEW->text(), caseSensitivity, QRegExp::Wildcard);
            proxy_own->setFilterRegExp(regExp);

            ui->comboBox_items_VIEW->clear();
            ui->comboBox_items_VIEW->addItem("Wybierz kolumnę");
            ui->comboBox_which_column_VIEW->setCurrentIndex(0);

            ui->comboBox_items_VIEW->clear();
            ui->comboBox_items_VIEW->addItem("Wybierz kolumnę");
            ui->comboBox_which_column_VIEW->setCurrentIndex(0);
        }
        else
        {
            if(ui->lineEdit_Filtr_VIEW->text()!="")
            {

                    QMessageBox::information(this,"Informacja", "Brak tabeli. Proszę zatwierdzić");
                    int height;
                    int width;
                    height=ui->topFrame->size().height();
                    width=ui->listWidget_VIEW->size().width();
                    INFOlabel->setGeometry(width-50,height+25,30,30);
                    INFOlabel->setVisible(true);
                    ui->lineEdit_Filtr_VIEW->setText("");
            }
        }
}

void MainWindow::additional_filterRegExpChanged()
{
    QRegExp regExp(additional_lineedit->text(), Qt::CaseInsensitive, QRegExp::Wildcard);
    proxy_additional->setFilterRegExp(regExp);
}


/****** Miejsca ******/
// ilość miejsc danych w sektorze
void MainWindow::on_comboBox_currentIndexChanged(const QString &arg1)
{
    int number=0;
        for(int i=0;i<proxy_own->rowCount();i++)
        {
          if(ui->tableView_VIEW->model()->index(i,6).data().toString()==arg1)
          {
              number++;
          }
        }
    ui->label_places_in_sector->setText(QString::number(number));
}

/****** Maszyny ******/
// ilość maszyn w danym miejscu
void MainWindow::on_comboBox_2_currentIndexChanged(const QString &arg1)
{

    int number=0;
        for(int i=0;i<proxy_own->rowCount();i++)
        {
          if(ui->tableView_VIEW->model()->index(i,2).data().toString()==arg1)
          {
              number++;
          }
        }
    ui->label_machines_in_place->setText(QString::number(number));
}

// ilość maszyn dla zlecenia
void MainWindow::on_comboBox_3_currentIndexChanged(const QString &arg1)
{
    int number=0;
        for(int i=0;i<proxy_own->rowCount();i++)
        {
          if(ui->tableView_VIEW->model()->index(i,7).data().toString()==arg1)
          {
              number++;
          }
        }
    ui->label_machines_for_order->setText(QString::number(number));
}

// aktywność maszyn
void MainWindow::on_comboBox_8_currentIndexChanged(const QString &arg1)
{
    int number=0;
        for(int i=0;i<proxy_own->rowCount();i++)
        {
          if(ui->tableView_VIEW->model()->index(i,9).data().toString()==arg1)
          {
              number++;
          }
        }
    ui->label_machines_for_type->setText(QString::number(number));
}

void MainWindow::on_comboBox_4_currentIndexChanged(const QString &arg1)
{
    int number=0;
        for(int i=0;i<proxy_own->rowCount();i++)
        {
          if(ui->tableView_VIEW->model()->index(i,11).data().toString()==arg1)
          {
              number++;
          }
        }
    ui->label_machines_in_sektor->setText(QString::number(number));
}

/****** Raporty *******/
// ilość raportów dla maszyn
void MainWindow::on_comboBox_5_currentIndexChanged(const QString &arg1)
{
    int number=0;
        for(int i=0;i<proxy_own->rowCount();i++)
        {
          if(ui->tableView_VIEW->model()->index(i,1).data().toString()==arg1)
          {
              number++;
          }
        }
    ui->label_machines_for_raport->setText(QString::number(number));
}

// ilość raportów dla zgłoszeń
void MainWindow::on_comboBox_6_currentIndexChanged(const QString &arg1)
{
    int number=0;
        for(int i=0;i<proxy_own->rowCount();i++)
        {
          if(ui->tableView_VIEW->model()->index(i,7).data().toString()==arg1)
          {
              number++;
          }
        }
    ui->label_raports_fot_notification->setText(QString::number(number));
}

// typ raportu
void MainWindow::on_comboBox_11_currentIndexChanged(const QString &arg1)
{
    int number=0;
        for(int i=0;i<proxy_own->rowCount();i++)
        {
          if(ui->tableView_VIEW->model()->index(i,12).data().toString()==arg1)
          {
              number++;
          }
        }
    ui->label_raports_for_types->setText(QString::number(number));
}

// ilość godzin raportu
void MainWindow::on_pushButton_11_clicked()
{
    int hour=0;
    for(int i=0;i<proxy_own->rowCount();i++)
    {
        hour+=ui->tableView_VIEW->model()->index(i,11).data().toInt();
    }
    ui->label_raport_hours->setText(QString::number(hour));
}

/****** Zgłoszenia ****/
// ilość zgłoszeń dla miejsca
void MainWindow::on_comboBox_7_currentIndexChanged(const QString &arg1)
{

    int number=0;
        for(int i=0;i<proxy_own->rowCount();i++)
        {
          if(ui->tableView_VIEW->model()->index(i,3).data().toString()==arg1)
          {
              number++;
          }
        }

    ui->label_notifications_in_places->setText(QString::number(number));
}

// typ gwarancyjny
void MainWindow::on_comboBox_9_currentIndexChanged(const QString &arg1)
{

    int number=0;
        for(int i=0;i<proxy_own->rowCount();i++)
        {
          if(ui->tableView_VIEW->model()->index(i,9).data().toString()==arg1)
          {
              number++;
          }
        }

    ui->label_notification_for_type->setText(QString::number(number));
}

// aktywność zgłoszeń
void MainWindow::on_comboBox_10_currentIndexChanged(const QString &arg1)
{
    int number=0;
        for(int i=0;i<proxy_own->rowCount();i++)
        {
          if(ui->tableView_VIEW->model()->index(i,8).data().toString()==arg1)
          {
              number++;
          }
        }

    ui->label_notification_for_active->setText(QString::number(number));
}


/* ADD *********************************************************************************/

// Function to clear ADD tab
void MainWindow::Clear_ADD()
{
    #if (DEBUG_ACTIVE==true)
        qDebug()<<"Clearing ADD ...";
    #endif

    ui->pushButton_add_ADD->setEnabled(false);
    ui->pushButton_submit_ADD->setEnabled(false);
    ui->pushButton_delete_ADD->setEnabled(false);
    ui->pushButton_refresh_ADD->setEnabled(false);

    ui->lineEdit_Filtr_ADD->setText("");

    if(proxy!=NULL)
    {
        #if (DEBUG_ACTIVE==true)
            qDebug()<<"Deleting proxy...";
        #endif
        delete proxy; proxy=NULL;
    }

    if(delegate!=NULL)
    {
        #if (DEBUG_ACTIVE==true)
            qDebug()<<"Deleting delegate ...";
        #endif
        delete delegate; delegate=NULL;
    }
    if(rmodel!=NULL)
    {
        #if (DEBUG_ACTIVE==true)
            qDebug()<<"Deleting rmodel ...";
        #endif
        delete rmodel; rmodel=NULL;
    }
    if(model_add!=NULL)
    {
        #if (DEBUG_ACTIVE==true)
            qDebug()<<"Deleting model_add ...";
        #endif
        delete model_add; model_add=NULL;
    }
    creator_active=false;
    NOT_relation=false;
    isadded=false;
    editok=true;
    INFOlabel->setVisible(false);

    ui->tableView_ADD->setModel(0);

    ui->comboBox_items_ADD->clear();
    ui->comboBox_which_column_ADD_REMOVE->clear();
    ui->listWidget_ADD->clearSelection();
}

//[SLOT] - emitted when clicked on List Widget
void MainWindow::on_listWidget_ADD_clicked(const QModelIndex &index)
{
    Q_UNUSED(index);
    ui->pushButton_add_ADD->setEnabled(true);
    ui->pushButton_submit_ADD->setEnabled(true);
    ui->pushButton_delete_ADD->setEnabled(true);
    ui->pushButton_refresh_ADD->setEnabled(true);
    INFOlabel->setVisible(false);
    if(!access)
    {
        isadded=true;
        ui->tableView_ADD->scrollToBottom();
        rmodel->insertRow(rmodel->rowCount());
        //ui->pushButton_add_ADD->setEnabled(true);
        //ui->pushButton_submit_ADD->setEnabled(true);
        ui->pushButton_delete_ADD->setEnabled(false);
        ui->pushButton_refresh_ADD->setEnabled(false);
    }
}

// Function to fill first combobox
void MainWindow::fill_combobox()
{
    ui->comboBox_which_column_ADD_REMOVE->addItem("Wybierz kolumnę");
    ui->comboBox_items_ADD->addItem("Wybierz kolumnę");
    if(proxy!=NULL)
    {
        for(int i=1; i<proxy->columnCount();i++)
        {
            ui->comboBox_which_column_ADD_REMOVE->addItem(proxy->headerData(i, Qt::Horizontal).toString());
        }
    }
}

//[SLOT]- emitted when an item is pressed.
void MainWindow::on_listWidget_ADD_itemPressed(QListWidgetItem *item)
{
    #if (DEBUG_ACTIVE==true)
        qDebug()<<"on_listWidget_ADD_itemPressed START"<<endl;
        qDebug()<<"Delete rmodel";
    #endif
    rmodel=NULL;delete rmodel;

    #if (DEBUG_ACTIVE==true)
        qDebug()<<"Delete proxy";
    #endif
    proxy=NULL;delete proxy;

    #if (DEBUG_ACTIVE==true)
        qDebug()<<"Delete model_add";
    #endif
    model_add=NULL;delete model_add;

    creator_active=false;
    NOT_relation=false;
    isadded=false;
    editok=true;
    ui->comboBox_items_ADD->clear();
    ui->comboBox_which_column_ADD_REMOVE->clear();


    if(ui->listWidget_ADD->item(Miejsca_idx)==item && access==true)
    {
        main_table = "Miejsca";
        rmodel = new QSqlRelationalTableModel(this);
        proxy = new QSortFilterProxyModel(this);
        init_relation_model(rmodel,proxy,main_table,"Sektory","nazwa_Sektory");
    }
    else if(ui->listWidget_ADD->item(Daneosobowe_idx)==item && access==true)
    {
        creator_active=true;
        NOT_relation=true;
        main_table = "Daneosobowe";
        model_add = new QSqlTableModel(this);
        proxy = new QSortFilterProxyModel(this);
        create_model(proxy,model_add,main_table,ui->tableView_ADD,false,false);
        connect(model_add,SIGNAL(beforeUpdate(int,QSqlRecord&)),this,SLOT(moja(int,QSqlRecord&)));
    }
    else if(ui->listWidget_ADD->item(Maszyny_idx)==item && access==true)
    {
        creator_active=true;
        main_table = "Maszyny";
        rmodel = new QSqlRelationalTableModel(this);
        proxy = new QSortFilterProxyModel(this);
        init_relation_model(rmodel,proxy,"Maszyny","Miejsca","Zlecenia","nazwaDzialu_Miejsca","nr_Zlecenia");
    }
    else if(ui->listWidget_ADD->item(Konkurencja_idx)==item && access==true)
    {
        main_table = "Konkurencja";
        rmodel = new QSqlRelationalTableModel(this);
        proxy = new QSortFilterProxyModel(this);
        init_relation_model(rmodel,proxy,main_table,"Maszyny","nrFabryczny_Maszyny");
    }

    else if(ui->listWidget_ADD->item(RaportySerwisowe_idx)==item || access==false)
    {
        main_table = "Raportyserwisowe";
        rmodel = new QSqlRelationalTableModel(this);
        proxy = new QSortFilterProxyModel(this);
        init_relation_model(rmodel,proxy,"Raportyserwisowe","Zgloszeniaserwisowe","Maszyny","numer_Zgloszeniaserwisowe","nrFabryczny_Maszyny");
    }
    else if(ui->listWidget_ADD->item(ZgloszeniaSerwisowe_idx)==item && access==true)
    {
        main_table = "Zgloszeniaserwisowe";
        rmodel = new QSqlRelationalTableModel(this);
        proxy = new QSortFilterProxyModel(this);
        init_relation_model(rmodel,proxy,main_table,"Maszyny","nrFabryczny_Maszyny");
        connect (ui->tableView_ADD,SIGNAL(clicked(QModelIndex)),this, SLOT (showToolTip (QModelIndex)));
    }
    else if(ui->listWidget_ADD->item(Zlecenia_idx)==item && access==true)
    {
        NOT_relation=true;
        main_table = "Zlecenia";
        model_add = new QSqlTableModel(this);
        proxy = new QSortFilterProxyModel(this);
        create_model(proxy,model_add,main_table,ui->tableView_ADD,false,false);
    }
    else if(ui->listWidget_ADD->item(Czesci_idx)==item && access==true)
    {
        creator_active=true;
        NOT_relation=true;
        main_table = "Czesci";
        model_add = new QSqlTableModel(this);
        proxy = new QSortFilterProxyModel(this);
        create_model(proxy,model_add,main_table,ui->tableView_ADD,false,false);
        connect(model_add,SIGNAL(beforeUpdate(int,QSqlRecord&)),this,SLOT(moja(int,QSqlRecord&)));
    }
    fill_combobox();


#if (DEBUG_ACTIVE==true)
    qDebug()<<"Main table (ADD): "<<main_table<<endl;
#endif
}


void MainWindow::showToolTip (const QModelIndex & index) {

    if (! index.isValid ()) {
        return;
        }

    QString header_name=ui->tableView_ADD->model()->headerData(index.column(), Qt::Horizontal).toString();

    if(header_name.contains("Nr zgłoszenia") && ui->tableView_ADD->model()->data(index).toString()!="")
    {
        const QString actual_number=ui->tableView_ADD->model()->data(index).toString();
        QString text_to_tooltip;
        int x=0;
        if(isadded)x=1;
        for(int i=0;i<rmodel->rowCount()-x;i++)
        {
            if(ui->tableView_ADD->model()->index(i,1).data().toString().contains(actual_number))
            {
                 text_to_tooltip=text_to_tooltip+ui->tableView_ADD->model()->index(i,1).data().toString()+'\n';
            }
        }
        text_to_tooltip+=actual_number +" ???";
        QToolTip::showText(QCursor::pos(), text_to_tooltip);
    }

}

void MainWindow::set_headers_basic(QString _main_table, QSqlTableModel &_model)
{
    if(_main_table=="Czesci")
    {
        _model.setHeaderData(1, Qt::Horizontal, tr("Część"));
        _model.setHeaderData(2, Qt::Horizontal, tr("Nr części"));
        _model.setHeaderData(3, Qt::Horizontal, tr("Data produkcji"));
        _model.setHeaderData(4, Qt::Horizontal, tr("Data gwarancji"));
        _model.setHeaderData(5, Qt::Horizontal, tr("DTR Link"));
        _model.setHeaderData(6, Qt::Horizontal, tr("Miejsce"));
    }
    if(_main_table=="Daneosobowe")
    {
        _model.setHeaderData(1, Qt::Horizontal, tr("Imię"));
        _model.setHeaderData(2, Qt::Horizontal, tr("Nazwisko"));
        _model.setHeaderData(3, Qt::Horizontal, tr("Telefon"));
        _model.setHeaderData(4, Qt::Horizontal, tr("E-mail"));
        _model.setHeaderData(5, Qt::Horizontal, tr("Opis"));
        _model.setHeaderData(6, Qt::Horizontal, tr("Miejsce kooperanta"));
    }

    if(_main_table=="Zlecenia")
    {
        _model.setHeaderData(1, Qt::Horizontal, tr("Nr zlecenia"));
        _model.setHeaderData(2, Qt::Horizontal, tr("Temat"));
        _model.setHeaderData(3, Qt::Horizontal, tr("Harmonogram Link"));
        _model.setHeaderData(4, Qt::Horizontal, tr("Spis wysyłkowy Link"));
        _model.setHeaderData(5, Qt::Horizontal, tr("Opis"));
        _model.setHeaderData(6, Qt::Horizontal, tr("Historia Link"));
    }

}

void MainWindow::set_headers(QString _main_table,QSqlRelationalTableModel & _model)
{
    if(_main_table=="Miejsca")
    {
        _model.setHeaderData(1, Qt::Horizontal, tr("Miejsce"));
        _model.setHeaderData(2, Qt::Horizontal, tr("Dział"));
        _model.setHeaderData(3, Qt::Horizontal, tr("Adres"));
        _model.setHeaderData(4, Qt::Horizontal, tr("Opis"));
        _model.setHeaderData(5, Qt::Horizontal, tr("Historia Link"));
        _model.setHeaderData(6, Qt::Horizontal, tr("Typ"));
        _model.setHeaderData(7, Qt::Horizontal, tr("Sektor"));
    }
    else if(_main_table=="Maszyny")
    {
        _model.setHeaderData(1, Qt::Horizontal, tr("Maszyna"));
        _model.setHeaderData(2, Qt::Horizontal, tr("Nr fabryczny"));
        _model.setHeaderData(3, Qt::Horizontal, tr("Miejsce"));
        _model.setHeaderData(4, Qt::Horizontal, tr("Dokumentacja Link"));
        _model.setHeaderData(5, Qt::Horizontal, tr("Opis"));
        _model.setHeaderData(6, Qt::Horizontal, tr("Historia Link"));
        _model.setHeaderData(7, Qt::Horizontal, tr("Nr zlecenia"));
        _model.setHeaderData(8, Qt::Horizontal, tr("Aktywność"));
        _model.setHeaderData(9, Qt::Horizontal, tr("Koniec gwarancji"));

    }
    else if(_main_table=="Zgloszeniaserwisowe")
    {
        _model.setHeaderData(1, Qt::Horizontal, tr("Nr zgłoszenia"));
        _model.setHeaderData(2, Qt::Horizontal, tr("Maszyna"));
        _model.setHeaderData(3, Qt::Horizontal, tr("Opis"));
        _model.setHeaderData(4, Qt::Horizontal, tr("Historia Link"));
        _model.setHeaderData(5, Qt::Horizontal, tr("Data rozpoczęcia"));
        _model.setHeaderData(6, Qt::Horizontal, tr("Aktywność"));
        _model.setHeaderData(7, Qt::Horizontal, tr("Typ"));
        _model.setHeaderData(8, Qt::Horizontal, tr("Link"));
        _model.setHeaderData(9, Qt::Horizontal, tr("Data zakończenia"));
         _model.setHeaderData(10, Qt::Horizontal, tr("Wynik"));
    }
    else if(_main_table=="Raportyserwisowe")
    {
        _model.setHeaderData(1, Qt::Horizontal, tr("Data"));
        _model.setHeaderData(2, Qt::Horizontal, tr("Maszyna"));
        _model.setHeaderData(3, Qt::Horizontal, tr("Opis"));
        _model.setHeaderData(4, Qt::Horizontal, tr("Historia Link"));
        _model.setHeaderData(5, Qt::Horizontal, tr("Nr zgłoszenia"));
        _model.setHeaderData(6, Qt::Horizontal, tr("Serwisanci"));
        _model.setHeaderData(7, Qt::Horizontal, tr("Link"));
        _model.setHeaderData(8, Qt::Horizontal, tr("Godziny"));
        _model.setHeaderData(9, Qt::Horizontal, tr("Typ"));
    }
    else if(_main_table=="Konkurencja")
    {
        _model.setHeaderData(1, Qt::Horizontal, tr("Nazwa"));
        _model.setHeaderData(2, Qt::Horizontal, tr("Opis"));
        _model.setHeaderData(3, Qt::Horizontal, tr("Historia Link"));
        _model.setHeaderData(4, Qt::Horizontal, tr("Maszyna"));
    }
}

//INIT_RELATION_MODEL - init relation model to table - 1 relation
void MainWindow::init_relation_model(QSqlRelationalTableModel * _model, QSortFilterProxyModel * _proxy, QString tableName, QString rel_tableName, QString headerName)
{
    #if (DEBUG_ACTIVE==true)
        qDebug()<<"init_relation_model()-short"<<endl;
        qDebug()<<"Delegete in init_relation_model-start: "<<delegate;
    #endif

    QFont Font("Calibri Light", 12, QFont::Light ,false);

    _model->setEditStrategy(QSqlTableModel::OnManualSubmit);
    _model->setTable(tableName);
    _model->setRelation(_model->fieldIndex("id"+rel_tableName+"_"+tableName), QSqlRelation(rel_tableName, "id"+rel_tableName, headerName));
    _model->setSort(0,Qt::AscendingOrder);
    _model->select();
    set_headers(tableName,*_model);

    _proxy->setSourceModel(_model);
    _proxy->setFilterKeyColumn(-1);
    _proxy->setDynamicSortFilter(true);

    ui->tableView_ADD->setModel(_proxy);
    ui->tableView_ADD->hideColumn(0);;
    ui->tableView_ADD->verticalHeader()->setFixedWidth(50);
    ui->tableView_ADD->horizontalHeader()->setFixedHeight(30);
    ui->tableView_ADD->horizontalHeader()->setFont(Font);

    for (int col=1; col<_proxy->columnCount(); col++)
    {
      ui->tableView_ADD->setColumnWidth(col,230);
    }

    #if (DEBUG_ACTIVE==true)
            qDebug()<<"Deleting delegate...";
    #endif
    delegate=NULL;
    delete delegate;
    delegate=new mySqlRelationalDelegate(this);
    ui->tableView_ADD->setItemDelegate(delegate);

    #if (DEBUG_ACTIVE==true)
        qDebug()<<"Delegete in init_relation_model-end: "<<delegate;
    #endif

}

//INIT_RELATION_MODEL 2 - init relation model to table - 2 relations
void MainWindow::init_relation_model(QSqlRelationalTableModel * _model, QSortFilterProxyModel * _proxy, QString tableName, QString rel_tableName, QString rel_tableName2, QString headerName, QString headerName2)
{
    #if (DEBUG_ACTIVE==true)
        qDebug()<<"init_relation_model()-short"<<endl;
        qDebug()<<"Delegete in init_relation_model-start: "<<delegate;
    #endif
    QFont Font("Calibri Light", 12, QFont::Light ,false);

    _model->setEditStrategy(QSqlTableModel::OnManualSubmit);
    _model->setTable(tableName);
    _model->setRelation(_model->fieldIndex("id"+rel_tableName+"_"+tableName), QSqlRelation(rel_tableName, "id"+rel_tableName, headerName));
    _model->setRelation(_model->fieldIndex("id"+rel_tableName2+"_"+tableName), QSqlRelation(rel_tableName2, "id"+rel_tableName2, headerName2));
    _model->setSort(0,Qt::AscendingOrder);
    _model->select();
    set_headers(tableName,*_model);

    _proxy->setSourceModel(_model);
    _proxy->setFilterKeyColumn(-1);
    _proxy->setDynamicSortFilter(true);

    ui->tableView_ADD->setModel(_proxy);
    ui->tableView_ADD->hideColumn(0);
    ui->tableView_ADD->verticalHeader()->setFixedWidth(50);
    ui->tableView_ADD->horizontalHeader()->setFixedHeight(30);
    ui->tableView_ADD->horizontalHeader()->setFont(Font);
    for (int col=1; col<_proxy->columnCount(); col++)
    {
      ui->tableView_ADD->setColumnWidth(col,230);
    }

    #if (DEBUG_ACTIVE==true)
            qDebug()<<"Deleting delegate...";
    #endif
    delegate=NULL;
    delete delegate;
    delegate=new mySqlRelationalDelegate(this);
    ui->tableView_ADD->setItemDelegate(delegate);

    #if (DEBUG_ACTIVE==true)
        qDebug()<<"Delegete in init_relation_model-end: "<<delegate;
    #endif

}


//Function to check if row can be delete
bool MainWindow::is_selected_properly(QSqlRelationalTableModel * rmodel)
{
    #if (DEBUG_ACTIVE==true)
        qDebug()<<"init_selected_properly"<<endl;
    #endif

    if(main_table=="Miejsca"){

        int i=1;
        do{
            if(rmodel->index(i,7).data().toString()=="" || rmodel->index(i,7).data().toString()=="BRAK")
                {
                  QMessageBox::information(this,"Informacja","Nie można przyporządkować do 'BRAK'. Proszę wybrać sektor.");
                  if(!isadded)rmodel->select();
                  return false;
                }
            i++;
        }while(i<rmodel->rowCount());

    }

    if(main_table=="Maszyny"){

        int i=1;
        do{
            if(rmodel->index(i,3).data().toString()=="" || rmodel->index(i,3).data().toString()=="BRAK")
                {
                  QMessageBox::information(this,"Informacja","Nie można przyporządkować do 'BRAK'. Proszę wybrać miejsce.");
                  if(!isadded)rmodel->select();
                  return false;
                }
            i++;
        }while(i<rmodel->rowCount());

    }

    if(main_table=="Raportyserwisowe"){

        int i=0;
        do{
            if(rmodel->index(i,2).data().toString()=="" || rmodel->index(i,2).data().toString()=="BRAK")
                {
                  QMessageBox::information(this,"Informacja","Nie można przyporządkować do 'BRAK'. Proszę wybrać maszynę.");
                  if(!isadded)rmodel->select();
                  return false;
                }
            i++;
        }while(i<rmodel->rowCount());

    }

    return true;

}

//ADD_RECORD - adding new record to QSqlTableModel
void MainWindow::add_record(QSqlTableModel* model)
{
    isadded=true;
    ui->tableView_ADD->scrollToBottom();
    model->insertRow(model->rowCount());
}

//ADD_RECORD - adding new record to QSqlRelationalTableModel
void MainWindow::add_record(QSqlRelationalTableModel* rmodel)
{
    isadded=true;
    ui->tableView_ADD->scrollToBottom();
    rmodel->insertRow(rmodel->rowCount());
}

//DELETE_RECORD - deleting record from table QSqlTableModel
bool MainWindow::delete_record(QSqlTableModel* model)
{
   if(model->index(ui->tableView_ADD->currentIndex().row(),1).data().toString()=="BRAK")
       {
       QMessageBox::information(this,"Informacja","Nie można usunąć tej pozycji.");
       return false;
       }
   model->removeRows(ui->tableView_ADD->currentIndex().row(), 1);
   return true;
}

//DELETE_RECORD - deleting record from table QSqlRelationalTableModel
bool MainWindow::delete_record(QSqlRelationalTableModel* rmodel)
{
    if(rmodel->index(ui->tableView_ADD->currentIndex().row(),1).data().toString()=="BRAK")
        {
        QMessageBox::information(this,"Informacja","Nie można usunąć tej pozycji.");
        return false;
        }
    rmodel->removeRows(ui->tableView_ADD->currentIndex().row(), 1);
    return true;
}

void MainWindow::check_selcted_place(QString data_to_check,bool added=true)
{

    if(added && data_to_check.isEmpty()==false)
    {
        int y=0;
        QSqlQueryModel model_Q;
        model_Q.setQuery("SELECT * FROM Miejsca");

        #if (DEBUG_ACTIVE==true)
            qDebug()<<"row Count"<<model_Q.rowCount();
            //qDebug()<<"row Count-2"<<model->rowCount();
            qDebug()<<"Place to check: "<<data_to_check;
        #endif

        // podziel miejsca:
        QStringList list = data_to_check.split(",");
        QString przecinek =",";
        for(int j=0;j<list.length();j++)
        {
            y=0;
            list[j].replace(" ","");

            for(int i=0;i<model_Q.rowCount();i++)
            {
                int x =QString::compare(model_Q.data(model_Q.index(i, 1)).toString(),list[j], Qt::CaseInsensitive);
                #if (DEBUG_ACTIVE==true)
                    qDebug()<<"MIEJSCA="<<model_Q.data(model_Q.index(i, 1));
                    qDebug()<<"CZESCI="<<list[j];
                    qDebug()<<"x="<<x;
                #endif

                if(!x)
                {
                    break;
                }
                y++;

                #if (DEBUG_ACTIVE==true)
                    qDebug()<<"y="<<y;
                #endif
            }

            if(y==model_Q.rowCount())
            {
                #if (DEBUG_ACTIVE==true)
                    qDebug()<<"NIE ZNALEZIONO" << data_to_check;
                #endif
                place_to_add+=list[j] + ",";
            }

        }
    }
}

void MainWindow::moja(int row, QSqlRecord &record)
{
    Q_UNUSED(record);
    if(main_table=="Czesci" || main_table=="Daneosobowe")
        check_selcted_place(model_add->data(model_add->index(row, 6)).toString());
}

//SUBMIT - sumbit changes in table QSqlTableModel
bool MainWindow::submit(QSqlTableModel *model)
{
    if(!model->submitAll())
    {
        QMessageBox::warning(this,"BŁĄD",model->lastError().text());
        last_error=model->lastError().text();
        if(!isadded)model->select();
        return false;
    }
    else
    {
        QMessageBox::information(this,"Informacja","Operacja została wykonana.");
        check_selcted_place(model->data(model->index(model->rowCount()-1, 6)).toString(),isadded);

        if(!place_to_add.isEmpty())
        {
            QString string = place_to_add.left(place_to_add.size()-1);
            QMessageBox::warning(this,"Informacja", "Do tabeli Miejsca należy dodać miejsca: "+string);
            last_error="Do tabeli Miejsca należy dodać miejsca: "+string;
            string.clear();
            place_to_add.clear();
        }
        if(!creator_active)isadded=false;
        if(!isadded)model->select();
        return true;
    }
}

//SUBMIT - sumbit changes in table QSqlRelationalTableModel
bool MainWindow::submit(QSqlRelationalTableModel *rmodel)
{
    if(!rmodel->submitAll())
    {
        QMessageBox::warning(this,"BŁĄD",rmodel->lastError().text());
        last_error=rmodel->lastError().text();
        if(!isadded)rmodel->select();
        return false;
    }
    else
    {
        QMessageBox::information(this,"Informacja","Operacja została wykonana.");
        if(!creator_active)isadded=false;
        if(!isadded)rmodel->select();
        return true;
    }

}

//[SLOT] - add new row
void MainWindow::on_pushButton_add_ADD_clicked()
{
    if(isadded==true)
        {
            QMessageBox::information(this,"Informacja","Nie można dodać dwóch pustych wierszy.");
            return;
        }
    if(!NOT_relation) add_record(rmodel);
    else add_record(model_add);
}

//[SLOT] - sumbit changes
void MainWindow::on_pushButton_submit_ADD_clicked()
{
    bool isok;

    if(!NOT_relation)
    {
        if(!is_selected_properly(rmodel)) return;
        isok=submit(rmodel);

        if(main_table=="Raportyserwisowe" || main_table=="Zgloszeniaserwisowe")
        {
                QSqlQuery query;
                query.prepare("call serwis_v8.raporty_zgloszenia()");
                query.exec();
                if(!isadded)rmodel->select();
        }

        if(creator_active && isadded && isok)
        {
            creatordialog * creator = new creatordialog(main_table,this);
            if (creator->exec() != QDialog::Accepted)
            {
                delete creator;
                isadded=false;
            }
            else
            {
                delete creator;
                isadded=false;
            }
        }
    }

    else
    {
        isok=submit(model_add);
        if(creator_active && isadded && isok)
        {
            creatordialog * creator = new creatordialog(main_table,this);
            if (creator->exec() != QDialog::Accepted)
            {
                delete creator;
                isadded=false;
            }
            else
            {
                delete creator;
                isadded=false;
            }
        }
    }
}

//[SLOT] - delete selected row
void MainWindow::on_pushButton_delete_ADD_clicked()
{
    #if (DEBUG_ACTIVE==true)
        qDebug()<<ui->tableView_ADD->currentIndex().row();
    #endif

    if(ui->tableView_ADD->currentIndex().row()!=-1)
    {
        QMessageBox msgBox;
        QPushButton yes_button;
        QPushButton no_button;
        yes_button.setText("TAK");
        no_button.setText("NIE");
        msgBox.addButton(&yes_button, QMessageBox::YesRole);
        msgBox.addButton(&no_button, QMessageBox::NoRole);
        msgBox.setWindowTitle("???");
        msgBox.setText("Czy na pewno USUNĄĆ?");
        msgBox.exec();
        if (msgBox.clickedButton()!=&yes_button)
        {
            return;
        }

        if(!isadded)
        {
            if(!NOT_relation)
            {
                if(!delete_record(rmodel)) return;
                submit(rmodel);
            }
            else
            {
                if(!delete_record(model_add)) return;
                submit(model_add);
            }
        }
        else
             QMessageBox::information(this,"Informacja","Nie można usunąć gdy dodany jest pusty wiersz. Proszę użyć przycisku aktualizacji.");
    }
    else
           QMessageBox::information(this,"Informacja","Nie zaznaczono wiersza do usunięcia.");
}

//[SLOT] - refresh view
void MainWindow::on_pushButton_refresh_ADD_clicked()
{

    if(!NOT_relation) rmodel->select();
    else model_add->select();
    isadded=false;
}

//[SLOT] - slot to check if row can be update
void MainWindow::on_tableView_ADD_pressed(const QModelIndex &index)
{
    if(!NOT_relation)
    {
        if(isadded || !access)
        {
            if(index.row()!=rmodel->rowCount()-1)  QMessageBox::information(this,"Informacja","Nie można edytować tej pozycji, w czasie uzupełniania nowego wiersza.");
        }
    }
    else
    {
            if(isadded)
            {
                if(index.row()!=model_add->rowCount()-1)  QMessageBox::information(this,"Informacja","Nie można edytować tej pozycji, w czasie uzupełniania nowego wiersza.");
            }
    }

    int row=index.row();
    if(ui->tableView_ADD->model()->index(row,1).data().toString()=="BRAK" || ui->tableView_ADD->model()->index(row,1).data().toString()=="TYMCZASOWA")
            QMessageBox::information(this,"Informacja","Nie można edytować tej pozycji.");
}

void MainWindow::on_pushButton_10_clicked()
{
    static int i=0;
    i=i^1;

    if(i)ui->groupBox->setVisible(true);
    else ui->groupBox->setVisible(false);
}

void MainWindow::on_checkBox_M_DO_clicked(bool checked)
{
    if(checked)
    {
        creatordialog * creator = new creatordialog("Maszyny_has_Daneosobowe",this);
        if (creator->exec() != QDialog::Accepted)
        {
            ui->checkBox_M_DO->setChecked(false);
            delete creator;
            isadded=false;

        }
        else
        {
            ui->checkBox_M_DO->setChecked(false);
            delete creator;
            isadded=false;

        }
    }
}

void MainWindow::on_checkBox_M_CZ_clicked(bool checked)
{
    if(checked)
    {
        creatordialog * creator = new creatordialog("Maszyny_has_Czesci",this);
        if (creator->exec() != QDialog::Accepted)
        {
            ui->checkBox_M_CZ->setChecked(false);
            delete creator;
            isadded=false;
        }
        else
        {
            ui->checkBox_M_CZ->setChecked(false);
            delete creator;
            isadded=false;

        }
    }
}

//[SLOT] - slot which connect comboboxes
void MainWindow::combobox_selected_column_ADD(QString column_name)
{
    #if (DEBUG_ACTIVE==true)
        qDebug()<<"Combobox item name"<<column_name<<endl;
    #endif
    if(column_name=="Wybierz kolumnę")
    {
        ui->comboBox_items_ADD->clear();
        ui->comboBox_items_ADD->addItem("Wybierz kolumnę");
    }

    else
    {
        QAbstractItemModel *tableModel =  ui->tableView_ADD->model();
        int iRows = tableModel->rowCount();
        QStringList list;
        QModelIndex idx;
        QString str;
        int index;

        ui->comboBox_items_ADD->clear();

        for(int i=0; i<tableModel->columnCount();i++)
        {
            if(tableModel->headerData(i,Qt::Horizontal).toString()==column_name)
            {
                index=i;
            }
        }

        for(int i=0;i<iRows;i++)
        {
           idx = tableModel->index(i, index);
           str = tableModel->data(idx,Qt::DisplayRole).toString();
           if( !list.contains(str) && str!="" )list.append(str);
        }

        ui->comboBox_items_ADD->addItems(list);
    }
}

//[SLOT] - slot when QlineEdit change
void MainWindow::filterRegExpChanged_ADD()
{
      if(ui->pushButton_submit_ADD->isEnabled()==true)
      {
           proxy->setFilterKeyColumn(-1);
           Qt::CaseSensitivity caseSensitivity =
                    ui->checkBox_case_ADD->isChecked() ? Qt::CaseSensitive
                                                               : Qt::CaseInsensitive;

          QRegExp regExp(ui->lineEdit_Filtr_ADD->text(), caseSensitivity, QRegExp::Wildcard);
          proxy->setFilterRegExp(regExp);

          ui->comboBox_items_ADD->clear();
          ui->comboBox_items_ADD->addItem("Wybierz kolumnę");
          ui->comboBox_which_column_ADD_REMOVE->setCurrentIndex(0);
      }

      else
      {
          if(ui->lineEdit_Filtr_ADD->text()!="")
          {
              QMessageBox::information(this,"Informacja", "Brak tabeli. Proszę wybrać tabelę.");
              INFOlabel->setGeometry(ui->listWidget_VIEW->size().width()-50,ui->topFrame->size().height()+25,30,30);
          }
          INFOlabel->setVisible(true);
          ui->lineEdit_Filtr_ADD->setText("");
     }
}

void MainWindow::on_pushButton_clear_search_ADD_clicked()
{
    if(ui->pushButton_submit_ADD->isEnabled()==true)
    {
        proxy->setFilterKeyColumn(-1);
        ui->lineEdit_Filtr_ADD->clear();
        QRegExp regExp("", Qt::CaseInsensitive, QRegExp::Wildcard);
        proxy->setFilterRegExp(regExp);

        ui->comboBox_items_ADD->clear();
        ui->comboBox_items_ADD->addItem("Wybierz kolumnę");
        ui->comboBox_which_column_ADD_REMOVE->setCurrentIndex(0);
    }

    else
    {
        if(ui->lineEdit_Filtr_ADD->text().isEmpty())
            {
                QMessageBox::information(this,"Informacja", "Brak tabeli. Proszę wybrać tabelę.");
                INFOlabel->setGeometry(ui->listWidget_ADD->size().width()-50,ui->topFrame->size().height()+25,30,30);
            }
        INFOlabel->setVisible(true);
        ui->lineEdit_Filtr_ADD->setText("");
    }
}

void MainWindow::on_pushButton_submit_filter_ADD_clicked()
{
    if(ui->pushButton_submit_ADD->isEnabled()==true)
    {
        int idx;
        QString search_header_name=ui->comboBox_which_column_ADD_REMOVE->currentText();

        for(int i=0;i<proxy->columnCount();i++)
        {
            QString header_name=ui->tableView_ADD->model()->headerData(i, Qt::Horizontal).toString();
            if(header_name==search_header_name) {idx=i; break;}
        }


        QString arg1;
        arg1=ui->comboBox_items_ADD->currentText();
        if(arg1!="Wybierz kolumnę")
        {
           QRegExp regExp(arg1, Qt::CaseInsensitive, QRegExp::Wildcard);
           proxy->setFilterKeyColumn(idx);
           proxy->setFilterRegExp(regExp);

           ui->comboBox_items_ADD->clear();
           ui->comboBox_items_ADD->addItem("Wybierz kolumnę");
           ui->comboBox_which_column_ADD_REMOVE->setCurrentIndex(0);
        }
    }
    else
    {
        QMessageBox::information(this,"Informacja", "Brak tabeli. Proszę zatwierdzić");
        INFOlabel->setGeometry(ui->listWidget_ADD->size().width()-50,ui->topFrame->size().height()+25,30,30);
        INFOlabel->setVisible(true);
    }
}

void MainWindow::on_pushButton_clear_filter_ADD_clicked()
{
    if(ui->pushButton_submit_ADD->isEnabled()==true)
    {
        proxy->setFilterKeyColumn(-1);
        ui->lineEdit_Filtr_ADD->clear();
        QRegExp regExp("", Qt::CaseInsensitive, QRegExp::Wildcard);
        proxy->setFilterRegExp(regExp);

        ui->comboBox_items_ADD->clear();
        ui->comboBox_items_ADD->addItem("Wybierz kolumnę");
        ui->comboBox_which_column_ADD_REMOVE->setCurrentIndex(0);
    }
    else
    {
        QMessageBox::information(this,"Informacja", "Brak tabeli. Proszę zatwierdzić");
        INFOlabel->setGeometry(ui->listWidget_ADD->size().width()-50,ui->topFrame->size().height()+25,30,30);
        INFOlabel->setVisible(true);
    }
}


void MainWindow::on_tableView_ADD_clicked(const QModelIndex &index)
{
    QString header_name=ui->tableView_ADD->model()->headerData(index.column(), Qt::Horizontal).toString();

    if(header_name.contains("Link"))
    {
            QString init_path;
            if(header_name.contains("Historia")) init_path = "//k1/Serwis/Historia";
            else if(header_name.contains("Dokumentacja")) init_path = "//k1/Konstrukcyjny/Projekty-2/I N S T R U K C J E";
            else if(header_name.contains("Spis")) init_path = "//k1/Handlowy/Metalika/Specyfikacje";
            else if(header_name.contains("Harmonogram")) init_path = "//k1/Konstrukcyjny/Projekty-2/Harmonogramy";

           QUrl filename = QFileDialog::getOpenFileUrl(
            this,
            tr("Wybierz plik"),
            QUrl::fromLocalFile(init_path),
            tr("Nazwa pliku (*.doc *.docx *.pdf *.xls *.xlsx *.xlm);;Wszystkie (*.*)") );
           if( !filename.isEmpty() )
             {
                 QClipboard *clip = QApplication::clipboard();
                 clip->setText(filename.toString());
                 ui->tableView_ADD->model()->setData(ui->tableView_ADD->currentIndex(), QApplication::clipboard()->text() );
             }
     }

     else if(header_name=="Opis")
     {
          const QString opis=ui->tableView_ADD->model()->data(index).toString();
          QClipboard *clip = QApplication::clipboard();
          clip->clear();

          QDialog description_dialog;
          description_dialog.setWindowTitle("Opis");
          description_dialog.setWindowIcon(QIcon(path+"/obrazy/services_icon.png"));

          QVBoxLayout layout(&description_dialog);
          QScrollArea scroll;

          QTextEdit description_edit;
          description_edit.setText(opis);
          description_edit.setFocus();

          QPushButton apply;
          apply.setText("Zatwierdź");
          connect(&apply,SIGNAL(clicked()),&description_dialog,SLOT(accept()));

          scroll.setWidget(&description_edit);
          layout.addWidget(&scroll);
          layout.addWidget(&apply);

          description_edit.moveCursor(QTextCursor::End);
          QTimer::singleShot(0,&description_edit,SLOT(setFocus()));


          if (description_dialog.exec() == QDialog::Accepted)
              {
                  QString input = description_edit.toPlainText();
                  clip->setText(input);
                  ui->tableView_ADD->model()->setData(ui->tableView_ADD->currentIndex(), QApplication::clipboard()->text() );
              }
          else
              {
                  clip->setText(opis);
                  ui->tableView_ADD->model()->setData(ui->tableView_ADD->currentIndex(), QApplication::clipboard()->text() );
              }
      }
}

void MainWindow::on_tableView_ADD_activated(const QModelIndex &index)
{
    QString header_name=ui->tableView_ADD->model()->headerData(index.column(), Qt::Horizontal).toString();

    if(header_name.contains("Link"))
    {
            QString init_path;
            if(header_name.contains("Historia")) init_path = "//k1/Serwis/Historia";
            else if(header_name.contains("Dokumentacja")) init_path = "//k1/Konstrukcyjny/Projekty-2/I N S T R U K C J E";
            else if(header_name.contains("Spis")) init_path = "//k1/Handlowy/Metalika/Specyfikacje";
            else if(header_name.contains("Harmonogram")) init_path = "//k1/Konstrukcyjny/Projekty-2/Harmonogramy";

            QUrl filename = QFileDialog::getOpenFileUrl(
            this,
            tr("Wybierz plik"),
            QUrl::fromLocalFile(init_path),
            tr("Nazwa pliku (*.doc *.docx *.pdf *.xls *.xlsx *.xlm);;Wszystkie (*.*)") );
            if( !filename.isEmpty() )
             {
                 QClipboard *clip = QApplication::clipboard();
                 clip->setText(filename.toString());
                 ui->tableView_ADD->model()->setData(ui->tableView_ADD->currentIndex(), QApplication::clipboard()->text() );
             }
     }


     else if(header_name=="Opis")
     {
          const QString opis=ui->tableView_ADD->model()->data(index).toString();
          QClipboard *clip = QApplication::clipboard();
          clip->clear();

          QDialog description_dialog;
          description_dialog.setWindowTitle("Opis");
          description_dialog.setWindowIcon(QIcon(path+"/obrazy/services_icon.png"));

          QVBoxLayout layout(&description_dialog);
          QScrollArea scroll;

          QTextEdit description_edit;
          description_edit.setText(opis);
          description_edit.setFocus();

          QPushButton apply;
          apply.setText("Zatwierdź");
          connect(&apply,SIGNAL(clicked()),&description_dialog,SLOT(accept()));

          scroll.setWidget(&description_edit);
          layout.addWidget(&scroll);
          layout.addWidget(&apply);

          description_edit.moveCursor(QTextCursor::End);
          QTimer::singleShot(0,&description_edit,SLOT(setFocus()));

          if (description_dialog.exec() == QDialog::Accepted)
              {
                  QString input = description_edit.toPlainText();
                  clip->setText(input);
                  ui->tableView_ADD->model()->setData(ui->tableView_ADD->currentIndex(), QApplication::clipboard()->text());
              }
          else
              {
                  clip->setText(opis);
                  ui->tableView_ADD->model()->setData(ui->tableView_ADD->currentIndex(), QApplication::clipboard()->text() );
              }
      }


}
