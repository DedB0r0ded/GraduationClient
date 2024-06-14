#include "AppState.h"
#include <QDebug>
#include <QTime>


QString AppState::popSectionTitle()
{
  return _sectionTitles.pop();
}

AppState::AppState(QObject *parent)
    : _sectionTitles {}
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

void AppState::defaultButtonEcho()
{
  qDebug() << getCurrentTimeString() << "Button pressed.";
}

void AppState::defaultIconButtonEcho()
{
  qDebug() << getCurrentTimeString() << "IconButton pressed.";
}

void AppState::setActiveSectionTitle(QString title)
{
  if(_sectionTitles.count() > 0)
    _sectionTitles.pop();
  _sectionTitles.push(title);
  emit activeSectionTitleChanged(title);
}

void AppState::pushActiveSectionTitle(QString title)
{
  _sectionTitles.push(title);
  emit activeSectionTitleChanged(title);
}

void AppState::popActiveSectionTitle()
{
  popSectionTitle();
  emit activeSectionTitleChanged(_sectionTitles.top());
}

