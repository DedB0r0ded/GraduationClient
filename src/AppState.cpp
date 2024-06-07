#include "AppState.h"
#include <QDebug>
#include <QTime>


AppState::AppState(QObject *parent)
{

}

bool AppState::healthCheck()
{
  qDebug() << getCurrentTimeString() << "AppStatehealthCheck() finished correctly.";
  return true;
}

QString AppState::getCurrentTimeString()
{
  QTime currentTime = QTime::currentTime();
  return currentTime.toString("hh:mm:ss");
}

void AppState::becho()
{
  qDebug() << getCurrentTimeString() << "Button pressed.";
}

