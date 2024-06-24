#ifndef USER_STATE_H
#define USER_STATE_H

#include <QObject>
#include <QtQml>
#include <QDebug>

class UserState : public QObject{

private:
  Q_OBJECT


public:
  explicit UserState(QObject* parent = nullptr);

signals:

public slots:

private:
  bool _isDeveloper;

};


#endif
