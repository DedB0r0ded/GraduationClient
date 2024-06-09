#ifndef MANUFACTURER_H
#define MANUFACTURER_H

#include <QObject>
#include <QString>

class Manufacturer : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString code READ code WRITE setCode NOTIFY codeChanged)
    Q_PROPERTY(QString country READ country WRITE setCountry NOTIFY countryChanged)
    Q_PROPERTY(QString description READ description WRITE setDescription NOTIFY descriptionChanged)
    Q_PROPERTY(int rating READ rating WRITE setRating NOTIFY ratingChanged)
    Q_PROPERTY(QString sid READ sid WRITE setSid NOTIFY sidChanged)

public:
    explicit Manufacturer(QObject* parent = nullptr)
        : QObject(parent), m_id(0), m_rating(0) {}

    // Getters
    QString name() const { return m_name; }
    QString code() const { return m_code; }
    QString country() const { return m_country; }
    QString description() const { return m_description; }
    int rating() const { return m_rating; }
    QString sid() const { return QString::number(m_id); }

    // Setters
    void setName(const QString& name) {
        if (m_name != name) {
            m_name = name;
            emit nameChanged();
        }
    }

    void setCode(const QString& code) {
        if (m_code != code) {
            m_code = code;
            emit codeChanged();
        }
    }

    void setCountry(const QString& country) {
        if (m_country != country) {
            m_country = country;
            emit countryChanged();
        }
    }

    void setDescription(const QString& description) {
        if (m_description != description) {
            m_description = description;
            emit descriptionChanged();
        }
    }

    void setRating(int rating) {
        if (m_rating != rating) {
            m_rating = rating;
            emit ratingChanged();
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

    bool operator==(const Manufacturer& other) const {
        return m_id == other.m_id &&
               m_name == other.m_name &&
               m_code == other.m_code &&
               m_country == other.m_country &&
               m_description == other.m_description &&
               m_rating == other.m_rating;
    }

    bool operator!=(const Manufacturer& other) const {
        return !(*this == other);
    }

signals:
    void nameChanged();
    void codeChanged();
    void countryChanged();
    void descriptionChanged();
    void ratingChanged();
    void sidChanged();

private:
    size_t m_id;
    QString m_name;
    QString m_code;
    QString m_country;
    QString m_description;
    int m_rating;
};

#endif
