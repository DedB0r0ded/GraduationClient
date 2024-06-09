#ifndef REG_KEY_H
#define REG_KEY_H

#include <QObject>
#include <QString>

#include "Organisation.h"

class RegKey : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString value READ value WRITE setValue NOTIFY valueChanged)
    Q_PROPERTY(Organisation* organisation READ organisation WRITE setOrganisation NOTIFY organisationChanged)
    Q_PROPERTY(int power READ power WRITE setPower NOTIFY powerChanged)
    Q_PROPERTY(bool admin READ admin WRITE setAdmin NOTIFY adminChanged)
    Q_PROPERTY(QString sid READ sid WRITE setSid NOTIFY sidChanged)

public:
    explicit RegKey(QObject* parent = nullptr)
        : QObject(parent), m_id(0), m_organisation(nullptr), m_power(0), m_admin(false) {}

    QString value() const { return m_value; }
    Organisation* organisation() const { return m_organisation; }
    int power() const { return m_power; }
    bool admin() const { return m_admin; }
    QString sid() const { return QString::number(m_id); }

    void setValue(const QString& value) {
        if (m_value != value) {
            m_value = value;
            emit valueChanged();
        }
    }

    void setOrganisation(Organisation* organisation) {
        if (m_organisation != organisation) {
            m_organisation = organisation;
            emit organisationChanged();
        }
    }

    void setPower(int power) {
        if (m_power != power) {
            m_power = power;
            emit powerChanged();
        }
    }

    void setAdmin(bool admin) {
        if (m_admin != admin) {
            m_admin = admin;
            emit adminChanged();
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

    bool operator==(const RegKey& other) const {
        return m_id == other.m_id &&
               m_value == other.m_value &&
               m_organisation == other.m_organisation &&
               m_power == other.m_power &&
               m_admin == other.m_admin;
    }

    bool operator!=(const RegKey& other) const {
        return !(*this == other);
    }

signals:
    void valueChanged();
    void organisationChanged();
    void powerChanged();
    void adminChanged();
    void sidChanged();

private:
    size_t m_id;
    QString m_value;
    Organisation* m_organisation;
    int m_power;
    bool m_admin;
};

#endif
