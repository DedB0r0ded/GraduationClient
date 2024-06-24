#ifndef REST_WRAPPER_H
#define REST_WRAPPER_H

#include <QObject>
#include <QtQml>
#include <QDebug>
#include <QGuiApplication>


class AppWrapper : public QObject{
  Q_OBJECT

public:
  explicit AppWrapper(QObject* parent = nullptr);
  ~AppWrapper();
  bool init(QGuiApplication* app);

public slots:
  bool fetchUser(QString email, QString password);
  //void createUser();

private:
  QNetworkAccessManager _networkManager;
  std::unique_ptr<QNetworkRequestFactory> _factory;
  std::unique_ptr<QRestAccessManager> _restManager;
  QQmlApplicationEngine _engine;
};


#endif
