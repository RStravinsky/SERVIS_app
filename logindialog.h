#ifndef LOGINDIALOG_H
#define LOGINDIALOG_H

#include <QDialog>
#include <QString>
#include <QMessageBox>
#include <QSql>
#include <QSqlDatabase>
#include <QLineEdit>
#include <QDir>
#include <QTimer>
#include "mainwindow.h"

namespace Ui {
class LoginDialog;
}

class LoginDialog : public QDialog
{
    Q_OBJECT

public:
    bool connection(QString& login,QString& password){
        {
            db = QSqlDatabase::addDatabase("QMYSQL");
            db.setHostName("127.0.0.1");     // host
            db.setDatabaseName("serwis_v8"); // database
            db.setUserName(login);           // user
            db.setPassword(password);        // password

            if (!db.open()) {
                return false;
            }

            else {
                return true;
            }
        }
    }

    void closeDB(){
        db.close();
        QSqlDatabase::removeDatabase("serwis_v6");
    }

public:
    explicit LoginDialog(QWidget *parent = 0);
    ~LoginDialog();
    QString path;
    QDir dir;
    QSqlDatabase db;

signals:
    void sendAccess(QString login, QString password);

private slots:
    void on_login_button_clicked();
    void on_quit_button_clicked();

private:
    Ui::LoginDialog *ui;
    bool eventFilter(QObject *obj, QEvent *event);
    QString username;
    QString password;
};

#endif // LOGINDIALOG_H
