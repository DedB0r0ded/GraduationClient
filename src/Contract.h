#ifndef CONTRACT_H
#define CONTRACT_H

#include <QObject>
#include <QString>
#include <QDate>
#include "Organisation.h"

class Contract : public QObject
{
    Q_OBJECT

public:
    explicit Contract(QObject* parent = nullptr)
        : QObject(parent) {}

signals:

public slots:

private:
    size_t m_id;
    bool m_continuous;
    bool m_urgent;
    QString m_subject;
    QString m_pdfPath;
    int m_totalCost;
    QDate m_concludedOn;
    QDate m_expiresOn;
    Organisation* m_contractor;
    Organisation* m_customer;
};

#endif
