#include "AppState.h"
#include <QDebug>
#include <QTime>


QString AppState::popSectionTitle()
{
  return _sectionTitles.pop();
}

QString AppState::getCurrentTimeString()
{
  QTime currentTime = QTime::currentTime();
  return currentTime.toString("hh:mm:ss");
}

QString AppState::getPrompt()
{
  return "Frius " + getCurrentTimeString() + ": ";
}

AppState::AppState(QObject *parent)
    : _sectionTitles {}
{
  healthCheck();
}

bool AppState::healthCheck()
{
  qDebug() << getPrompt() << "App health check finished correctly.";
  return true;
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

