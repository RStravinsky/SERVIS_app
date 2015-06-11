#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include "logindialog.h"
#include "qspreadsheetheaderview.h"
#include <QMainWindow>
#include <QProgressBar>
#include <QPushButton>
#include <QFont>
#include <QImage>
#include <QLabel>
#include <QProcess>
#include <QDebug>
#include <QSql>
#include <QTableWidget>
#include <QSqlQueryModel>
#include <QSqlTableModel>
#include <QSortFilterProxyModel>
#include <QListWidgetItem>
#include <QThread>
#include <QSqlQuery>
#include <QSqlError>
#include <string>
#include <stdio.h>
#include <QSqlRelationalDelegate>
#include <QResizeEvent>
#include <QRect>
#include <QFontMetrics>
#include <algorithm>
#include <QHeaderView>

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

    bool add_table_active;
    bool access;
    bool sumbit_view;
    bool search_for_all;

    int column_additional;
    int column_all;
    static int const EXIT_CODE_REBOOT=-123456789;

    /* The initial number of columns */
    enum KOLUMN
    {
        BRAK=0,
        Sektory=1,
        Miejsca=4,
        Pracownicy=5,
        Maszyny=6,
        Zlecenia=5,
        Konkurencja=2,
        WykazKooperantow=3,
        RaportySerwisowe=4,
        ZgloszeniaSerwisowe=5,
        Czesci=5,
        Klienci=5,
    };
    KOLUMN column_const;

    /* The number of table in QListWidget */
    enum Table_LIST_idx
    {
        Sektory_idx=0,
        Miejsca_idx=1,
        Daneosobowe_idx=2,
        Maszyny_idx=3,
        Zlecenia_idx=4,
        Konkurencja_idx=5,
        WykazKooperantow_idx=6,
        RaportySerwisowe_idx=7,
        ZgloszeniaSerwisowe_idx=8,
        Czesci_idx=9,
    };

    QString main_table;
    QString main_view;    
    QString view;
    QString * dynamic_table;
    QString root;
    QString sigmasa;
    QString last_error;
    static const QString Sektor_checklist[3];
    static const QString Miejsca_checklist[4];
    static const QString Maszyny_checklist[9];
    static const QString Daneosobowe_checklist[];
    static const QString Zlecenia_checklist[2];
    static const QString Wykazkooperantow_checklist[3];
    static const QString Raportyserwisowe_checklist[2];
    static const QString Zgloszeniaserwisowe_checklist[3];
    static const QString Czesci_checklist[2];

    void checkbox_select(bool checked, QString tableName);
    int before_column_additional;
    void FillArray(QString * &Array, const QString *Array_checklist, int size);
    void ClearArray(QString *& Array);
    void ResizeArray(QString *& Array, int size, int newsize, QString tableName, bool direction);
    void open_additional_table(QString tableName);
    void create_comboBox();
    void unselect_all_CHECKBOX();
    void View_button_visible();
    void Clear_VIEW();
    void clear_add_button();
    QString get_add_button_name(QString button_name);
    void create_model(QString view);
    QSpreadsheetHeaderView * header;
    QSortFilterProxyModel * proxy;

public slots:
    void receiveAccess(QString login, QString password);
    void info_button();
    void combobox_selected_column(int index);
    void filterRegExpChanged();

private slots:
    void on_listWidget_VIEW_itemPressed(QListWidgetItem *item);
    void on_pushButton_submit_VIEW_clicked();
    void on_listWidget_VIEW_clicked();
    void on_SelectButton_VIEW_clicked();
    void on_Clearbutton_VIEW_clicked();
    void on_checkBox_miejsca_SEKTOR_clicked(bool checked);
    void on_checkBox_daneosobowe_SEKTOR_clicked(bool checked);
    void on_checkBox_sektor_MIEJSCA_clicked(bool checked);
    void on_checkBox_daneosobowe_MIEJSCA_clicked(bool checked);
    void on_checkBox_maszyny_MIEJSCA_clicked(bool checked);
    void on_listWidget_VIEW_currentRowChanged();
    void on_checkBox_maszyny_SEKTOR_clicked(bool checked);
    void on_checkBox_zlecenia_MIEJSCA_clicked(bool checked);
    void on_pushButton_clicked();
    void on_pushButton_2_clicked();
    void on_pushButton_3_clicked();
    //void on_lineEdit_Filtr_VIEW_textChanged(const QString &arg1);
    void on_SubmitFilterbutton_VIEW_clicked();
    void on_ClearFilterbutton_VIEW_clicked();
    void on_ClearSearchbutton_VIEW_clicked();
    void on_pushButton_4_clicked();
    void on_pushButton_5_clicked();
    void on_pushButton_6_clicked();
    void on_pushButton_7_clicked();
    void on_pushButton_8_clicked();
    void on_pushButton_9_clicked();
    void on_ReturnButton_VIEW_clicked();
    //void on_checkBox_clicked(bool checked);
    void on_checkBox_czesci_MASZYNY_clicked(bool checked);
    void on_checkBox_daneosobowe_MASZYNY_clicked(bool checked);
    void on_checkBox_konkurencja_MASZYNY_clicked(bool checked);
    void on_checkBox_kooperant_MASZYNY_clicked(bool checked);
    void on_checkBox_miejsca_MASZYNY_clicked(bool checked);
    void on_checkBox_raporty_MASZYNY_clicked(bool checked);
    void on_checkBox_sektor_MASZYNY_clicked(bool checked);
    void on_checkBox_zgloszenia_MASZYNY_clicked(bool checked);
    void on_checkBox_zlecenia_MASZYNY_clicked(bool checked);
    void on_checkBox_kooperant_ZLECENIA_clicked(bool checked);
    void on_checkBox_maszyny_ZLECENIA_clicked(bool checked);
    void on_checkBox_czesci_KOOPERANT_clicked(bool checked);
    void on_checkBox_daneosobowe_KOOPERANT_clicked(bool checked);
    void on_checkBox_maszyny_KOOPERANT_clicked(bool checked);
    void on_checkBox_maszyny_RAPORT_clicked(bool checked);
    void on_checkBox_zgoszenia_RAPORT_clicked(bool checked);
    void on_checkBox_kooperant_ZGLOSZENIA_clicked(bool checked);
    void on_checkBox_maszyny_ZGLOSZENIA_clicked(bool checked);
    void on_checkBox_raporty_ZGLOSZENIA_clicked(bool checked);
    void on_checkBox_kooperant_CZESCI_clicked(bool checked);
    void on_checkBox_maszyny_CZESCI_clicked(bool checked);



    //void on_checkBox_clicked();

private:
    Ui::MainWindow *ui;
    QProgressBar* Statprogress;
    QPushButton *Statbutton;
    QLabel* Statlabel;
    QLabel* INFOlabel;
    QSqlTableModel * model;
    QComboBox * comboBox_column_VIEW;
    bool eventFilter(QObject *obj, QEvent *event);
    void resizeEvent(QResizeEvent* event);

protected:
    void keyPressEvent(QKeyEvent* pe);

};

#endif // MAINWINDOW_H
