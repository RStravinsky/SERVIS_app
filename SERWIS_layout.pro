#-------------------------------------------------
#
# Project created by QtCreator 2015-05-29T07:08:31
#
#-------------------------------------------------

QT       += core gui sql

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = SERWIS_layout
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp \
    logindialog.cpp \
    qspreadsheetheaderview.cpp \
    sortfilterproxymodel.cpp \
    creatordialog.cpp \
    mysqlrelationaldelegate.cpp

HEADERS  += mainwindow.h \
    logindialog.h \
    qspreadsheetheaderview.h \
    sortfilterproxymodel.h \
    creatordialog.h \
    mysqlrelationaldelegate.h

FORMS    += mainwindow.ui \
    logindialog.ui \
    creatordialog.ui
