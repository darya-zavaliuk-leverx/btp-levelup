using {
  cuid,
  managed
} from '@sap/cds/common';

namespace sap.capire.incidents;

/**
 * Incidents created by Customers.
 */
entity Incidents : cuid, managed {
  customer     : Association to Customers;
  title        : String @title: 'Title';
  urgency      : Association to Urgency default 'M';
  status       : Association to Status default 'N';
  conversation : Composition of many {
                   key ID        : UUID;
                       timestamp : type of managed : createdAt;
                       author    : type of managed : createdBy;
                       message   : String;
                 };
  comments     : Association to many Comments
                   on comments.incident = $self;
}
