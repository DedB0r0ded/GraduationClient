#ifndef ORGANISATION_H
#define ORGANISATION_H

#include <QObject>
#include <QString>

class Organisation : public QObject
{
    Q_OBJECT

public:
    explicit Organisation(QObject* parent = nullptr)
        : QObject(parent) {}

signals:

public slots:

private:
    size_t m_id;
    QString m_name;
    QString m_tid;
    QString m_address;
    QString m_fax;
    QString m_bankAccount;
    QString m_rcbic;
    QString m_bankName;
    QString m_bankAddress;
    bool m_client;
};

#endif
