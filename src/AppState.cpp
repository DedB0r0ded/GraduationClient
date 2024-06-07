#include "AppState.h"
#include <QDebug>
#include <QTime>


AppState::AppState(QObject *parent)
    : _prevActiveSectionTitle {}, _activeSectionTitle {}
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

void AppState::buttonEcho()
{
  qDebug() << getCurrentTimeString() << "Button pressed.";
}

void AppState::setActiveSectionTitle(QString title)
{
  _prevActiveSectionTitle = _activeSectionTitle;
  _activeSectionTitle = title;
  emit activeSectionTitleChanged(title);
}

QString AppState::previousActiveSectionTitle()
{
  return _prevActiveSectionTitle;
}

