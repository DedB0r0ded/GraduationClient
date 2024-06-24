#include "AppWrapper.h"
#include "src/GBase.h"
#include "src/Manufacturer.h"
#include "src/Component.h"
#include "src/Facility.h"
#include "src/Organisation.h"
#include "src/User.h"
#include "src/RegKey.h"

#include "src/AppState.h"
#include "src/UserState.h"

AppWrapper::AppWrapper(QObject *parent) : QObject(parent),
    _restManager(std::make_unique<QRestAccessManager>(&_networkManager)),
    _factory(std::make_unique<QNetworkRequestFactory>())
{
  _factory->setBaseUrl(QUrl("http://147.45.109.221:3001"));
}

AppWrapper::~AppWrapper(){

}

bool AppWrapper::fetchUser(QString email, QString password){
  auto rawObject = QVariantMap();
  rawObject.insert("email", email);
  rawObject.insert("password", password);
  auto object = QVariantMap();
  object.insert("user", rawObject);
  return true;
}

bool AppWrapper::init(QGuiApplication* app){
  app->setOrganizationName("FriusCorp");
  app->setOrganizationDomain("frius.app");
  app->setApplicationName("Frius");
  app->setApplicationVersion("0.0.1");

  AppState* appState = new AppState(app);
  UserState* userState = new UserState(app);

  qmlRegisterType<Manufacturer>(G_ENTITIES, 0, 2, "Manufacturer");
  qmlRegisterType<Component>(G_ENTITIES, 0, 2, "Component");
  qmlRegisterType<Facility>(G_ENTITIES, 0, 2, "Facility");
  qmlRegisterType<Organisation>(G_ENTITIES, 0, 2, "Organisation");
  qmlRegisterType<User>(G_ENTITIES, 0, 2, "User");
  qmlRegisterType<RegKey>(G_ENTITIES, 0, 3, "RegKey");

  qmlRegisterSingletonInstance(G_STATES, 0, 1, "AppState", appState);
  qmlRegisterSingletonInstance(G_STATES, 0, 1, "UserState", userState);
  qmlRegisterSingletonInstance(G_STATES, 0, 1, "AppWrapper", this);

  //_engine.rootContext()->setContextProperty("AppState", &state);
  _engine.addImportPath(":/");
  _engine.rootContext();
  QObject::connect(
      &_engine,
      &QQmlApplicationEngine::objectCreationFailed,
      app,
      []() { QCoreApplication::exit(-1); },
      Qt::QueuedConnection);
  _engine.loadFromModule("Frius", "Main");

  return !_engine.rootObjects().isEmpty();
}
