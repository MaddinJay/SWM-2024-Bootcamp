@AbapCatalog.sqlViewName: 'ZFD_VW_AS_BUCH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Assoziations Consumption View Odata Buchung'
@VDM.viewType: #CONSUMPTION
define view ZFD_CDS_Asso_Buch_ODATA as select from Z_I_BUCHUNG
  association [1] to I_Currency as _Currency
  on $projection.Forcurkeyy = _Currency.Currency
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
