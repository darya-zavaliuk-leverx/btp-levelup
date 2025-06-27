using {sap.capire.incidents as my} from '../db/schema';

service ItemsService {
  entity Items as projection on my.Items;
  function getItemsByQuantity(quantity : Integer) returns many Items;
  action createItem(title : String, descr : String, quantity : Integer) returns Items;
}
