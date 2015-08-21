#ifndef SORTFILTERPROXYMODEL_H
#define SORTFILTERPROXYMODEL_H

#include <QSortFilterProxyModel>
#include <QDate>
#include <string>

namespace CerSimpleDynamics
{
    namespace Models
    {
        class SortFilterProxyModel : public QSortFilterProxyModel
        {
            Q_OBJECT
        public:
            explicit SortFilterProxyModel(int columns_maximum, int columns_minimum, QObject *parent = 0);
            int columns_max;
            int columns_min;
            bool * checked_columns=NULL;
            bool * tab=NULL;
            int index_rec;
            bool behavior_rec;

       public slots:
            void receiveHiddenColumns(bool* ichecked_columns);
            void receiveFilterBehavior(bool behavior, int index);

       protected:
            bool filterAcceptsRow( int sourceRow, const QModelIndex &sourceParent) const;

        private:
        };
    }
}

#endif // SORTFILTERPROXYMODEL_H
