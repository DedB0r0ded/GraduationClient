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

bool Contract::operator==(const Contract &other) const
{
  return  id == other.id
          && continuous == other.continuous
          && urgent == other.urgent
          && subject == other.subject
          && total_cost == other.total_cost
          && concludedOn == other.concludedOn
          && expiresOn == other.expiresOn
          && contractor == other.contractor
          && customer == other.customer;
}

bool Contract::operator!=(const Contract &other) const
{
  return !(*this == other);
}

bool Manufacturer::operator==(const Manufacturer &other) const
{
  return  id == other.id
          && rating == other.rating
          && code == other.code
          && name == other.name
          && country == other.country
          && description == other.description;
}

bool Manufacturer::operator!=(const Manufacturer &other) const
{
  return !(*this == other);
}

bool Component::operator==(const Component &other) const
{
  return  id == other.id
          && manufactureYear == other.manufactureYear
          && name == other.name
          && serialNumber == other.serialNumber
          && manufacturer == other.manufacturer
          && description == other.description;
}

bool Component::operator!=(const Component &other) const
{
  return !(*this == other);
}

bool Facility::operator==(const Facility &other) const
{
  return  id == other.id
          && manufactureYear == other.manufactureYear
          && name == other.name
          && serialNumber == other.serialNumber
          && manufacturer == other.manufacturer
          && description == other.description;
}

bool Facility::operator!=(const Facility &other) const
{
  return !(*this == other);
}
