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


public:
  explicit UserState(QObject* parent = nullptr);

signals:


public slots:


private:
  bool _isDeveloper;


};


#endif
