#ifndef ORGANISATION_H
#define ORGANISATION_H

#include <QObject>
#include <QString>

class Organisation : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString tid READ tid WRITE setTid NOTIFY tidChanged)
    Q_PROPERTY(QString address READ address WRITE setAddress NOTIFY addressChanged)
    Q_PROPERTY(QString fax READ fax WRITE setFax NOTIFY faxChanged)
    Q_PROPERTY(QString bankAccount READ bankAccount WRITE setBankAccount NOTIFY bankAccountChanged)
    Q_PROPERTY(QString rcbic READ rcbic WRITE setRcbic NOTIFY rcbicChanged)
    Q_PROPERTY(QString bankName READ bankName WRITE setBankName NOTIFY bankNameChanged)
    Q_PROPERTY(QString bankAddress READ bankAddress WRITE setBankAddress NOTIFY bankAddressChanged)
    Q_PROPERTY(bool client READ client WRITE setClient NOTIFY clientChanged)
    Q_PROPERTY(QString sid READ sid WRITE setSid NOTIFY sidChanged)

public:
    explicit Organisation(QObject* parent = nullptr)
        : QObject(parent), m_id(0), m_client(false) {}

    QString name() const { return m_name; }
    QString tid() const { return m_tid; }
    QString address() const { return m_address; }
    QString fax() const { return m_fax; }
    QString bankAccount() const { return m_bankAccount; }
    QString rcbic() const { return m_rcbic; }
    QString bankName() const { return m_bankName; }
    QString bankAddress() const { return m_bankAddress; }
    bool client() const { return m_client; }
    QString sid() const { return QString::number(m_id); }

    void setName(const QString& name) {
        if (m_name != name) {
            m_name = name;
            emit nameChanged();
        }
    }

    void setTid(const QString& tid) {
        if (m_tid != tid) {
            m_tid = tid;
            emit tidChanged();
        }
    }

    void setAddress(const QString& address) {
        if (m_address != address) {
            m_address = address;
            emit addressChanged();
        }
    }

    void setFax(const QString& fax) {
        if (m_fax != fax) {
            m_fax = fax;
            emit faxChanged();
        }
    }

    void setBankAccount(const QString& bankAccount) {
        if (m_bankAccount != bankAccount) {
            m_bankAccount = bankAccount;
            emit bankAccountChanged();
        }
    }

    void setRcbic(const QString& rcbic) {
        if (m_rcbic != rcbic) {
            m_rcbic = rcbic;
            emit rcbicChanged();
        }
    }

    void setBankName(const QString& bankName) {
        if (m_bankName != bankName) {
            m_bankName = bankName;
            emit bankNameChanged();
        }
    }

    void setBankAddress(const QString& bankAddress) {
        if (m_bankAddress != bankAddress) {
            m_bankAddress = bankAddress;
            emit bankAddressChanged();
        }
    }

    void setClient(bool client) {
        if (m_client != client) {
            m_client = client;
            emit clientChanged();
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

    bool operator==(const Organisation& other) const {
        return m_id == other.m_id &&
               m_name == other.m_name &&
               m_tid == other.m_tid &&
               m_address == other.m_address &&
               m_fax == other.m_fax &&
               m_bankAccount == other.m_bankAccount &&
               m_rcbic == other.m_rcbic &&
               m_bankName == other.m_bankName &&
               m_bankAddress == other.m_bankAddress &&
               m_client == other.m_client;
    }

    bool operator!=(const Organisation& other) const {
        return !(*this == other);
    }

signals:
    void nameChanged();
    void tidChanged();
    void addressChanged();
    void faxChanged();
    void bankAccountChanged();
    void rcbicChanged();
    void bankNameChanged();
    void bankAddressChanged();
    void clientChanged();
    void sidChanged();

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
