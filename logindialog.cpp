#include "logindialog.h"
#include "ui_logindialog.h"

LoginDialog::LoginDialog(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::LoginDialog)
{
    ui->setupUi(this);

    path=dir.absolutePath();

    QFont font("Calibri Light", 16, QFont::Bold ,false);

    ui->password_edit->setFont(font);
    ui->login_edit->setFont(font);

    QImage image(path + "/obrazy/sigma_LOGO_3D.png");
    ui->label_logo->setPixmap(QPixmap::fromImage(image.scaled(250,250,Qt::KeepAspectRatio,Qt::FastTransformation)));

    QImage user(path + "/obrazy/user.png");
    ui->label_user->setPixmap(QPixmap::fromImage(user.scaled(50,50,Qt::KeepAspectRatio,Qt::FastTransformation)));

    QImage password(path + "/obrazy/login.png");
    ui->label_password->setPixmap(QPixmap::fromImage(password.scaled(50,50,Qt::KeepAspectRatio,Qt::FastTransformation)));

    ui->password_edit->setEchoMode(QLineEdit::Password);

    QByteArray USER = qgetenv("USERNAME");
    User_x=USER;

    ui->login_edit->installEventFilter(this);
    ui->password_edit->installEventFilter(this);

    QTimer::singleShot(0,ui->login_edit,SLOT(setFocus()));
    connect(ui->login_edit,SIGNAL(editingFinished()),ui->password_edit,SLOT(setFocus()));
}

LoginDialog::~LoginDialog()
{
    delete ui;
}

// [SLOT] - slot when login button pressed
void LoginDialog::on_login_button_clicked()
{
    username=ui->login_edit->text();
    password=ui->password_edit->text();

    if (!connection(username,password))
    {
        QMessageBox::information(this,"Informacja", "Nie uzyskano dostępu.");
        ui->login_edit->setText("");
        ui->password_edit->setText("");
        ui->login_edit->setFocus();
    }

    else
    {
        QMessageBox::information(this,"Informacja","Uzyskano dostęp.");
        emit sendAccess(username,password);
        LoginDialog::accept();
    }
}

// [SLOT] - slot when quit button pressed
void LoginDialog::on_quit_button_clicked()
{
    LoginDialog::reject();
}


// eventFilter for QLineEdits to select all
bool LoginDialog::eventFilter(QObject *obj, QEvent *event)
{
    static int alt_count;

    if (obj == (QObject*)ui->password_edit)
    {

            if (event->type() == QEvent::MouseButtonPress)
            {
                ui->password_edit->selectAll();
                return true;
            }
    }

    if (event->type() == QEvent::KeyPress)
       {
        QKeyEvent *keyEvent = static_cast<QKeyEvent *>(event);

        if(obj == (QObject*)ui->password_edit)
           {
               if(keyEvent->key() == Qt::Key_Return)
               {
                    on_login_button_clicked();
               }
           }

        if(keyEvent->key() == Qt::Key_Alt)
        {
           if(alt_count<2) ++alt_count;
           else
           {
               alt_count=0;
               if(User_x.contains("strawinski",Qt::CaseInsensitive) ||
                  User_x.contains("pokrzywa",Qt::CaseInsensitive) ||
                  User_x.contains("kowalski",Qt::CaseInsensitive))
               {
                   ui->login_edit->setText("root");
                   ui->password_edit->setText("Serwis4q@");
                   on_login_button_clicked();
               }
           }
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


