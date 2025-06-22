using {
  cuid,
  managed
} from '@sap/cds/common';

namespace sap.capire.incidents;

/**
 * Customers entitled to create support Incidents.
 */
entity Customers : managed {
  key ID           : String;
      firstName    : String;
      lastName     : String;
      name         : String = firstName || ' ' || lastName;
      email        : EMailAddress;
      phone        : PhoneNumber;
      incidents    : Association to many Incidents
                       on incidents.customer = $self;
      creditCardNo : String(16) @assert.format: '^[1-9]\\d{15}$';
      addresses    : Composition of many Addresses
                       on addresses.customer = $self;
}

entity Addresses : cuid, managed {
  customer      : Association to Customers;
  city          : String;
  postCode      : String;
  streetAddress : String;
}
