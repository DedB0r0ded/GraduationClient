#ifndef CONTRACT_H
#define CONTRACT_H

#include <QObject>
#include <QString>
#include <QDate>
#include "Organisation.h"  // Assuming Organisation class is defined in a separate header file

class Contract : public QObject
{
    Q_OBJECT

    Q_PROPERTY(bool continuous READ continuous WRITE setContinuous NOTIFY continuousChanged)
    Q_PROPERTY(bool urgent READ urgent WRITE setUrgent NOTIFY urgentChanged)
    Q_PROPERTY(QString subject READ subject WRITE setSubject NOTIFY subjectChanged)
    Q_PROPERTY(QString pdfPath READ pdfPath WRITE setPdfPath NOTIFY pdfPathChanged)
    Q_PROPERTY(int totalCost READ totalCost WRITE setTotalCost NOTIFY totalCostChanged)
    Q_PROPERTY(QDate concludedOn READ concludedOn WRITE setConcludedOn NOTIFY concludedOnChanged)
    Q_PROPERTY(QDate expiresOn READ expiresOn WRITE setExpiresOn NOTIFY expiresOnChanged)
    Q_PROPERTY(Organisation* contractor READ contractor WRITE setContractor NOTIFY contractorChanged)
    Q_PROPERTY(Organisation* customer READ customer WRITE setCustomer NOTIFY customerChanged)
    Q_PROPERTY(QString sid READ sid WRITE setSid NOTIFY sidChanged)

public:
    explicit Contract(QObject* parent = nullptr)
        : QObject(parent), m_id(0), m_continuous(false), m_urgent(false), 
          m_totalCost(0), m_contractor(nullptr), m_customer(nullptr) {}

    bool continuous() const { return m_continuous; }
    bool urgent() const { return m_urgent; }
    QString subject() const { return m_subject; }
    QString pdfPath() const { return m_pdfPath; }
    int totalCost() const { return m_totalCost; }
    QDate concludedOn() const { return m_concludedOn; }
    QDate expiresOn() const { return m_expiresOn; }
    Organisation* contractor() const { return m_contractor; }
    Organisation* customer() const { return m_customer; }
    QString sid() const { return QString::number(m_id); }

    void setContinuous(bool continuous) {
        if (m_continuous != continuous) {
            m_continuous = continuous;
            emit continuousChanged();
        }
    }

    void setUrgent(bool urgent) {
        if (m_urgent != urgent) {
            m_urgent = urgent;
            emit urgentChanged();
        }
    }

    void setSubject(const QString& subject) {
        if (m_subject != subject) {
            m_subject = subject;
            emit subjectChanged();
        }
    }

    void setPdfPath(const QString& pdfPath) {
        if (m_pdfPath != pdfPath) {
            m_pdfPath = pdfPath;
            emit pdfPathChanged();
        }
    }

    void setTotalCost(int totalCost) {
        if (m_totalCost != totalCost) {
            m_totalCost = totalCost;
            emit totalCostChanged();
        }
    }

    void setConcludedOn(const QDate& concludedOn) {
        if (m_concludedOn != concludedOn) {
            m_concludedOn = concludedOn;
            emit concludedOnChanged();
        }
    }

    void setExpiresOn(const QDate& expiresOn) {
        if (m_expiresOn != expiresOn) {
            m_expiresOn = expiresOn;
            emit expiresOnChanged();
        }
    }

    void setContractor(Organisation* contractor) {
        if (m_contractor != contractor) {
            m_contractor = contractor;
            emit contractorChanged();
        }
    }

    void setCustomer(Organisation* customer) {
        if (m_customer != customer) {
            m_customer = customer;
            emit customerChanged();
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

    bool operator==(const Contract& other) const {
        return m_id == other.m_id &&
               m_continuous == other.m_continuous &&
               m_urgent == other.m_urgent &&
               m_subject == other.m_subject &&
               m_pdfPath == other.m_pdfPath &&
               m_totalCost == other.m_totalCost &&
               m_concludedOn == other.m_concludedOn &&
               m_expiresOn == other.m_expiresOn &&
               m_contractor == other.m_contractor &&
               m_customer == other.m_customer;
    }

    bool operator!=(const Contract& other) const {
        return !(*this == other);
    }

signals:
    void continuousChanged();
    void urgentChanged();
    void subjectChanged();
    void pdfPathChanged();
    void totalCostChanged();
    void concludedOnChanged();
    void expiresOnChanged();
    void contractorChanged();
    void customerChanged();
    void sidChanged();

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
