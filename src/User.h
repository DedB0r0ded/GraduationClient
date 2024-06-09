#ifndef USER_H
#define USER_H

#include <QObject>
#include <QString>

class User : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString firstName READ firstName WRITE setFirstName NOTIFY firstNameChanged)
    Q_PROPERTY(QString middleName READ middleName WRITE setMiddleName NOTIFY middleNameChanged)
    Q_PROPERTY(QString lastName READ lastName WRITE setLastName NOTIFY lastNameChanged)
    Q_PROPERTY(QString email READ email WRITE setEmail NOTIFY emailChanged)
    Q_PROPERTY(QString password READ password WRITE setPassword NOTIFY passwordChanged)
    Q_PROPERTY(QString sid READ sid WRITE setSid NOTIFY sidChanged)

public:
    explicit User(QObject* parent = nullptr)
        : QObject(parent), m_id(0) {}

    QString firstName() const { return m_firstName; }
    QString middleName() const { return m_middleName; }
    QString lastName() const { return m_lastName; }
    QString email() const { return m_email; }
    QString password() const { return m_password; }
    QString sid() const { return QString::number(m_id); }

    void setFirstName(const QString& firstName) {
        if (m_firstName != firstName) {
            m_firstName = firstName;
            emit firstNameChanged();
        }
    }

    void setMiddleName(const QString& middleName) {
        if (m_middleName != middleName) {
            m_middleName = middleName;
            emit middleNameChanged();
        }
    }

    void setLastName(const QString& lastName) {
        if (m_lastName != lastName) {
            m_lastName = lastName;
            emit lastNameChanged();
        }
    }

    void setEmail(const QString& email) {
        if (m_email != email) {
            m_email = email;
            emit emailChanged();
        }
    }

    void setPassword(const QString& password) {
        if (m_password != password) {
            m_password = password;
            emit passwordChanged();
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

    bool operator==(const User& other) const {
        return m_id == other.m_id &&
               m_firstName == other.m_firstName &&
               m_middleName == other.m_middleName &&
               m_lastName == other.m_lastName &&
               m_email == other.m_email &&
               m_password == other.m_password;
    }

    bool operator!=(const User& other) const {
        return !(*this == other);
    }

signals:
    void firstNameChanged();
    void middleNameChanged();
    void lastNameChanged();
    void emailChanged();
    void passwordChanged();
    void sidChanged();

private:
    size_t m_id;
    QString m_firstName;
    QString m_middleName;
    QString m_lastName;
    QString m_email;
    QString m_password;
};

#endif
