#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include "logindialog.h"
#include "qspreadsheetheaderview.h"
#include "sortfilterproxymodel.h"
#include "creatordialog.h"
#include "mysqlrelationaldelegate.h"
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
#include <QVBoxLayout>
#include <QDir>
#include <QSqlRecord>
#include <QTextEdit>
#include <QScrollArea>
#include <QCalendarWidget>
#include <QDateEdit>
#include <QClipboard>
#include <QFileDialog>
#include <QToolTip>
#include <QCompleter>

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

    QDir dir;
    QString path;

    bool add_table_active;
    bool access;
    bool sumbit_view;
    bool search_for_all;
    bool NOT_relation;
    bool creator_active;
    bool can_delete;
    bool additional_filter_isSet;
    bool * checked_columns_VIEW;
    bool * checked_columns_MAIN=NULL;
    bool isadded;
    bool editok;
    bool filter_i;
    bool receiveHiddenColumns_MAIN_active;
    bool row_block;

    int roww;
    int column_additional;
    int before_column_additional;
    static int const EXIT_CODE_REBOOT=-123456789;

    QMenu * myMenu=NULL;
    CerSimpleDynamics::Models::SortFilterProxyModel * proxy_own=NULL;
    QAction * actions_table_VIEW[9];
    QSpreadsheetHeaderView * header=NULL;
    QSqlRelationalTableModel* rmodel=NULL;
    QSortFilterProxyModel * proxy=NULL;
    QSortFilterProxyModel * proxy_test=NULL;
    QSortFilterProxyModel * proxy_additional=NULL;
    QDialog *additional_table_dialog=NULL;
    QDialog *description_dialog=NULL;
    QVBoxLayout *mainLayout=NULL;
    QVBoxLayout *description_layout=NULL;
    QLineEdit * additional_lineedit=NULL;
    QTableView *additional_table=NULL;
    QLabel *description_label=NULL;
    QScrollArea *scroll=NULL;
    QString * dynamic_table=NULL;
    QProgressBar* Statprogress;
    QPushButton *Statbutton;
    QLabel* Statlabel;
    QLabel* INFOlabel;
    QSqlTableModel * model=NULL;
    QSqlTableModel * model_add=NULL;
    QSqlTableModel * model_additional=NULL;
    QComboBox * comboBox_column_VIEW=NULL;
    mySqlRelationalDelegate * delegate=NULL;
    QCompleter * completer=NULL;

    /* The maximum number of columns */
    enum KOLUMN_MAX
    {
        BRAK_max=0,
        Miejsca_max=7,
        Daneosobowe_max=8,
        Maszyny_max=12,
        Konkurencja_max=5,
        RaportySerwisowe_max=13,
        ZgloszeniaSerwisowe_max=13,
        Czesci_max=8,
        Zlecenia_max=6,
    };
    KOLUMN_MAX column_max;

    /* The minimum number of columns */
    enum KOLUMN
    {
        BRAK=0,
        Miejsca=7,
        Daneosobowe=8,
        Maszyny=12,
        Konkurencja=5,
        RaportySerwisowe=13,
        ZgloszeniaSerwisowe=13,
        Czesci=8,
        Zlecenia=6,
    };
    KOLUMN column_const;

    /* The number of table in QListWidget */
    enum Table_LIST_idx
    {
        Miejsca_idx=0,
        Maszyny_idx=1,
        ZgloszeniaSerwisowe_idx=2,
        RaportySerwisowe_idx=3,
        Czesci_idx=4,
        Daneosobowe_idx=5,
        Konkurencja_idx=6,
        Zlecenia_idx=7,
    };

    QString main_table;
    QString main_view;    
    QString view;
    QString root;
    QString sigmasa;
    QString last_error;
    QString item_name_menu;
    QString place_to_add;
    static const QString Miejsca_checklist[2];
    static const QString Maszyny_checklist[3];
    static const QString Daneosobowe_checklist[2];
    static const QString Konkurencja_checklist[1];
    static const QString Raportyserwisowe_checklist[2];
    static const QString Zgloszeniaserwisowe_checklist[2];
    static const QString Czesci_checklist[2];
    static const QString Zgloszeniaserwisowe_Miejsca_checklist[2];

    //VIEW
    void checkbox_select(bool checked, QString tableName);
    void FillArray(QString * &Array, const QString *Array_checklist, int size);
    void ClearArray(QString *& Array);
    void open_additional_table(QString tableName);
    void View_button_visible();
    void Clear_VIEW();
    void clear_add_button();
    QString get_add_button_name(QString button_name);
    void create_model(QSortFilterProxyModel *_proxy, QSqlTableModel *_model, QString _view, QTableView *_table, bool header_active, bool editable);
    void create_model_own(CerSimpleDynamics::Models::SortFilterProxyModel * _proxy, QSqlTableModel * _model, QString _view, QTableView * _table, bool header_active, bool editable);
    void clear_additional_dialog();
    void fill_additional_comboboxes(QString _main_table);

    //ADD
    void Clear_ADD();
    bool delete_record(QSqlTableModel* model);
    bool delete_record(QSqlRelationalTableModel* rmodel);
    void add_record(QSqlTableModel* model);
    void add_record(QSqlRelationalTableModel *rmodel);
    bool submit(QSqlTableModel *model);
    bool submit(QSqlRelationalTableModel *rmodel);
    void init_relation_model(QSqlRelationalTableModel * _model, QSortFilterProxyModel * _proxy,QString tableName, QString rel_tableName, QString headerName);
    void init_relation_model(QSqlRelationalTableModel * _model,QSortFilterProxyModel * _proxy,QString tableName,QString rel_tableName,QString rel_tableName2,QString headerName,QString headerName2);
    void init_relation_model_cos(QSqlRelationalTableModel * model,QSortFilterProxyModel * proxy, QTableView * table);
    bool is_selected_properly(QSqlRelationalTableModel *rmodel);
    void fill_combobox();
    void check_selcted_place(QString data_to_check, bool add);
    void set_headers(QString _main_table,QSqlRelationalTableModel & _model);
    void set_headers_basic(QString _main_table,QSqlTableModel & _model);

public slots:
    void receiveAccess(QString login, QString password);
    void info_button();
    void moja(int row, QSqlRecord & record);
    void create_backup();
    void showToolTip (const QModelIndex & index);

    //VIEW
    void filterRegExpChanged();
    void additional_filterRegExpChanged();
    void combobox_selected_column(QString column_name);
    void closing_table_dialog();
    void ShowContextMenu(const QPoint& pos);
    void open_additional_table_SLOT(QAction*action);
    void receiveHiddenColumns_MAIN(bool *ichecked_columns);

    //ADD
    void filterRegExpChanged_ADD();
    void combobox_selected_column_ADD(QString column_name);

private slots:

    //VIEW
    void on_listWidget_VIEW_itemPressed(QListWidgetItem *item);
    void on_listWidget_VIEW_clicked();
    void on_listWidget_VIEW_currentRowChanged();
    void on_pushButton_clicked();
    void on_pushButton_2_clicked();
    void on_pushButton_3_clicked();
    void on_pushButton_clear_search_VIEW_clicked();
    void on_pushButton_clear_filter_VIEW_clicked();
    void on_pushButton_submit_filter_VIEW_clicked();

    //ADD
    void on_listWidget_ADD_clicked(const QModelIndex &index);
    void on_listWidget_ADD_itemPressed(QListWidgetItem *item);
    void on_pushButton_add_ADD_clicked();
    void on_pushButton_submit_ADD_clicked();
    void on_pushButton_delete_ADD_clicked();
    void on_pushButton_refresh_ADD_clicked();
    void on_tableView_ADD_pressed(const QModelIndex &index);
    void on_pushButton_10_clicked();
    void on_checkBox_M_DO_clicked(bool checked);
    void on_checkBox_M_CZ_clicked(bool checked);
    void on_pushButton_clear_search_ADD_clicked();
    void on_pushButton_submit_filter_ADD_clicked();
    void on_pushButton_clear_filter_ADD_clicked();

    void on_pushButton_11_clicked();
    void on_comboBox_currentIndexChanged(const QString &arg1);
    void on_comboBox_2_currentIndexChanged(const QString &arg1);
    void on_comboBox_3_currentIndexChanged(const QString &arg1);
    void on_comboBox_5_currentIndexChanged(const QString &arg1);
    void on_comboBox_6_currentIndexChanged(const QString &arg1);
    void on_comboBox_8_currentIndexChanged(const QString &arg1);
    void on_listWidget_VIEW_clicked(const QModelIndex &index);
    void on_comboBox_7_currentIndexChanged(const QString &arg1);
    void on_comboBox_9_currentIndexChanged(const QString &arg1);
    void on_comboBox_10_currentIndexChanged(const QString &arg1);
    void on_comboBox_11_currentIndexChanged(const QString &arg1);
    void on_comboBox_4_currentIndexChanged(const QString &arg1);
    void on_tableView_ADD_clicked(const QModelIndex &index);
    void on_tableView_ADD_activated(const QModelIndex &index);

signals:
    void sendHiddenColums(bool * ichecked_columns);
    void sendFilterBehavior(bool behavior,int index);

private:
    Ui::MainWindow *ui;
    bool eventFilter(QObject *obj, QEvent *event);
    void resizeEvent(QResizeEvent* event);
};

#endif // MAINWINDOW_H
