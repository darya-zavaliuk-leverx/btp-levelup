using {
  cuid,
  managed
} from '@sap/cds/common';

namespace sap.capire.incidents;

entity Comments : cuid, managed {
  incident : Association to Incidents;
  comment  : String;
}
