#ifndef REST_CLASSES_H
#define REST_CLASSES_H

#include <QObject>

struct User{
  size_t id;
  QString firstName;
  QString middleName;
  QString lastName;
  QString email;
  QString password;
  bool operator==(const User& other);
  bool operator!=(const User& other);
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
  bool operator==(const Organisation& other);
  bool operator!=(const Organisation& other);
};

struct RegKey{
  size_t id;
  QString value;
  Organisation organisation;
  int power;
  bool admin;
  bool operator==(const RegKey& other);
  bool operator!=(const RegKey& other);
};

#endif
