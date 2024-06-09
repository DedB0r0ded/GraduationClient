#ifndef FACILITY_H
#define FACILITY_H

#include <QObject>
#include <QString>
#include <QDate>
#include "Manufacturer.h"

class Facility : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString description READ description WRITE setDescription NOTIFY descriptionChanged)
    Q_PROPERTY(QString serialNumber READ serialNumber WRITE setSerialNumber NOTIFY serialNumberChanged)
    Q_PROPERTY(QDate manufactureYear READ manufactureYear WRITE setManufactureYear NOTIFY manufactureYearChanged)
    Q_PROPERTY(QString pictureRoute READ pictureRoute WRITE setPictureRoute NOTIFY pictureRouteChanged)
    Q_PROPERTY(Manufacturer* manufacturer READ manufacturer WRITE setManufacturer NOTIFY manufacturerChanged)
    Q_PROPERTY(QString sid READ sid WRITE setSid NOTIFY sidChanged)

public:
    explicit Facility(QObject* parent = nullptr)
        : QObject(parent), m_id(0), m_manufacturer(nullptr) {}

    QString name() const { return m_name; }
    QString description() const { return m_description; }
    QString serialNumber() const { return m_serialNumber; }
    QDate manufactureYear() const { return m_manufactureYear; }
    QString pictureRoute() const { return m_pictureRoute; }
    Manufacturer* manufacturer() const { return m_manufacturer; }
    QString sid() const { return QString::number(m_id); }

    void setName(const QString& name) {
        if (m_name != name) {
            m_name = name;
            emit nameChanged();
        }
    }

    void setDescription(const QString& description) {
        if (m_description != description) {
            m_description = description;
            emit descriptionChanged();
        }
    }

    void setSerialNumber(const QString& serialNumber) {
        if (m_serialNumber != serialNumber) {
            m_serialNumber = serialNumber;
            emit serialNumberChanged();
        }
    }

    void setManufactureYear(const QDate& manufactureYear) {
        if (m_manufactureYear != manufactureYear) {
            m_manufactureYear = manufactureYear;
            emit manufactureYearChanged();
        }
    }

    void setPictureRoute(const QString& pictureRoute) {
        if (m_pictureRoute != pictureRoute) {
            m_pictureRoute = pictureRoute;
            emit pictureRouteChanged();
        }
    }

    void setManufacturer(Manufacturer* manufacturer) {
        if (m_manufacturer != manufacturer) {
            m_manufacturer = manufacturer;
            emit manufacturerChanged();
        }
    }

    void setSid(const QString& sid) {
        bool ok;
        size_t id = sid.toULongLong(&ok);
        if (ok && m_id != id) {
            m_id = id;
            emit sidChanged();
        }
    }

    bool operator==(const Facility& other) const {
        return m_id == other.m_id &&
               m_name == other.m_name &&
               m_description == other.m_description &&
               m_serialNumber == other.m_serialNumber &&
               m_manufactureYear == other.m_manufactureYear &&
               m_pictureRoute == other.m_pictureRoute &&
               m_manufacturer == other.m_manufacturer;
    }

    bool operator!=(const Facility& other) const {
        return !(*this == other);
    }

signals:
    void nameChanged();
    void descriptionChanged();
    void serialNumberChanged();
    void manufactureYearChanged();
    void pictureRouteChanged();
    void manufacturerChanged();
    void sidChanged();

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
