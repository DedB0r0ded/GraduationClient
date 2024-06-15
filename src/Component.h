#ifndef COMPONENT_H
#define COMPONENT_H

#include <QObject>
#include <QString>
#include <QDate>
#include "Manufacturer.h"

class Component : public QObject
{
    Q_OBJECT

public:
    explicit Component(QObject* parent = nullptr)
        : QObject(parent){}

signals:

public slots:

private:
    size_t m_id;
    QString m_name;
    QString m_description;
    QString m_serialNumber;
    QDate m_manufactureYear;
    QString m_pictureRoute;
    Manufacturer* m_manufacturer;
};

#endif
