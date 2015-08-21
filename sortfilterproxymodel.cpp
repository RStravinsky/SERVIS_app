#include "sortfilterproxymodel.h"
#include <qdebug.h>

#define DEBUG_ACTIVE false

namespace CerSimpleDynamics
{
    namespace Models
    {
        SortFilterProxyModel::SortFilterProxyModel(int columns_maximum, int columns_minimum,QObject *parent) : QSortFilterProxyModel(parent)
        {
            behavior_rec=false;
            columns_max=columns_maximum;
            tab = new bool[columns_max];
            std::fill(tab, tab + columns_max, false);
            for(int i=0;i<columns_minimum;i++)
            {
                tab[i]=true;
            }

            checked_columns=tab;

            for(int i=0;i<columns_max;i++)
            {
                #if (DEBUG_ACTIVE==true)
                     qDebug()<<"SortFilterProxyModel (constructor) hidden columns"<<checked_columns[i];
                #endif
            }
            #if (DEBUG_ACTIVE==true)
                 qDebug()<<endl;
            #endif

        }

        void SortFilterProxyModel::receiveHiddenColumns(bool* ichecked_columns)
        {
            delete tab;
            tab=NULL;
            checked_columns=ichecked_columns;
            #if (DEBUG_ACTIVE==true)
                qDebug()<<"SortFilterProxyModel (received slot) adress of checked_columns"<<checked_columns;
                qDebug()<<"SortFilterProxyModel (received slot) adress of ichecked_columns"<<ichecked_columns;
            #endif

            for(int i=0;i<columns_max;i++)
            {
                #if (DEBUG_ACTIVE==true)
                    qDebug()<<"SortFilterProxyModel (received slot) hidden columns"<<i<<":"<<checked_columns[i];
                #endif
            }
            #if (DEBUG_ACTIVE==true)
                 qDebug()<<endl;
            #endif

        }

        void SortFilterProxyModel::receiveFilterBehavior(bool behavior, int index)
        {
            index_rec=index;
            behavior_rec=behavior;
        }

        bool SortFilterProxyModel::filterAcceptsRow( int sourceRow, const QModelIndex &sourceParent) const
        {
            bool all=false;
            bool tab[23];
            std::fill(tab, tab + columns_max, false);
            QModelIndex hidden_columns[23];
            QModelIndex model_idx;
            int j=0;


                if(!behavior_rec)
                {
                    for(int i=0;i<sourceModel()->columnCount();i++)
                        {
                                if(checked_columns[i]==true)
                                     {
                                     hidden_columns[j] = sourceModel()->index(sourceRow, i, sourceParent);
                                     tab[j]=sourceModel()->data(hidden_columns[j]).toString().contains(filterRegExp());
                                     all = all || tab[j];
                                     j++ ;
                                     }
                         }
                    }
                else
                {
                        model_idx = sourceModel()->index(sourceRow, index_rec, sourceParent);
                        all=sourceModel()->data(model_idx).toString().contains(filterRegExp());
                }

            return all;
        }

    }
}

#include "moc_sortfilterproxymodel.cpp"
