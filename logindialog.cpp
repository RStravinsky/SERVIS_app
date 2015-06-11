#include "logindialog.h"
#include "ui_logindialog.h"

LoginDialog::LoginDialog(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::LoginDialog)
{
    ui->setupUi(this);

    QFont font("Calibri Light", 16, QFont::Bold ,false);

    ui->password_edit->setFont(font);
    ui->login_edit->setFont(font);

    QImage image("C:/Users/rstrawinski/Pictures/sigma_LOGO_3D.png");
    ui->label_logo->setPixmap(QPixmap::fromImage(image.scaled(250,250,Qt::KeepAspectRatio,Qt::FastTransformation)));

    QImage user("C:/Users/rstrawinski/Pictures/user.png");
    ui->label_user->setPixmap(QPixmap::fromImage(user.scaled(50,50,Qt::KeepAspectRatio,Qt::FastTransformation)));

    QImage password("C:/Users/rstrawinski/Pictures/login.png");
    ui->label_password->setPixmap(QPixmap::fromImage(password.scaled(50,50,Qt::KeepAspectRatio,Qt::FastTransformation)));

    ui->login_edit->setText("root");
    ui->password_edit->setText("sigmasa");
    ui->password_edit->setEchoMode(QLineEdit::Password);

    ui->login_edit->installEventFilter(this);
    ui->password_edit->installEventFilter(this);
}

LoginDialog::~LoginDialog()
{
    delete ui;
}

/*
 * Login button
*/
void LoginDialog::on_login_button_clicked()
{
    username=ui->login_edit->text();
    password=ui->password_edit->text();

    if (!connection(username,password)) {
        QMessageBox::information(this,"Informacja", "Nie uzyskano dostępu.");
        ui->login_edit->setText("");
        ui->password_edit->setText("");

    }

    else {
        QMessageBox::information(this,"Informacja","Uzyskano dostęp.");
        emit sendAccess(username,password);
        LoginDialog::accept();
    }
}

/*
 * Quit button
*/
void LoginDialog::on_quit_button_clicked()
{
    LoginDialog::reject();
}

/*
 * eventFilter for QLineEdits to select all
*/
bool LoginDialog::eventFilter(QObject *obj, QEvent *event)
{
    if (obj == (QObject*)ui->password_edit)
    {

            if (event->type() == QEvent::MouseButtonPress)
            {
                ui->password_edit->selectAll();
                return true;
            }
    }

    if (obj == (QObject*)ui->login_edit)
    {

            if (event->type() == QEvent::MouseButtonPress)
            {

                ui->login_edit->selectAll();
                return true;
            }
    }

    else
    {
        // pass the event on to the parent class
        return false;
    }

    return 0;
}





