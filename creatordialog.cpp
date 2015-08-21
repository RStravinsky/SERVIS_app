#include "creatordialog.h"
#include "ui_creatordialog.h"

#define DEBUG_ACTIVE false

creatordialog::creatordialog(QString main_table,QWidget *parent) :
    QDialog(parent),
    ui(new Ui::creatordialog)
{
    ui->setupUi(this);
    level=0;

    path=dir.absolutePath();

    relation=false;
    count=false;
    ui->pushButton_add->setVisible(false);
    ui->pushButton_delete->setVisible(false);

    table_constructor=main_table;
    this->setWindowTitle("Kreator relacji");
    ui->stackedWidget->setCurrentIndex(0);

    QImage image(path + "/obrazy/sigma_LOGO_3D.png");
    ui->logo_label->setPixmap(QPixmap::fromImage(image.scaled(200,200,Qt::KeepAspectRatio,Qt::FastTransformation)));

    ui->pushButton->setIcon(QIcon(path + "/obrazy/arrow_right.png"));
    ui->pushButton->setIconSize(QSize(40, 40));

    ui->pushButton_delete->setIcon(QIcon(path + "/obrazy/delete_row.png"));
    ui->pushButton_delete->setIconSize(QSize(20, 20));

    ui->pushButton_add->setIcon(QIcon(path + "/obrazy/add_row.png"));
    ui->pushButton_add->setIconSize(QSize(20, 20));

    ui->checkBox_2->setVisible(true);
    relational_table="";
    relational_table_2="";

    table=main_table;

    if(main_table=="Daneosobowe"){
        ui->checkBox->setText("Maszyny");
        ui->checkBox_2->setVisible(false);
    }
    else if(main_table=="Czesci"){
        ui->checkBox->setText("Maszyny");
        ui->checkBox_2->setVisible(false);
    }
    else if(main_table=="Maszyny"){
        ui->checkBox->setText("Części");
        ui->checkBox_2->setText("Dane osobowe");
    }

    else if(main_table=="Maszyny_has_Daneosobowe"){
       relation=true;
       relational_table_2=main_table;
       on_pushButton_clicked();
    }
    else if(main_table=="Maszyny_has_Czesci"){
       relation=true;
       relational_table_2=main_table;
       on_pushButton_clicked();
    }

    if(relation){
        ui->pushButton_add->setVisible(true);
        ui->pushButton_delete->setVisible(true);
    }

    connect(this, SIGNAL(rejected()), this, SLOT(closing_creator_dialog()));
}

creatordialog::~creatordialog()
{
    delete ui;
}

// [SLOT] - slot when closing additional table dialog
void creatordialog::closing_creator_dialog()
{
    #if (DEBUG_ACTIVE==true)
        qDebug()<<"Closeing creator dialog ..."<<endl;
    #endif
    level=0;
    first_table="";
    second_table="";
    table="";
}

// [SLOT] - slot when pressing next button in creator
void creatordialog::on_pushButton_clicked()
{

    #if (DEBUG_ACTIVE==true)
        qDebug()<<"level="<<level;
        qDebug()<<"table"<<table;
        qDebug()<<"CHECKBOX 1:"<<relational_table;
        qDebug()<<"CHECKBOX 2:"<<relational_table_2;
        qDebug()<<"first table:"<<first_table;
        qDebug()<<"second table"<<second_table<<endl;
    #endif

    if(ui->checkBox->isChecked()==false && ui->checkBox_2->isChecked()==false && relation==false)
    {
       QMessageBox::information(this,"Informacja","Nie nadano relacji");
       this->accept();
       return;
    }

    switch(level)
    {
        case 0:
            ui->stackedWidget->setCurrentIndex(level+1);

            if(relational_table=="")
            {
                #if (DEBUG_ACTIVE==true)
                    qDebug()<<"open_model1"<<relational_table_2<<endl;
                #endif
                if(creator_model!=NULL) delete creator_model; creator_model=NULL;
                creator_model = new QSqlRelationalTableModel(this);
                init_relation_model(creator_model,ui->tableView_CREATOR_1,relational_table_2);
            }
            else if(relational_table_2=="")
            {
                #if (DEBUG_ACTIVE==true)
                    qDebug()<<"open_model2"<<relational_table;
                #endif
                if(creator_model!=NULL) delete creator_model; creator_model=NULL;
                creator_model = new QSqlRelationalTableModel(this);
                init_relation_model(creator_model,ui->tableView_CREATOR_1,relational_table);
            }
            else if(relational_table_2!="" && relational_table!="")
            {
                #if (DEBUG_ACTIVE==true)
                    qDebug()<<"open_model3"<<relational_table;
                #endif
                if(creator_model!=NULL) delete creator_model; creator_model=NULL;
                creator_model = new QSqlRelationalTableModel(this);
                init_relation_model(creator_model,ui->tableView_CREATOR_1,relational_table);
            }

            if(table_constructor=="Daneosobowe" || table_constructor=="Czesci" || relational_table_2=="" || relational_table=="")
            {
                ui->stackedWidget->setCurrentIndex(level+1);
                ui->pushButton->setIcon(QIcon(path + "/obrazy/exit.png"));
                ui->pushButton->setIconSize(QSize(40, 40));
            }

            break;

        case 1:
            if(table_constructor=="Daneosobowe" || table_constructor=="Czesci" || relational_table_2=="" || relational_table==""){level=2;}
            else{
                if(!relation){if(!submit(creator_model))break;}
                #if (DEBUG_ACTIVE==true)
                     qDebug()<<"open_model_2"<<relational_table_2<<endl;
                #endif
                init_relation_model(creator_model,ui->tableView_CREATOR_2,relational_table_2);
                ui->stackedWidget->setCurrentIndex(level+1);
                ui->pushButton->setIcon(QIcon(path + "/obrazy/exit.png"));
                ui->pushButton->setIconSize(QSize(40, 40));
                break;
            }

        case 2:
            if(!submit(creator_model))break;
            QMessageBox::information(this,"Informacja","Relacje nadane pomyślnie");
            level=0;
            this->accept();
            return;
        }

    level++;

}

// [SLOT] - slot when checked first checkbox
void creatordialog::on_checkBox_clicked(bool checked)
{
    if(checked)
    {
        if(table_constructor=="Daneosobowe")
        {
            relational_table="Maszyny_has_Daneosobowe";
            first_table="Maszyny";
        }
        else if(table_constructor=="Czesci")
        {
            relational_table="Maszyny_has_Czesci";
            first_table="Maszyny";
        }
        else if(table_constructor=="Maszyny")
        {
            relational_table="Maszyny_has_Czesci";
            first_table="Maszyny";
        }
    }

    else if(!checked)
    {
        if(table_constructor=="Daneosobowe")
        {
            relational_table="";
            first_table="";
        }
        else if(table_constructor=="Czesci")
        {
             relational_table="";
             first_table="";
        }
        else if(table_constructor=="Maszyny")
        {
            relational_table="";
            first_table="";
        }
     }

#if (DEBUG_ACTIVE==true)
    qDebug()<<"table"<<table;
    qDebug()<<"CHECKBOX 1:"<<relational_table;
    qDebug()<<"CHECKBOX 2:"<<relational_table_2;
    qDebug()<<"first table:"<<first_table;
    qDebug()<<"second table"<<second_table<<endl;
#endif

}

// [SLOT] - slot when checked second checkbox
void creatordialog::on_checkBox_2_clicked(bool checked)
{
    if(checked)
    {
        if(table_constructor=="Maszyny")
        {
            relational_table_2="Maszyny_has_Daneosobowe";
            second_table="Daneosobowe";
        }
    }

    else if(!checked)
    {
        if(table_constructor=="Maszyny")
        {
            relational_table_2="";
            second_table="";
        }
     }

#if (DEBUG_ACTIVE==true)
    qDebug()<<"table"<<table;
    qDebug()<<"CHECKBOX 1:"<<relational_table;
    qDebug()<<"CHECKBOX 2:"<<relational_table_2;
    qDebug()<<"first table:"<<first_table;
    qDebug()<<"second table"<<second_table<<endl;
#endif
}

// Function to init relational model
void creatordialog::init_relation_model(QSqlRelationalTableModel * model, QTableView * table, QString tableName)
{
    model->setEditStrategy(QSqlTableModel::OnManualSubmit);
    model->setTable(tableName);

    if(tableName=="Maszyny_has_Daneosobowe"){
    model->setRelation(model->fieldIndex("idMaszyny_MaszynyDaneosobowe"), QSqlRelation("Maszyny", "idMaszyny", "nrFabryczny_Maszyny"));
    model->setRelation(model->fieldIndex("idDaneosobowe_MaszynyDaneosobowe"), QSqlRelation("Daneosobowe", "idDaneosobowe", "nazwisko_Daneosobowe"));
    }
    else if(tableName=="Maszyny_has_Czesci"){
    model->setRelation(model->fieldIndex("idMaszyny_MaszynyCzesci"), QSqlRelation("Maszyny", "idMaszyny", "nrFabryczny_Maszyny"));
    model->setRelation(model->fieldIndex("idCzesci_MaszynyCzesci"), QSqlRelation("Czesci", "idCzesci", "nazwa_Czesci"));
    }

    model->select();
    /*
     * coutry_id - id w tabeli "city"
     * country - nazwa tabeli powiązanej
     * country_id - id w tabeli "country"
     * nazwa kolumny
    */

    table->setModel(model);
    table->horizontalHeader()->setSectionResizeMode(QHeaderView::ResizeToContents);
    table->verticalHeader()->setFixedWidth(50);
    table->horizontalHeader()->setFixedHeight(30);

    delegete=new QSqlRelationalDelegate(table);
    table->setItemDelegate(delegete);

    if(!relation){
        table->scrollToBottom();
        model->insertRow(model->rowCount());
        for (int row = 0; row < (model->rowCount())-1; row++)
        {
               table->hideRow(row);
        }
    }

}

// Function to submit relational model
bool creatordialog::submit(QSqlRelationalTableModel * model)
{  
    if     (model->index((model->rowCount()-1),0).data().toString()=="TYMCZASOWA" ||
            model->index((model->rowCount()-1),0).data().toString()=="BRAK") {
        level--;

        QMessageBox::information(this,"Informacja","Nie można przyporządkować do '"+model->index((model->rowCount()-1),0).data().toString()+"'.");
        return false;

    }
    else if(model->index((model->rowCount()-1),1).data().toString()=="TYMCZASOWA" ||
            model->index((model->rowCount()-1),1).data().toString()=="BRAK") {
        level--;
        QMessageBox::information(this,"Informacja","Nie można przyporządkować do '"+model->index((model->rowCount()-1),0).data().toString()+"'.");
        return false;

    }

    if(!model->submitAll())
    {
        QMessageBox::warning(this,"BŁĄD",model->lastError().text());
        level--;
        return false;
    }
    else
    {
        QMessageBox::information(this,"Informacja","Operacja została wykonana.");
        return true;
    }
}

// Function to add record to table
void creatordialog::add_record(QSqlRelationalTableModel* rmodel)
{
ui->tableView_CREATOR_1->scrollToBottom();
rmodel->insertRow(creator_model->rowCount());
}

// Function to deleting record from table
bool creatordialog::delete_record(QSqlRelationalTableModel* rmodel)
{
    int row_to_delete;
    QModelIndexList selectedList = ui->tableView_CREATOR_1->selectionModel()->selectedRows();
    for( int i=0; i<selectedList.count(); i++)
    {
            row_to_delete=selectedList.at(i).row();
    }

    if(selectedList.isEmpty())
    {
        QMessageBox::information(this,"Informacja","Nie zaznaczono wiersza do usunięcia.");
        return false;
    }

    QSqlQueryModel model;
    model.setQuery("SELECT * FROM "+relational_table_2+"");

    int id_first = model.data(model.index(row_to_delete, 0)).toInt();
    int id_second = model.data(model.index(row_to_delete, 1)).toInt();

    QSqlQuery query;
    if(relational_table_2=="Maszyny_has_Daneosobowe"){
        query.prepare("Delete from Maszyny_has_Daneosobowe where idMaszyny_MaszynyDaneosobowe=:first_id and idDaneosobowe_MaszynyDaneosobowe=:second_id");
    }
    else if(relational_table_2=="Maszyny_has_Czesci"){
        query.prepare("Delete from Maszyny_has_Czesci where idMaszyny_MaszynyCzesci=:first_id and idCzesci_MaszynyCzesci=:second_id");
    }
    query.bindValue(":first_id", id_first);
    query.bindValue(":second_id", id_second);

    if(query.exec())
    {
        QMessageBox::information(this,"Informacja","USUNIĘTO");
        rmodel->select();
        count=false;
        return true;
    }
    else
    {
        QMessageBox::information(this,"Informacja",query.lastError().text());  
        return false;
    }
}

// [SLOT] - slot when delete button is pressed
void creatordialog::on_pushButton_delete_clicked()
{
    delete_record(creator_model);
}

// [SLOT] - slot when add button is pressed
void creatordialog::on_pushButton_add_clicked()
{
    if(count==true)
        {
            QMessageBox::information(this,"Informacja","Nie można dodać dwóch pustych wierszy.");
            return;
        }
    add_record(creator_model);
    count=true;
}
