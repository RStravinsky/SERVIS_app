#include "mainwindow.h"
#include "logindialog.h"
#include "qspreadsheetheaderview.h"
#include <QApplication>
#include <QMessageBox>
#include <QSplashScreen>
#include <QTimer>
#include <QThread>
#include <QDesktopWidget>


int main(int argc, char *argv[])
{

    QDir dir;
    QString path=dir.absolutePath();

    int currentExitCode = 0;

    do
    {
            QApplication a(argc, argv);
            a.setStyle("fusion");

            QFont font("Calibri Light", 12, QFont::Light ,false);
            QFont font_main("Calibri Light", 10, QFont::Light ,false);
            QFont splash_font("Calibri Light", 24, QFont::Bold);

            LoginDialog *logindialog = new LoginDialog;
            MainWindow w;

            logindialog->setWindowFlags(((logindialog->windowFlags() | Qt::CustomizeWindowHint) & Qt::WindowCloseButtonHint & ~Qt::WindowContextHelpButtonHint) );

            /* Ekran startowy*/
            if(currentExitCode != MainWindow::EXIT_CODE_REBOOT)
            {
                QSplashScreen * splash = new QSplashScreen;
                splash->setPixmap(QPixmap(path+"/obrazy/splash.png"));
                splash->setFont(splash_font);
                splash->show();
                splash->showMessage(QObject::tr("Uruchamianie programu "),
                                Qt::AlignLeft | Qt::AlignTop, Qt::black);  //This line represents the alignment of text, color and position


                qApp->processEvents();
                QTimer::singleShot(2000,splash,SLOT(close()));
                QString Splash_string = "Uruchamianie programu";
                QString Splash_string_add = "Uruchamianie programu";

                for(int i=0;i<12;i++)
                {
                    QThread::msleep(150);
                    Splash_string_add = Splash_string_add + ".";

                    if(i==3 || i==7 || i==11) Splash_string_add = Splash_string;

                    splash->showMessage(Splash_string_add,
                                    Qt::AlignLeft | Qt::AlignTop, Qt::black);  //This line represents the alignment of text, color and position
                }
            }



            /* signal-slot - connect login and password from logindialog with MainWindow */
            QObject::connect(logindialog, SIGNAL(sendAccess(QString,QString)),
                             &w, SLOT(receiveAccess(QString,QString)));



            logindialog->setWindowIcon(QIcon(path+"/obrazy/log_icon.png"));
            logindialog->setWindowTitle("SERWIS - Logowanie");
            logindialog->setFont(font);
            if (logindialog->exec() != QDialog::Accepted) {
                a.quit();
                return 0;
            } else {
                delete logindialog;
                w.showMaximized();
                w.setWindowTitle("SERWIS");
                w.setWindowIcon(QIcon(path+"/obrazy/services_icon.png"));
                w.setFont(font_main);
                w.show();
            }
             currentExitCode = a.exec();
     } while( currentExitCode == MainWindow::EXIT_CODE_REBOOT );

    return currentExitCode;
}



