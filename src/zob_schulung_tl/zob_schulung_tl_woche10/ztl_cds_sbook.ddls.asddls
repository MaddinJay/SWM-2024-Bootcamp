@AbapCatalog.sqlViewName: 'ZTL_SQL_ASSO2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View'
define view ZTL_CDS_SBOOK as select from Z_I_BUCHUNG
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
  Passbirthh
}
