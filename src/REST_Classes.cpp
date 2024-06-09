#include "REST_Classes.h"

bool User::operator==(const User &other) const
{
  return  firstName == other.firstName
          && middleName == other.middleName
          && lastName == other.lastName
          && email == other.email;
}

bool User::operator!=(const User &other) const
{
  return !(*this == other);
}

bool Organisation::operator==(const Organisation &other) const
{
  return  id == other.id
          && name == other.name
          && tid == other.tid
          && address == other.address
          && fax == other.fax
          && bankAccount == other.bankAccount
          && rcbic == other.rcbic
          && bankName == other.bankName
          && bankAddress == other.bankAddress
          && client == other.client;
}

bool Organisation::operator!=(const Organisation &other) const
{
  return !(*this == other);
}

bool RegKey::operator==(const RegKey &other) const
{
  return id == other.id
         && value == other.value
         && power == other.power
         && admin == other.admin
         && organisation == other.organisation;
}

bool RegKey::operator!=(const RegKey &other) const
{
  return !(*this == other);
}
