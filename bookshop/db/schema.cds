namespace my.bookshop;

using { Currency, managed } from '@sap/cds/common';

entity Books : managed {
  key ID : Integer;
  title  : String(111);
  descr  : String(1111);
  author : Association to Authors;
  stock  : Integer;
  price  : Decimal(9,2);
  currency : Currency;
}

entity Authors : managed {
  key ID : Integer;
  name   : String(111);
}
