#ifndef USER_STATE_H
#define USER_STATE_H

#include <QObject>
#include <QtQml>
#include <QDebug>

#include "REST_Classes.h"


class UserState : public QObject{

private:
  Q_OBJECT
  //QML_SINGLETON
  //QML_ELEMENT

  Q_PROPERTY(bool isDeveloper READ isDeveloper WRITE setIsDeveloper NOTIFY isDeveloperChanged FINAL)
  Q_PROPERTY(User user READ user WRITE setUser NOTIFY userChanged FINAL)
  Q_PROPERTY(QList<RegKey> regKeys READ regKeys WRITE setRegKeys NOTIFY regKeysChanged FINAL)

public:
  explicit UserState(QObject* parent = nullptr);

  bool isDeveloper() const;
  void setIsDeveloper(bool newIsDeveloper);

  User user() const;
  void setUser(const User &newUser);

  QList<RegKey> regKeys() const;
  void setRegKeys(const QList<RegKey> &newRegKeys);

signals:

  void isDeveloperChanged();

  void userChanged();

  void regKeysChanged();

public slots:
  QList<Organisation> getOrganisations(void);
  Organisation getOrganisation(size_t);

private:
  bool _isDeveloper;
  User _user;
  QList<RegKey> _regKeys;

  QList<Organisation> organisations(void);
};


#endif
