#ifndef USER_H
#define USER_H

#include <QObject>
#include <QString>

class User : public QObject
{
    Q_OBJECT

public:
    explicit User(QObject* parent = nullptr)
        : QObject(parent) {}

signals:

public slots:

private:
    size_t m_id;
    QString m_firstName;
    QString m_middleName;
    QString m_lastName;
    QString m_email;
    QString m_password;
};

#endif
