@AbapCatalog.sqlViewName: 'ZOB_VW_BV_ASSO2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Book Consumption'
define view ZOB_CDS_BV_ASSO_BOOK as select from Z_I_BUCHUNG
association [1] to I_Currency as _Currency
  on _Currency.Currency = Z_I_BUCHUNG.Forcurkeyy //Auf Interface beziehen
{
  key CarrierID,
  key ConnectionID,
  key FlightDate,
  key BookingID,
  CustomID,
  CustType,
  SmokerR,
  LuggWeight,
  Wunity,
  Invoicee,
  Classs,
  Forcuramm,
  Forcurkeyy,
  Loccuramm,
  Loccurkeyy,
  OrderDatee,
  Counterr,
  Agencynumm,
  Cancelledd,
  Reservedd,
  Passnamee,
  Passformm,
  Passbirthh,
  _Currency
}
