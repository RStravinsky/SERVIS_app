#ifndef LOGINDIALOG_H
#define LOGINDIALOG_H

#include <QDialog>
#include <QString>
#include <QMessageBox>
#include <QSql>
#include <QSqlDatabase>
#include <QLineEdit>
#include "mainwindow.h"

namespace Ui {
class LoginDialog;
}

class LoginDialog : public QDialog
{
    Q_OBJECT

public slots:
    bool connection(QString& login,QString& password){
        {
            db = QSqlDatabase::addDatabase("QMYSQL");
            db.setHostName("127.0.0.1");  // host
            db.setDatabaseName("serwis_v3"); // database
            db.setUserName(login);        // user
            db.setPassword(password);     // password

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
        QSqlDatabase::removeDatabase("sakila");
    }

public:
    explicit LoginDialog(QWidget *parent = 0);
    ~LoginDialog();
    QString username;
    QString password;
    QSqlDatabase db;

signals:
    void sendAccess(QString login, QString password);

private slots:
    void on_login_button_clicked();
    void on_quit_button_clicked();

private:
    Ui::LoginDialog *ui;
    bool eventFilter(QObject *obj, QEvent *event);
};

#endif // LOGINDIALOG_H
