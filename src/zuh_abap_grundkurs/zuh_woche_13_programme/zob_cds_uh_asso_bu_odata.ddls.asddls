@AbapCatalog.sqlViewName: 'Z_UH_BU'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Übung ODATA'
define view ZOB_CDS_UH_ASSO_BU_ODATA as select from Z_I_BUCHUNG
association [1] to I_Currency as _Waehrung on Z_I_BUCHUNG.Loccurkeyy = _Waehrung.Currency

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
  _Waehrung
}
