#ifndef MANUFACTURER_H
#define MANUFACTURER_H

#include <QObject>
#include <QString>

class Manufacturer : public QObject
{
    Q_OBJECT

public:
    explicit Manufacturer(QObject* parent = nullptr)
        : QObject(parent) {}

signals:

public slots:

private:
    size_t m_id;
    QString m_name;
    QString m_code;
    QString m_country;
    QString m_description;
    int m_rating;
};

#endif
