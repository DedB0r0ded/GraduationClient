#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickStyle>
#include <QIcon>
#include "src/AppState.h"

int main(int argc, char *argv[])
{
  QGuiApplication app(argc, argv);
  app.setOrganizationName("Example");
  app.setOrganizationDomain("example.com");
  app.setApplicationName("Frius");
  app.setApplicationVersion("0.0.1");

  qputenv("QSG_INFO", "1" );
  qputenv("QSG_RHI_BACKEND", "opengl");

  AppState state;

  QQmlApplicationEngine engine;
  engine.rootContext()->setContextProperty("AppState", &state);
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
