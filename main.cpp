#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickStyle>
#include <QIcon>
#include "src/AppWrapper.h"

int main(int argc, char *argv[])
{
  QGuiApplication app(argc, argv);
  QQuickStyle::setStyle("Fusion");

  qputenv("QSG_INFO", "1" );
  qputenv("QSG_RHI_BACKEND", "opengl");

  AppWrapper wrapper;
  if(!wrapper.init(&app)){
    return -1;
  }

  return app.exec();
}
