@AbapCatalog.sqlViewName: 'ZOB_VW_OD_ASOD4'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Buchungen OData'
@VDM.viewType: #CONSUMPTION
define view ZOB_CDS_OD_ASSO_BK_ODATA as select from Z_I_BUCHUNG
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
