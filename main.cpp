#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickStyle>
#include <QIcon>

#include "src/GBase.h"
#include "src/Manufacturer.h"
#include "src/Component.h"
#include "src/Facility.h"
#include "src/Organisation.h"
#include "src/User.h"
#include "src/RegKey.h"

#include "src/AppState.h"
#include "src/UserState.h"


int main(int argc, char *argv[])
{
  QGuiApplication app(argc, argv);
  app.setOrganizationName("FriusCorp");
  app.setOrganizationDomain("frius.app");
  app.setApplicationName("Frius");
  app.setApplicationVersion("0.0.1");

  qputenv("QSG_INFO", "1" );
  qputenv("QSG_RHI_BACKEND", "opengl");

  AppState* appState = new AppState(&app);
  UserState* userState = new UserState(&app);

  qmlRegisterType<Manufacturer>(G_ENTITIES, 0, 2, "Manufacturer");
  qmlRegisterType<Component>(G_ENTITIES, 0, 2, "Component");
  qmlRegisterType<Facility>(G_ENTITIES, 0, 2, "Facility");
  qmlRegisterType<Organisation>(G_ENTITIES, 0, 2, "Organisation");
  qmlRegisterType<User>(G_ENTITIES, 0, 2, "User");
  qmlRegisterType<RegKey>(G_ENTITIES, 0, 3, "RegKey");

  qmlRegisterSingletonInstance(G_STATES, 0, 1, "AppState", appState);
  qmlRegisterSingletonInstance(G_STATES, 0, 1, "UserState", userState);

  QQmlApplicationEngine engine;
  //engine.rootContext()->setContextProperty("AppState", &state);
  engine.addImportPath(":/");
  QQuickStyle::setStyle("Fusion");
  QObject::connect(
    &engine,
    &QQmlApplicationEngine::objectCreationFailed,
    &app,
    []() { QCoreApplication::exit(-1); },
    Qt::QueuedConnection);
  engine.loadFromModule("Frius", "Main");

  return app.exec();
}
