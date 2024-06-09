#include "UserState.h"

UserState::UserState(QObject *parent)
    : QObject{parent}
{  }

bool UserState::isDeveloper() const
{
  return _isDeveloper;
}

void UserState::setIsDeveloper(bool newIsDeveloper)
{
  if (_isDeveloper == newIsDeveloper)
    return;
  _isDeveloper = newIsDeveloper;
  emit isDeveloperChanged();
}

User UserState::user() const
{
  return _user;
}

void UserState::setUser(const User &newUser)
{
  if (_user.firstName == newUser.firstName
      && _user.middleName == newUser.middleName
      && _user.lastName == newUser.lastName
      && _user.email == newUser.email)
    return;
  _user = newUser;
  emit userChanged();
}

QList<RegKey> UserState::regKeys() const
{
  return _regKeys;
}

void UserState::setRegKeys(const QList<RegKey> &newRegKeys)
{
  if(newRegKeys.size() == _regKeys.size()){
    for(size_t i = 0; i < _regKeys.size(); i++)
      if(newRegKeys[i] != _regKeys[i]){

      }
  }

  emit regKeysChanged();
}
