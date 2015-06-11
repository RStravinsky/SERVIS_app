#include "mainwindow.h"
#include "ui_mainwindow.h"

#define DEBUG_ACTIVE true

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

    //ui->SubmitSearchbutton_VIEW->setIcon(QIcon("C:/Users/rstrawinski/Pictures/accept.png"));
    //ui->SubmitSearchbutton_VIEW->setIconSize(QSize(20, 20));

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
    search_for_all=true;
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
    ui->ReturnButton_VIEW->setVisible(false);
    ui->label_add_table_VIEW->setVisible(false);
    ui->comboBox_which_column_VIEW->addItem("Wybierz kolumnę");
    create_comboBox();
    ui->pushButton_submit_VIEW->setDefault(true);

    //ui->SubmitSearchbutton_VIEW->setVisible(false);

    /* signal & slots */
    connect(ui->comboBox_which_column_VIEW, SIGNAL (activated(int)), this, SLOT (combobox_selected_column(int)));
    connect(ui->lineEdit_Filtr_VIEW, SIGNAL(textChanged(QString)),
               this, SLOT(filterRegExpChanged()));
    connect(ui->checkBox, SIGNAL(toggled(bool)),
               this, SLOT(filterRegExpChanged()));
}

MainWindow::~MainWindow()
{
    LoginDialog login;
    login.closeDB();
    delete proxy;
    delete model;
    delete comboBox_column_VIEW;
    delete ui;
}

const QString MainWindow::Sektor_checklist[3] = {"Miejsca", "Dane osobowe", "Maszyny"};
const QString MainWindow::Miejsca_checklist[4] = {"Sektory", "Dane osobowe", "Maszyny","Zlecenia"};
const QString MainWindow::Maszyny_checklist[9] = {"Sektory", "Miejsca", "Dane osobowe","Zlecenia","Konkurencja", "Wykaz kooperantów", "Raporty serwisowe","Zgłoszenia serwisowe","Części"};
const QString MainWindow::Zlecenia_checklist[2] = {"Maszyny", "Wykaz kooperantów"};
const QString MainWindow::Wykazkooperantow_checklist[3] = {"Dane osobowe","Maszyny","Wykaz kooperantów"};
const QString MainWindow::Raportyserwisowe_checklist[2] = {"Maszyny", "Zgłoszenia serwisowe"};
const QString MainWindow::Zgloszeniaserwisowe_checklist[3] = {"Maszyny", "Wykaz kooperantów","Raporty serwisowe"};
const QString MainWindow::Czesci_checklist[2]= {"Maszyny","Wykaz kooperantów"};

/* MAIN WINDOW ****************************************************************************/

void MainWindow::keyPressEvent(QKeyEvent* pe)
{
if(pe->key() == Qt::Key_Return && ui->stackedWidget->currentIndex()==0)on_pushButton_submit_VIEW_clicked();
}

//reciveAccess() - slot to recive information from login dialog about access
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

// reciveEvent() - event to change size of some widgets when resizing
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

        QFont font = ui->tableView->font();
        int fontSize = 50;
        qDebug()<<"SZEROKOSC:"<<ui->centralWidget->width()<<endl;
        QFont a(font);
        a.setPixelSize( fontSize );
        if(ui->centralWidget->width()>1620 && ui->centralWidget->width()<=1920)fontSize=14.5;
        if(ui->centralWidget->width()>=1320 && ui->centralWidget->width()<=1620)fontSize=13.5;
        if(ui->centralWidget->width()<=1320)fontSize=12.5;
        font.setPixelSize(fontSize);
        ui->tableView->setFont(font);
        ui->tableView->horizontalHeader()->setFont(font);
        ui->tableView->verticalHeader()->setFont(font);

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

//Create dynamically comboBox for filter
void MainWindow::create_comboBox()
{
    QFont Combo_font("Calibri Light", 14, QFont::Light ,false);
    comboBox_column_VIEW = new QComboBox(ui->stackedWidget);
    comboBox_column_VIEW->setFont(Combo_font);
    comboBox_column_VIEW->setGeometry(1210,23,231,31);
    comboBox_column_VIEW->addItem("Wybierz kolumnę");
    comboBox_column_VIEW->setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Preferred);
    comboBox_column_VIEW->setMinimumWidth(170);
    comboBox_column_VIEW->setMaximumWidth(300);
    ui->horizontalLayout_FIND_COLUMN->insertWidget(2,comboBox_column_VIEW);
    comboBox_column_VIEW->setVisible(true);
#if (DEBUG_ACTIVE==true)
    qDebug()<<"Creating second combobox ..."<<endl;
#endif
}

//[SIGNAL] - emitted when clicked on List Widget
void MainWindow::on_listWidget_VIEW_clicked()
{
 ui->label_arrow_VIEW->setEnabled(true);
 ui->stackedWidget_2->setEnabled(true);
 INFOlabel->setVisible(false);
}

//[SIGNAL] - emitted when row on List Widget changed. Used to clear all parameter after changing the row.
void MainWindow::on_listWidget_VIEW_currentRowChanged()
{
    ClearArray(dynamic_table);
    unselect_all_CHECKBOX();
}

//[SIGNAL]- emitted when an item is pressed. Used for communications between listWidet items and checkboxes
void MainWindow::on_listWidget_VIEW_itemPressed(QListWidgetItem *item)
{

    if(ui->listWidget_VIEW->item(Sektory_idx)==item)
    {
        ui->stackedWidget_2->setCurrentIndex(Sektory_idx);
        main_table = "Sektory";
    }
    else if(ui->listWidget_VIEW->item(Miejsca_idx)==item)
    {
        ui->stackedWidget_2->setCurrentIndex(Miejsca_idx);
        main_table = "Miejsca";
    }
    else if(ui->listWidget_VIEW->item(Daneosobowe_idx)==item)
    {
      ui->stackedWidget_2->setCurrentIndex(Daneosobowe_idx);
      main_table = "Daneosobowe";
    }
    else if(ui->listWidget_VIEW->item(Maszyny_idx)==item)
    {
      ui->stackedWidget_2->setCurrentIndex(Maszyny_idx);
      main_table = "Maszyny";
    }
    else if(ui->listWidget_VIEW->item(Zlecenia_idx)==item)
    {
      ui->stackedWidget_2->setCurrentIndex(Zlecenia_idx);
      main_table = "Zlecenia";
    }
    else if(ui->listWidget_VIEW->item(Konkurencja_idx)==item)
    {
      ui->stackedWidget_2->setCurrentIndex(Konkurencja_idx);
      main_table = "Konkurencja";
    }
    else if(ui->listWidget_VIEW->item(WykazKooperantow_idx)==item)
    {
      ui->stackedWidget_2->setCurrentIndex(WykazKooperantow_idx);
      main_table = "Wykazkooperantow";
    }
    else if(ui->listWidget_VIEW->item(RaportySerwisowe_idx)==item)
    {
      ui->stackedWidget_2->setCurrentIndex(RaportySerwisowe_idx);
      main_table = "Raportyserwisowe";
    }
    else if(ui->listWidget_VIEW->item(ZgloszeniaSerwisowe_idx)==item)
    {
      ui->stackedWidget_2->setCurrentIndex(ZgloszeniaSerwisowe_idx);
      main_table = "Zgloszeniaserwisowe";
      column_const= ZgloszeniaSerwisowe;
    }
    else if(ui->listWidget_VIEW->item(Czesci_idx)==item)
    {
      ui->stackedWidget_2->setCurrentIndex(Czesci_idx);
      main_table = "Czesci";
    }

#if (DEBUG_ACTIVE==true)
    qDebug()<<"Main table: "<<main_table<<endl;
#endif
}

//Unselect all chcecboxes in "VIEW"
void MainWindow::unselect_all_CHECKBOX()
{
ui->checkBox_miejsca_SEKTOR->setChecked(false);
ui->checkBox_daneosobowe_SEKTOR->setChecked(false);
ui->checkBox_maszyny_SEKTOR->setChecked(false);

ui->checkBox_daneosobowe_MIEJSCA->setChecked(false);
ui->checkBox_sektor_MIEJSCA->setChecked(false);
ui->checkBox_maszyny_MIEJSCA->setChecked(false);
ui->checkBox_zlecenia_MIEJSCA->setChecked(false);

ui->checkBox_DANEOSOBOWE->setChecked(false);

ui->checkBox_czesci_MASZYNY->setChecked(false);
ui->checkBox_daneosobowe_MASZYNY->setChecked(false);
ui->checkBox_konkurencja_MASZYNY->setChecked(false);
ui->checkBox_kooperant_MASZYNY->setChecked(false);
ui->checkBox_miejsca_MASZYNY->setChecked(false);
ui->checkBox_raporty_MASZYNY->setChecked(false);
ui->checkBox_sektor_MASZYNY->setChecked(false);
ui->checkBox_zgloszenia_MASZYNY->setChecked(false);
ui->checkBox_zlecenia_MASZYNY->setChecked(false);

ui->checkBox_kooperant_ZLECENIA->setChecked(false);
ui->checkBox_maszyny_ZLECENIA->setChecked(false);

ui->checkBox_KONKURENCJA->setChecked(false);

ui->checkBox_czesci_KOOPERANT->setChecked(false);
ui->checkBox_daneosobowe_KOOPERANT->setChecked(false);
ui->checkBox_maszyny_KOOPERANT->setChecked(false);

ui->checkBox_maszyny_RAPORT->setChecked(false);
ui->checkBox_zgoszenia_RAPORT->setChecked(false);

ui->checkBox_kooperant_ZGLOSZENIA->setChecked(false);
ui->checkBox_maszyny_ZGLOSZENIA->setChecked(false);
ui->checkBox_raporty_ZGLOSZENIA->setChecked(false);

ui->checkBox_kooperant_CZESCI->setChecked(false);
ui->checkBox_maszyny_CZESCI->setChecked(false);

#if (DEBUG_ACTIVE==true)
    qDebug()<<"Clearing checkboxes ..."<<endl;
#endif

}

//[SIGNAL] - select all checboxes depending on the item position in the list Widget + adding to dynamic array
void MainWindow::on_SelectButton_VIEW_clicked()
{
if(ui->stackedWidget_2->isEnabled()==true)
{
    ClearArray(dynamic_table);
    int size=0;

    if(ui->stackedWidget_2->currentIndex()==Sektory_idx)
    {
        size=3;
        ui->checkBox_miejsca_SEKTOR->setChecked( true );
        ui->checkBox_daneosobowe_SEKTOR->setChecked( true );
        ui->checkBox_maszyny_SEKTOR->setChecked( true );

        FillArray(dynamic_table, Sektor_checklist, size);
    }

    else if(ui->stackedWidget_2->currentIndex()==Miejsca_idx)
    {
        size=4;
        ui->checkBox_sektor_MIEJSCA->setChecked( true );
        ui->checkBox_daneosobowe_MIEJSCA->setChecked( true );
        ui->checkBox_maszyny_MIEJSCA->setChecked( true );
        ui->checkBox_zlecenia_MIEJSCA->setChecked( true );

        FillArray(dynamic_table, Miejsca_checklist, size);
    }

    else if(ui->stackedWidget_2->currentIndex()==Daneosobowe_idx) QMessageBox::information(this,"Informacja", "NIE UKOŃCZONO.");

    else if(ui->stackedWidget_2->currentIndex()==Maszyny_idx)
    {
        size=9;
        ui->checkBox_czesci_MASZYNY->setChecked(true);
        ui->checkBox_daneosobowe_MASZYNY->setChecked(true);
        ui->checkBox_konkurencja_MASZYNY->setChecked(true);
        ui->checkBox_kooperant_MASZYNY->setChecked(true);
        ui->checkBox_miejsca_MASZYNY->setChecked(true);
        ui->checkBox_raporty_MASZYNY->setChecked(true);
        ui->checkBox_sektor_MASZYNY->setChecked(true);
        ui->checkBox_zgloszenia_MASZYNY->setChecked(true);
        ui->checkBox_zlecenia_MASZYNY->setChecked(true);

        FillArray(dynamic_table, Maszyny_checklist, size);
    }

    else if(ui->stackedWidget_2->currentIndex()==Zlecenia_idx)
    {
        size=2;
        ui->checkBox_kooperant_ZLECENIA->setChecked(true);
        ui->checkBox_maszyny_ZLECENIA->setChecked(true);

        FillArray(dynamic_table, Zlecenia_checklist, size);
    }

    else if(ui->stackedWidget_2->currentIndex()==Konkurencja_idx) QMessageBox::information(this,"Informacja", "NIE UKOŃCZONO.");

    else if(ui->stackedWidget_2->currentIndex()==WykazKooperantow_idx)
    {
        size=3;
        ui->checkBox_czesci_KOOPERANT->setChecked(true);
        ui->checkBox_daneosobowe_KOOPERANT->setChecked(true);
        ui->checkBox_maszyny_KOOPERANT->setChecked(true);

        FillArray(dynamic_table, Miejsca_checklist, size);
    }

    else if(ui->stackedWidget_2->currentIndex()==RaportySerwisowe_idx)
    {
        size=2;
        ui->checkBox_maszyny_RAPORT->setChecked(true);
        ui->checkBox_zgoszenia_RAPORT->setChecked(true);

        FillArray(dynamic_table, Raportyserwisowe_checklist, size);
    }

    else if(ui->stackedWidget_2->currentIndex()==ZgloszeniaSerwisowe_idx)
    {
        size=3;
        ui->checkBox_kooperant_ZGLOSZENIA->setChecked(true);
        ui->checkBox_maszyny_ZGLOSZENIA->setChecked(true);
        ui->checkBox_raporty_ZGLOSZENIA->setChecked(true);

        FillArray(dynamic_table, Zgloszeniaserwisowe_checklist, size);
    }

    else if(ui->stackedWidget_2->currentIndex()==Czesci_idx)
    {
        size=2;
        ui->checkBox_kooperant_CZESCI->setChecked(true);
        ui->checkBox_maszyny_CZESCI->setChecked(true);

        FillArray(dynamic_table, Czesci_checklist, size);
    }

    else QMessageBox::critical(this,"ERROR","Indeks listy w zakładce podgląd nie poprawny.");

#if (DEBUG_ACTIVE==true)
    qDebug()<<"Number of selected checkboxes: "<<size;
    qDebug()<<"Number of selected item: "<<ui->stackedWidget_2->currentIndex()<<endl;
#endif



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

//[SIGNAL] - clear checkboxes + clearing from dynamic array
void MainWindow::on_Clearbutton_VIEW_clicked()
{
if(ui->stackedWidget_2->isEnabled()==true)
{
    ClearArray(dynamic_table);
    unselect_all_CHECKBOX();
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

// Clear "VIEW tuck
void MainWindow::Clear_VIEW()
{    
     // enable
     ui->label_arrow_VIEW->setEnabled(false);
     ui->stackedWidget_2->setEnabled(false);

     // visible
     ui->pushButton->setVisible(false);
     ui->pushButton_2->setVisible(false);
     ui->pushButton_3->setVisible(false);
     ui->pushButton_4->setVisible(false);
     ui->pushButton_5->setVisible(false);
     ui->pushButton_6->setVisible(false);
     ui->pushButton_7->setVisible(false);
     ui->pushButton_8->setVisible(false);
     ui->pushButton_9->setVisible(false);
     ui->ReturnButton_VIEW->setVisible(false);
     ui->label_add_table_VIEW->setVisible(false);
     INFOlabel->setVisible(false);    

     // deleting models
     if(sumbit_view==true)
     {
         model->clear();
         proxy->clear();
         delete proxy;
         delete model;
     }

     // clearing comboboxes
     ui->comboBox_which_column_VIEW->clear();
     ui->comboBox_which_column_VIEW->addItem("Wybierz kolumnę");
     delete comboBox_column_VIEW;
     create_comboBox();

     // clearing OTHERS
     ui->tableView->setModel(0);
     unselect_all_CHECKBOX();
     ui->lineEdit_Filtr_VIEW->setText("");
     main_table="";
     main_view="";
     column_const = BRAK;
     column_additional = 0;
     column_all=0;
     sumbit_view=false;
     ui->listWidget_VIEW->clearSelection();
}

//[SLOT] - slot which connect comboboxes
void MainWindow::combobox_selected_column(int index)
{
    if(index!=0)
    {
        comboBox_column_VIEW->setModel(proxy);
        comboBox_column_VIEW->setDuplicatesEnabled(false);
        comboBox_column_VIEW->setModelColumn(index-1);

    }

    else if(index==0)
    {
        delete comboBox_column_VIEW;
        create_comboBox();
    }

#if (DEBUG_ACTIVE==true)
    qDebug()<<"Number of first Combobox selected item: "<<index<<endl;
#endif

}

//Sets the visibility of buttons depending on the selected checkboxes
void MainWindow::View_button_visible()
{
    ui->pushButton->setVisible(false);
    ui->pushButton_2->setVisible(false);
    ui->pushButton_3->setVisible(false);
    ui->pushButton_4->setVisible(false);
    ui->pushButton_5->setVisible(false);
    ui->pushButton_6->setVisible(false);
    ui->pushButton_7->setVisible(false);
    ui->pushButton_8->setVisible(false);
    ui->pushButton_9->setVisible(false);

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
    if(column_additional==9)
    {
        ui->pushButton_9->setVisible(true);
        ui->pushButton_9->setText(dynamic_table[8]);
    }

    else if(column_additional>9) QMessageBox::critical(this,"ERROR","Zbyt dużo tabel dodatkowych");

#if (DEBUG_ACTIVE==true)
    qDebug()<<"Number of creating PushButtons: "<<column_additional<<endl;
#endif

}

//[SIGNAL] - Create choosen view in TableView
void MainWindow::on_pushButton_submit_VIEW_clicked()
{

if(ui->stackedWidget_2->isEnabled()==true)
{
    clear_add_button();
    add_table_active=false;
    INFOlabel->setVisible(false);
    sumbit_view=true;
    ui->ReturnButton_VIEW->setVisible(true);
    ui->label_add_table_VIEW->setVisible(true);

    std::sort(dynamic_table,dynamic_table+column_additional);

    View_button_visible();

    view=main_table;
    for(int i=0;i<column_additional;i++)
    {
        QString help_string = dynamic_table[i];
        if(dynamic_table[i]=="Części") dynamic_table[i]="Czesci";
        else if(dynamic_table[i]=="Wykaz kooperantów") dynamic_table[i]="Wykaz kooperantow";
        else if(dynamic_table[i]=="Zgłoszenia serwisowe") dynamic_table[i]="Zgloszenia serwisowe";
        view+="_"+dynamic_table[i];
        dynamic_table[i]=help_string;
    }
    view=view+"_Widok";
    view=view.remove(" ");
    main_view=view;

#if (DEBUG_ACTIVE==true)
    qDebug()<<"Submitted dynamic array: ";
    for(int i=0;i<column_additional;i++)qDebug()<<i<<"element = "<<dynamic_table[i];
    qDebug()<<"Number of selected checkboxes: "<<column_additional;
    qDebug()<<"Created VIEW: "<<view;
    qDebug()<<"Created VIEW for return button: "<<main_view<<endl;
    if(view!=main_view)QMessageBox::warning(this,"Informacja", "Difference in views");
#endif

    create_model(view);
    /*
    model = new QSqlTableModel;
    model->setEditStrategy(QSqlTableModel::OnManualSubmit);
    model->setTable(view);
    model->select();

    proxy = new QSortFilterProxyModel(this);
    proxy->setSourceModel(model);
    proxy->setFilterKeyColumn(-1);
    proxy->setDynamicSortFilter(true);
    ui->tableView->setModel(proxy);
    ui->tableView->setEditTriggers(QAbstractItemView::NoEditTriggers);
    ui->tableView->horizontalHeader()->setSectionResizeMode(QHeaderView::ResizeToContents);
    ui->tableView->verticalHeader()->setFixedWidth(50);
    ui->tableView->horizontalHeader()->setFixedHeight(30);
    */

    // init second combobox
    delete comboBox_column_VIEW;
    create_comboBox();

    // init first combobox
    ui->comboBox_which_column_VIEW->clear();
    ui->comboBox_which_column_VIEW->addItem("Wybierz kolumnę");
    QStringList headers;
    for(int i = 0; i < proxy->columnCount(); i++)
    {
      headers.append(proxy->headerData(i, Qt::Horizontal).toString());
    }
    ui->comboBox_which_column_VIEW->addItems(headers);
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

void MainWindow::create_model(QString view)
{
    model = new QSqlTableModel;
    model->setEditStrategy(QSqlTableModel::OnManualSubmit);
    model->setTable(view);
    model->select();
    proxy = new QSortFilterProxyModel(this);
    proxy->setSourceModel(model);
    proxy->setFilterKeyColumn(-1);
    proxy->setDynamicSortFilter(true);
    ui->tableView->setModel(proxy);
    header = new QSpreadsheetHeaderView(Qt::Horizontal, this);
    ui->tableView->setHorizontalHeader(header);
    ui->tableView->horizontalHeader()->setVisible(true);
    ui->tableView->setEditTriggers(QAbstractItemView::NoEditTriggers);
    ui->tableView->horizontalHeader()->setSectionResizeMode(QHeaderView::ResizeToContents);
    ui->tableView->verticalHeader()->setFixedWidth(50);
    ui->tableView->horizontalHeader()->setFixedHeight(30);
}

// Fulfillment of a dynamic array using an constant array
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

#if (DEBUG_ACTIVE==true)
    qDebug()<<"Filled dynamic array:";
    for(int i=0;i<size;i++)qDebug()<<i<<"element ="<<dynamic_table[i];
    qDebug()<<endl;
#endif
}

//Clear dynamic array
void MainWindow::ClearArray(QString *& Array)
{
  QString * newArray = new QString[1];
  newArray[0]="TEST";
  delete[] Array;
  Array=newArray;

  column_additional=0;
  before_column_additional=1;

#if (DEBUG_ACTIVE==true)
  qDebug()<<"Clearing dynamic array ..."<<endl;
#endif
}

//Resize dynamic array
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
            if(Array[l]==tableName)
            {
                idx_DELETE=l;
                }//find index position for remove
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

//Function which resize dynamic array
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

//Function to open choosen additional table
void MainWindow::open_additional_table(QString tableName)
{
    view=tableName+"_"+main_table+"_Widok";

#if (DEBUG_ACTIVE==true)
    qDebug()<<"View of additional table: "<<view<<endl;
#endif

    create_model(view);
    /*
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
    ui->tableView->horizontalHeader()->setSectionResizeMode(QHeaderView::ResizeToContents);
    ui->tableView->verticalHeader()->setFixedWidth(50);
    ui->tableView->horizontalHeader()->setFixedHeight(30);
    */

    // init second combobox
    delete comboBox_column_VIEW;
    create_comboBox();

    // init first combobox
    ui->comboBox_which_column_VIEW->clear();
    ui->comboBox_which_column_VIEW->addItem("Wybierz kolumnę");
    QStringList headers;
    for(int i = 0; i < proxy->columnCount(); i++)
    {
      headers.append(proxy->headerData(i, Qt::Horizontal).toString());
    }
    ui->comboBox_which_column_VIEW->addItems(headers);
}

//[SIGNAL] - return button
void MainWindow::on_ReturnButton_VIEW_clicked()
{

if(add_table_active==true)
{
    clear_add_button();

#if (DEBUG_ACTIVE==true)
    qDebug()<<"View (Return): "<<main_view<<endl;
#endif

    create_model(main_view);
    /*
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
    ui->tableView->horizontalHeader()->setSectionResizeMode(QHeaderView::ResizeToContents);
    ui->tableView->verticalHeader()->setFixedWidth(50);
    ui->tableView->horizontalHeader()->setFixedHeight(30);
    */

    // init second combobox
    delete comboBox_column_VIEW;
    create_comboBox();
    /************/

    // init first combobox
    ui->comboBox_which_column_VIEW->clear();
    ui->comboBox_which_column_VIEW->addItem("Wybierz kolumnę");
    QStringList headers;
    for(int i = 0; i < proxy->columnCount(); i++)
    {
      headers.append(proxy->headerData(i, Qt::Horizontal).toString());
    }
    ui->comboBox_which_column_VIEW->addItems(headers);

    add_table_active=false;

  }
 else
    {
          QMessageBox::information(this,"Informacja", "Przycisk nie aktywny. Nie wybrano tabeli dodatkowej.");
    }

}

/* FILTER FOR VIEW *******************************************/
/*
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

*/

void MainWindow::on_SubmitFilterbutton_VIEW_clicked()
{
    if(sumbit_view==true)
    {
        QString arg1;
        arg1=comboBox_column_VIEW->currentText();
        if(arg1!="Wybierz kolumnę")
        {
           // QRegExp regExp(arg1, Qt::CaseInsensitive, QRegExp::Wildcard);
           // proxy->setFilterRegExp(regExp);
            proxy->setFilterFixedString(arg1);
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
    //QRegExp regExp("", Qt::CaseInsensitive, QRegExp::Wildcard);
    //proxy->setFilterRegExp(regExp);
    proxy->setFilterFixedString("");

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
        //QRegExp regExp("", Qt::CaseInsensitive, QRegExp::Wildcard);
        //proxy->setFilterRegExp(regExp);
        proxy->setFilterFixedString("");

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
}

void MainWindow::on_checkBox_daneosobowe_SEKTOR_clicked(bool checked)
{
    checkbox_select(checked, "Dane osobowe");
}

void MainWindow::on_checkBox_maszyny_SEKTOR_clicked(bool checked)
{
    checkbox_select(checked, "Maszyny");
}

/* ***************************************************************/

/* Checkbox for MIEJSCA ******************************************/

void MainWindow::on_checkBox_sektor_MIEJSCA_clicked(bool checked)
{
    checkbox_select(checked,"Sektory");    
}

void MainWindow::on_checkBox_daneosobowe_MIEJSCA_clicked(bool checked)
{
    checkbox_select(checked,"Dane osobowe");
}

void MainWindow::on_checkBox_maszyny_MIEJSCA_clicked(bool checked)
{
    checkbox_select(checked,"Maszyny");  
}

void MainWindow::on_checkBox_zlecenia_MIEJSCA_clicked(bool checked)
{
     checkbox_select(checked,"Zlecenia");  
}

/*****************************************************************/

/* Checkbox for MASZYNY ******************************************/

void MainWindow::on_checkBox_czesci_MASZYNY_clicked(bool checked)
{
    checkbox_select(checked,"Części");
}

void MainWindow::on_checkBox_daneosobowe_MASZYNY_clicked(bool checked)
{
    checkbox_select(checked,"Dane osobowe");
}

void MainWindow::on_checkBox_konkurencja_MASZYNY_clicked(bool checked)
{
    checkbox_select(checked,"Konkurencja");
}

void MainWindow::on_checkBox_kooperant_MASZYNY_clicked(bool checked)
{
    checkbox_select(checked,"Wykaz kooperantów");
}

void MainWindow::on_checkBox_miejsca_MASZYNY_clicked(bool checked)
{
    checkbox_select(checked,"Miejsca");
}

void MainWindow::on_checkBox_raporty_MASZYNY_clicked(bool checked)
{
    checkbox_select(checked,"Raporty serwisowe");
}

void MainWindow::on_checkBox_sektor_MASZYNY_clicked(bool checked)
{
    checkbox_select(checked,"Sektory");
}

void MainWindow::on_checkBox_zgloszenia_MASZYNY_clicked(bool checked)
{
    checkbox_select(checked,"Zgłoszenia serwisowe");
}

void MainWindow::on_checkBox_zlecenia_MASZYNY_clicked(bool checked)
{
    checkbox_select(checked,"Zlecenia");
}

/*****************************************************************/

/* Checkbox for ZLECENIA ******************************************/

void MainWindow::on_checkBox_kooperant_ZLECENIA_clicked(bool checked)
{
    checkbox_select(checked,"Wykaz kooperantów");
}

void MainWindow::on_checkBox_maszyny_ZLECENIA_clicked(bool checked)
{
    checkbox_select(checked,"Maszyny");
}

/*****************************************************************/

/* Checkbox for KONKURENCJA **************************************/

/*****************************************************************/

/* Checkbox for WYKAZ KOOPERANTÓW ********************************/
void MainWindow::on_checkBox_czesci_KOOPERANT_clicked(bool checked)
{
    checkbox_select(checked,"Części");
}

void MainWindow::on_checkBox_daneosobowe_KOOPERANT_clicked(bool checked)
{
    checkbox_select(checked,"Dane osobowe");  
}

void MainWindow::on_checkBox_maszyny_KOOPERANT_clicked(bool checked)
{
    checkbox_select(checked,"Maszyny");
}
/*****************************************************************/

/* Checkbox for RAPORT *******************************************/

void MainWindow::on_checkBox_maszyny_RAPORT_clicked(bool checked)
{
    checkbox_select(checked,"Maszyny");
}

void MainWindow::on_checkBox_zgoszenia_RAPORT_clicked(bool checked)
{
    checkbox_select(checked,"Zgłoszenia serwisowe");
}

/*****************************************************************/

/* Checkbox for ZGŁOSZENIA ***************************************/

void MainWindow::on_checkBox_kooperant_ZGLOSZENIA_clicked(bool checked)
{
    checkbox_select(checked,"Wykaz kooperantów");
}

void MainWindow::on_checkBox_maszyny_ZGLOSZENIA_clicked(bool checked)
{
    checkbox_select(checked,"Maszyny");
}

void MainWindow::on_checkBox_raporty_ZGLOSZENIA_clicked(bool checked)
{
    checkbox_select(checked,"Raporty serwisowe");
}

/*****************************************************************/

/* Checkbox for CZĘŚCI *******************************************/

void MainWindow::on_checkBox_kooperant_CZESCI_clicked(bool checked)
{
    checkbox_select(checked,"Wykaz kooperantów");
}

void MainWindow::on_checkBox_maszyny_CZESCI_clicked(bool checked)
{
    checkbox_select(checked,"Części");
}

/*****************************************************************/

void MainWindow::on_pushButton_clicked()
{
    QString button_name;
    button_name= ui->pushButton->text();
    open_additional_table(get_add_button_name(button_name));
    ui->pushButton->setIcon(QIcon("C:/Users/rstrawinski/Pictures/select_all.png"));
    ui->pushButton->setIconSize(QSize(20, 20));
}

void MainWindow::on_pushButton_2_clicked()
{
    QString button_name;
    button_name= ui->pushButton_2->text();
    open_additional_table(get_add_button_name(button_name));
    ui->pushButton_2->setIcon(QIcon("C:/Users/rstrawinski/Pictures/select_all.png"));
    ui->pushButton_2->setIconSize(QSize(20, 20));
}

void MainWindow::on_pushButton_3_clicked()
{
    QString button_name;
    button_name= ui->pushButton_3->text();
    open_additional_table(get_add_button_name(button_name));
    ui->pushButton_3->setIcon(QIcon("C:/Users/rstrawinski/Pictures/select_all.png"));
    ui->pushButton_3->setIconSize(QSize(20, 20));

}

void MainWindow::on_pushButton_4_clicked()
{
    QString button_name;
    button_name= ui->pushButton_4->text();
    open_additional_table(get_add_button_name(button_name));
    ui->pushButton_4->setIcon(QIcon("C:/Users/rstrawinski/Pictures/select_all.png"));
    ui->pushButton_4->setIconSize(QSize(20, 20));
}

void MainWindow::on_pushButton_5_clicked()
{
    QString button_name;
    button_name= ui->pushButton_5->text();
    open_additional_table(get_add_button_name(button_name));
    ui->pushButton_5->setIcon(QIcon("C:/Users/rstrawinski/Pictures/select_all.png"));
    ui->pushButton_5->setIconSize(QSize(20, 20));
}

void MainWindow::on_pushButton_6_clicked()
{
    QString button_name;
    button_name= ui->pushButton_6->text();
    open_additional_table(get_add_button_name(button_name));
    ui->pushButton_6->setIcon(QIcon("C:/Users/rstrawinski/Pictures/select_all.png"));
    ui->pushButton_6->setIconSize(QSize(20, 20));
}

void MainWindow::on_pushButton_7_clicked()
{
    QString button_name;
    button_name= ui->pushButton_7->text();
    open_additional_table(get_add_button_name(button_name));
    ui->pushButton_7->setIcon(QIcon("C:/Users/rstrawinski/Pictures/select_all.png"));
    ui->pushButton_7->setIconSize(QSize(20, 20));
}

void MainWindow::on_pushButton_8_clicked()
{
    QString button_name;
    button_name= ui->pushButton_8->text();
    open_additional_table(get_add_button_name(button_name));
    ui->pushButton_8->setIcon(QIcon("C:/Users/rstrawinski/Pictures/select_all.png"));
    ui->pushButton_8->setIconSize(QSize(20, 20));

}

void MainWindow::on_pushButton_9_clicked()
{
    QString button_name;
    button_name= ui->pushButton_9->text();
    open_additional_table(get_add_button_name(button_name));
    ui->pushButton_9->setIcon(QIcon("C:/Users/rstrawinski/Pictures/select_all.png"));
    ui->pushButton_9->setIconSize(QSize(20, 20));
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
}

QString MainWindow::get_add_button_name(QString button_name)
{
    clear_add_button();
    add_table_active=true;
    if(button_name=="Części") button_name="Czesci";
    else if(button_name=="Wykaz kooperantów") button_name="Wykaz kooperantow";
    else if(button_name=="Zgłoszenia serwisowe") button_name="Zgloszenia serwisowe";
    button_name = button_name.remove(" ");

    return button_name;
}

//void MainWindow::on_checkBox_clicked(bool checked)
//{
    /*
    if(checked==true)
    {
        Qt::CaseSensitive
    }
    else if(checked==false)
    {
       Qt::CaseInsensitive
    }

    QRegExp regExp(ui->lineEdit_Filtr_VIEW->text(), caseSensitivity, syntax);
    proxy->setFilterRegExp(regExp);
    */
//}


void MainWindow::filterRegExpChanged()
{

    Qt::CaseSensitivity caseSensitivity =
            ui->checkBox->isChecked() ? Qt::CaseSensitive
                                                       : Qt::CaseInsensitive;

    QRegExp regExp(ui->lineEdit_Filtr_VIEW->text(), caseSensitivity, QRegExp::Wildcard);
    proxy->setFilterRegExp(regExp);
}
