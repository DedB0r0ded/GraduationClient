#ifndef REST_CLASSES_H
#define REST_CLASSES_H

#include <QObject>
#include <QDate>

struct User{
  size_t id;
  QString firstName;
  QString middleName;
  QString lastName;
  QString email;
  QString password;
  bool operator==(const User& other) const;
  bool operator!=(const User& other) const;
};

struct Organisation{
  size_t id;
  QString name;
  QString tid;
  QString address;
  QString fax;
  QString bankAccount;
  QString rcbic;
  QString bankName;
  QString bankAddress;
  bool client;
  bool operator==(const Organisation& other) const;
  bool operator!=(const Organisation& other) const;
};

struct RegKey{
  size_t id;
  QString value;
  Organisation organisation;
  int power;
  bool admin;
  bool operator==(const RegKey& other) const;
  bool operator!=(const RegKey& other) const;
};

struct Contract{
  size_t id;
  bool continuous;
  bool urgent;
  QString subject;
  QString pdf_path;
  int total_cost;
  QDate concludedOn;
  QDate expiresOn;
  Organisation contractor;
  Organisation customer;

  bool operator==(const Contract& other) const;
  bool operator!=(const Contract& other) const;
};

struct Manufacturer{
  size_t id;
  QString name;
  QString code;
  QString country;
  QString description;
  int rating;
  bool operator==(const Manufacturer& other) const;
  bool operator!=(const Manufacturer& other) const;
};

struct Component{
  size_t id;
  QString name;
  QString description;
  QString serialNumber;
  QDate manufactureYear;
  QString pictureRoute;
  Manufacturer manufacturer;

  bool operator==(const Component& other) const;
  bool operator!=(const Component& other) const;
};

struct Facility{
  size_t id;
  QString name;
  QString description;
  QString serialNumber;
  QDate manufactureYear;
  QString pictureRoute;
  Manufacturer manufacturer;

  bool operator==(const Facility& other) const;
  bool operator!=(const Facility& other) const;
};

#endif
