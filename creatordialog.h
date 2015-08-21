#ifndef CREATORDIALOG_H
#define CREATORDIALOG_H

#include <QDialog>
#include <QMessageBox>
#include <QDir>
#include <QSqlRelationalTableModel>
#include <QSqlTableModel>
#include <QSqlRelationalTableModel>
#include <QSqlRelationalDelegate>
#include <QSqlRelation>
#include <QTableView>
#include <QStandardItem>
#include <QDesktopServices>
#include "mainwindow.h"

namespace Ui {
class creatordialog;
}

class creatordialog : public QDialog
{
    Q_OBJECT

public:
    explicit creatordialog(QString main_table, QWidget *parent = 0);
    ~creatordialog();
    QString path;
    QDir dir;
    QString table_constructor;
    QString relational_table;
    QString relational_table_2;
    QString first_table;
    QString second_table;
    QString table;
    QSqlRelationalTableModel * creator_model=NULL;
    QSqlRelationalDelegate * delegete=NULL;
    bool submit(QSqlRelationalTableModel *model);
    bool relation;
    bool count;
    int level;
    bool delete_record(QSqlRelationalTableModel* rmodel);
    void add_record(QSqlRelationalTableModel* rmodel);

private slots:
    void on_pushButton_clicked();
    void on_checkBox_clicked(bool checked);
    void on_checkBox_2_clicked(bool checked);
    void init_relation_model(QSqlRelationalTableModel * model, QTableView * table, QString tableName);
    void closing_creator_dialog();
    void on_pushButton_delete_clicked();
    void on_pushButton_add_clicked();

private:
    Ui::creatordialog *ui;
};

#endif // CREATORDIALOG_H
