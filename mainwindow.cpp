#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);


    /* MAIN WINDOW *******************************************************************/

        QImage image("C:/Users/rstrawinski/Pictures/sigma_LOGO_3D.png");
        ui->logo_label->setPixmap(QPixmap::fromImage(image.scaled(120,120,Qt::KeepAspectRatio,Qt::FastTransformation)));

            /* Buttons **************/
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

            /* Status Bar **********/
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
            ui->statusBar->addWidget(Statlabel);
            ui->statusBar->addPermanentWidget(Statprogress);
            ui->statusBar->addPermanentWidget(Statbutton);
            ui->statusBar->setFont(Status_Font);
            ui->statusBar->setStyleSheet("QStatusBar {"
                                      "background-color: qlineargradient(x1: 0, y1: 0, x2: 0, y2: 1,  stop: 0 #a6a6a6, stop: 0.08 #7f7f7f,stop: 0.39999 #717171, stop: 0.4 #626262,stop: 0.9 #4c4c4c, stop: 1 #333333);"
                                      "}"
                                       );



           QColor color(8, 140, 142, 255);
           QPalette p = Statprogress->palette();
           p.setColor(QPalette::Highlight,color);
           Statprogress->setPalette(p);

           INFOlabel = new QLabel(this);
           QImage information("C:/Users/rstrawinski/Pictures/mark.png");
           INFOlabel->setPixmap(QPixmap::fromImage(information.scaled(30,30,Qt::KeepAspectRatio,Qt::FastTransformation)));
           INFOlabel->setVisible(false);


           /* signal & slots */
           connect(Statbutton, SIGNAL (released()), this, SLOT (info_button()));     
           connect(ui->comboBox_which_column_VIEW, SIGNAL (activated(int)), this, SLOT (combobox_selected_column(int)));

           dynamic_table = new QString[1];
           before_column_additional=1;
           dynamic_table[0]="TEST";


           /* VIEW **********************************************************************************/

           ui->ReturnButton_VIEW->setIcon(QIcon("C:/Users/rstrawinski/Pictures/return.png"));
           ui->ReturnButton_VIEW->setIconSize(QSize(40, 40));
           ui->ReturnButton_VIEW->setStyleSheet("QPushButton {border: none}");


           ui->SelectButton_VIEW->setIcon(QIcon("C:/Users/rstrawinski/Pictures/select_all.png"));
           ui->SelectButton_VIEW->setIconSize(QSize(20, 20));
           ui->SelectButton_VIEW->setStyleSheet("QPushButton {border: none}");

           ui->Clearbutton_VIEW->setIcon(QIcon("C:/Users/rstrawinski/Pictures/clear_all.png"));
           ui->Clearbutton_VIEW->setIconSize(QSize(20, 20));
           ui->Clearbutton_VIEW->setStyleSheet("QPushButton {border: none}");

           ui->SubmitFilterbutton_VIEW->setIcon(QIcon("C:/Users/rstrawinski/Pictures/select_all.png"));
           ui->SubmitFilterbutton_VIEW->setIconSize(QSize(20, 20));
           ui->SubmitFilterbutton_VIEW->setStyleSheet("QPushButton {border: none}");

           ui->ClearFilterbutton_VIEW->setIcon(QIcon("C:/Users/rstrawinski/Pictures/clear_all.png"));
           ui->ClearFilterbutton_VIEW->setIconSize(QSize(20, 20));
           ui->ClearFilterbutton_VIEW->setStyleSheet("QPushButton {border: none}");

           ui->pushButton_submit_VIEW->setIcon(QIcon("C:/Users/rstrawinski/Pictures/accept.png"));
           ui->pushButton_submit_VIEW->setIconSize(QSize(35, 35));
           //ui->pushButton_submit_VIEW->setStyleSheet("QPushButton {border: none}");

           QImage arrow("C:/Users/rstrawinski/Pictures/arrow.png");
           ui->label_arrow_VIEW->setPixmap(QPixmap::fromImage(arrow.scaled(40,40,Qt::KeepAspectRatio,Qt::FastTransformation)));
           ui->label_arrow_VIEW->setEnabled(false);


           /* VARABLE INIT *************************************************************************/

                ui->stackedWidget->setCurrentIndex(0);
                column_const = BRAK;
                column_additional = 0;
                column_all=0;
                sumbit_view=false;
                //ui->listWidget->setVisible(false);
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
                //ui->label_return_VIEW->setVisible(false);
                ui->comboBox_which_column_VIEW->addItem("Wybierz kolumnę");
                comboBox_column_VIEW = new QComboBox(ui->stackedWidget);
                comboBox_column_VIEW->setFont(Status_Font);
                comboBox_column_VIEW->setGeometry(1210,23,231,31);
                comboBox_column_VIEW->addItem("Wybierz kolumnę");
                comboBox_column_VIEW->setVisible(true);

}

MainWindow::~MainWindow()
{
    LoginDialog login;
    login.closeDB();
    delete ui;
}


const QString MainWindow::Sektor_checklist[3] = {"Miejsca", "Pracownicy", "Maszyny"};
const QString MainWindow::Miejsca_checklist[4] = {"Sektory", "Pracownicy", "Maszyny","Zlecenia"};

/* MAIN WINDOW ****************************************************************************/

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


void MainWindow::resizeEvent(QResizeEvent* event)
{

    QFont f = ui->label_clear_all_VIEW->font(); //Get label font
    QFontMetrics metrics(f);
    QSize size = metrics.size(0, ui->label_clear_all_VIEW->text()); //Get size of text
    float factorw = ui->label_clear_all_VIEW->width() / (float)size.width(); //Get the width factor
    float factorh = ui->label_clear_all_VIEW->height() / (float)size.height(); //Get the height factor
    float factor = qMin(factorw, factorh); //To fit contents in the screen select as factor
                                              //the minimum factor between width and height

    f.setPointSizeF(f.pointSizeF() * factor); //Set font size
    ui->label_clear_all_VIEW->setFont(f); //Set the adjusted font to the label
    ui->label_select_all_VIEW->setFont(f);



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
 * listWidget ITEM CLICKED - visible arrow
*/

void MainWindow::on_listWidget_VIEW_clicked(const QModelIndex &index)
{
 ui->label_arrow_VIEW->setEnabled(true);
 ui->stackedWidget_2->setEnabled(true);
 INFOlabel->setVisible(false);
}


/*
 * listWidget ITEM CHANGE - Clear all parameter when index changed
*/

void MainWindow::on_listWidget_VIEW_currentRowChanged(int currentRow)
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
      main_table = "Pracownicy";
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
      main_table = "WykazKooperantow";
      column_const= WykazKooperantow;
    }
    else if(ui->listWidget_VIEW->item(7)==item)
    {
      ui->stackedWidget_2->setCurrentIndex(7);
      main_table = "RaportySerwisowe";
      column_const= RaportySerwisowe;
    }
    else if(ui->listWidget_VIEW->item(8)==item)
    {
      ui->stackedWidget_2->setCurrentIndex(8);
      main_table = "ZgloszeniaSerwisowe";
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
ui->checkBox_pracownicy_SEKTOR->setChecked(false);
ui->checkBox_maszyny_SEKTOR->setChecked(false);
ui->checkBox_pracownicy_MIEJSCA->setChecked(false);
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
        ui->checkBox_pracownicy_SEKTOR->setChecked( true );
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
        ui->checkBox_pracownicy_MIEJSCA->setChecked( true );
        ui->checkBox_maszyny_MIEJSCA->setChecked( true );
        ui->checkBox_zlecenia_MIEJSCA->setChecked( true );

        FillArray(dynamic_table, Miejsca_checklist, 4);
        for(int i=0;i<4;i++)
        {
            ui->listWidget->addItem(dynamic_table[i]);
        }


    }

}
else {QMessageBox::information(this,"Informacja", "Proszę wybrać tabelę z listy."); INFOlabel->setGeometry(260,135,30,30); INFOlabel->setVisible(true);}
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
}
else {QMessageBox::information(this,"Informacja", "Proszę wybrać tabelę z listy."); INFOlabel->setGeometry(260,135,30,30); INFOlabel->setVisible(true);}
}

/*
 * combobox_selected_column - slot which connect comboboxes
*/

void MainWindow::combobox_selected_column(int index)
{
    /*
    if(ui->comboBox_which_column_VIEW->itemText(0)=="Wybierz kolumnę")
    {
        ui->comboBox_which_column_VIEW->removeItem(0);
        ui->comboBox_column_VIEW->setModel(proxy);
        ui->comboBox_column_VIEW->setModelColumn(index);
    }
    else if(ui->comboBox_which_column_VIEW->itemText(0)=="Wybierz kolumnę ")
    {
        ui->comboBox_column_VIEW->clear();
        ui->comboBox_column_VIEW->addItem("Wybierz kolumnę ");
    }
    else
    {
        ui->comboBox_column_VIEW->setModel(proxy);
        ui->comboBox_column_VIEW->setModelColumn(index+1);
    }
    */

    if(index!=0)
    {
        comboBox_column_VIEW->setModel(proxy);
        comboBox_column_VIEW->setModelColumn(index);
    }

    else if(index==0)
    {
        delete comboBox_column_VIEW;
        QFont Status_Font("Calibri Light", 14, QFont::Light ,false);
        comboBox_column_VIEW = new QComboBox(ui->stackedWidget);
        comboBox_column_VIEW->setFont(Status_Font);
        comboBox_column_VIEW->setGeometry(1210,23,231,31);
        comboBox_column_VIEW->addItem("Wybierz kolumnę");
        comboBox_column_VIEW->setVisible(true);
    }
}

/*
 * SUMBIT FOR VIEW !!!
*/

void MainWindow::on_pushButton_submit_VIEW_clicked()
{

if(ui->stackedWidget_2->isEnabled()==true)
{
    INFOlabel->setVisible(false);
    sumbit_view=true;
    column_all = column_const + column_additional;
    QString s = QString::number(column_all);
    ui->label_TEST->setText(s);

    ui->ReturnButton_VIEW->setVisible(true);
    ui->label_add_table_VIEW->setVisible(true);
    //ui->label_return_VIEW->setVisible(true);

    ui->listWidget->clear();
    for(int i=0;i<column_additional;i++)
    {
        ui->listWidget->addItem(dynamic_table[i]);
    }

    ui->pushButton->setVisible(false);
    ui->pushButton_2->setVisible(false);
    ui->pushButton_3->setVisible(false);
    switch(column_additional)
    {
    case 0:
         ui->label_add_table_VIEW->setVisible(false);
         break;
    case 1:
        ui->pushButton->setVisible(true);
        ui->pushButton->setText(dynamic_table[0]);

        break;
    case 2:
        ui->pushButton->setVisible(true);
        ui->pushButton->setText(dynamic_table[0]);
        ui->pushButton_2->setVisible(true);
        ui->pushButton_2->setText(dynamic_table[1]);
        break;
    case 3:
        ui->pushButton->setVisible(true);
        ui->pushButton->setText(dynamic_table[0]);
        ui->pushButton_2->setVisible(true);
        ui->pushButton_2->setText(dynamic_table[1]);
        ui->pushButton_3->setVisible(true);
        ui->pushButton_3->setText(dynamic_table[2]);
        break;
    }



    model = new QSqlTableModel;
    model->setEditStrategy(QSqlTableModel::OnManualSubmit);


        if(main_table == "Sektory")
        {
            model->setTable("Sektory");
        }
        else if (main_table == "Miejsca")
        {
            model->setTable("Miejsca");
        }


    model->select();
    proxy = new QSortFilterProxyModel(this);
    proxy->setDynamicSortFilter(true);
    proxy->setSourceModel(model);
    proxy->setFilterKeyColumn(-1);
    ui->tableView->setModel(proxy);
    ui->tableView->setEditTriggers(QAbstractItemView::NoEditTriggers);
    //ui->tableView->setSelectionBehavior(QAbstractItemView::SelectRows);
    ui->tableView->setSelectionMode(QAbstractItemView::SingleSelection);
    ui->tableView->horizontalHeader()->setSectionResizeMode(QHeaderView::Stretch);
    ui->tableView->verticalHeader()->setFixedWidth(50);
    ui->tableView->setColumnHidden(0,true);

    /*inicjalizacja comoboxa COLUMN*/
    delete comboBox_column_VIEW;
    QFont Status_Font("Calibri Light", 14, QFont::Light ,false);
    comboBox_column_VIEW = new QComboBox(ui->stackedWidget);
    comboBox_column_VIEW->setFont(Status_Font);
    comboBox_column_VIEW->setGeometry(1210,23,231,31);
    comboBox_column_VIEW->addItem("Wybierz kolumnę");
    comboBox_column_VIEW->setVisible(true);
    /************/

    /*inicjalizacja comoboxa WHICH*/
    ui->comboBox_which_column_VIEW->clear();
    ui->comboBox_which_column_VIEW->addItem("Wybierz kolumnę");
    QStringList headers;
    for(int i = 1; i < proxy->columnCount(); i++)
    {
      headers.append(proxy->headerData(i, Qt::Horizontal).toString());
    }
    ui->comboBox_which_column_VIEW->addItems(headers);
    /************/


}
else {QMessageBox::information(this,"Informacja", "Proszę wybrać tabelę z listy."); INFOlabel->setGeometry(260,135,30,30); INFOlabel->setVisible(true);}
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
  if(tableName=="Miejsca")
    {
      if(main_table=="Sektory") ui->label_TEST->setText("SEKTORY_miejsca");
    }

  else if(tableName=="Pracownicy")
    {
      if(main_table=="Sektory") ui->label_TEST->setText("SEKTORY_pracownicy");
      if(main_table=="Miejsca") ui->label_TEST->setText("MIEJSCA_pracownicy");
    }

  else if(tableName=="Maszyny")
    {
      if(main_table=="Sektory") ui->label_TEST->setText("SEKTORY_mszyny");
      if(main_table=="Miejsca") ui->label_TEST->setText("MIEJSCA_mszyny");
    }

  else if(tableName=="Sektory")
    {
      if(main_table=="Miejsca") ui->label_TEST->setText("MIEJSCA_sektory");
    }

  else if(tableName=="Zlecenia")
    {
      if(main_table=="Sektory") ui->label_TEST->setText("SEKTORY_zlecenia");
    }

}


/* FILTER FOR VIEW *******************************************/

void MainWindow::on_lineEdit_Filtr_VIEW_textChanged(const QString &arg1)
{
    if(sumbit_view==true)
    {
        QRegExp regExp(arg1, Qt::CaseInsensitive, QRegExp::Wildcard);
        proxy->setFilterRegExp(regExp);
        delete comboBox_column_VIEW;
        QFont Status_Font("Calibri Light", 14, QFont::Light ,false);
        comboBox_column_VIEW = new QComboBox(ui->stackedWidget);
        comboBox_column_VIEW->setFont(Status_Font);
        comboBox_column_VIEW->setGeometry(1210,23,231,31);
        comboBox_column_VIEW->addItem("Wybierz kolumnę");
        comboBox_column_VIEW->setVisible(true);

        ui->comboBox_which_column_VIEW->setCurrentIndex(0);
    }
    else
    {
        if(arg1!="")
        {
            if(ui->stackedWidget_2->isEnabled()==true)
                {
                QMessageBox::information(this,"Informacja", "Brak tabeli. Proszę zatwierdzić");
                INFOlabel->setGeometry(890,920,30,30);
                }
            else if(ui->stackedWidget_2->isEnabled()==false)
                {
                QMessageBox::information(this,"Informacja", "Brak tabeli. Proszę wybrać tabelę, a następnie zatwierdzić");
                INFOlabel->setGeometry(260,135,30,30);
                }
        INFOlabel->setVisible(true);
        ui->lineEdit_Filtr_VIEW->setText("");
        }
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
            INFOlabel->setGeometry(890,920,30,30);
            }
        else if(ui->stackedWidget_2->isEnabled()==false)
            {
            QMessageBox::information(this,"Informacja", "Brak tabeli. Proszę wybrać tabelę, a następnie zatwierdzić");
            INFOlabel->setGeometry(260,135,30,30);
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
    QFont Status_Font("Calibri Light", 14, QFont::Light ,false);
    comboBox_column_VIEW = new QComboBox(ui->stackedWidget);
    comboBox_column_VIEW->setFont(Status_Font);
    comboBox_column_VIEW->setGeometry(1210,23,231,31);
    comboBox_column_VIEW->addItem("Wybierz kolumnę");
    comboBox_column_VIEW->setVisible(true);

    ui->comboBox_which_column_VIEW->setCurrentIndex(0);
}
else
{
    if(ui->stackedWidget_2->isEnabled()==true)
        {
        QMessageBox::information(this,"Informacja", "Brak tabeli. Proszę zatwierdzić");
        INFOlabel->setGeometry(890,920,30,30);
        }
    else if(ui->stackedWidget_2->isEnabled()==false)
        {
        QMessageBox::information(this,"Informacja", "Brak tabeli. Proszę wybrać tabelę, a następnie zatwierdzić");
        INFOlabel->setGeometry(260,135,30,30);
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

void MainWindow::on_checkBox_pracownicy_SEKTOR_clicked(bool checked)
{
    checkbox_select(checked, "Pracownicy");

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

void MainWindow::on_checkBox_pracownicy_MIEJSCA_clicked(bool checked)
{
    checkbox_select(checked,"Pracownicy");
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
    QString button_name;
    button_name= ui->pushButton->text();
    open_additional_table(button_name);
}

void MainWindow::on_pushButton_2_clicked()
{
    QString button_name;
    button_name= ui->pushButton_2->text();
    open_additional_table(button_name);
}

void MainWindow::on_pushButton_3_clicked()
{
    QString button_name;
    button_name= ui->pushButton_3->text();
    open_additional_table(button_name);

}




