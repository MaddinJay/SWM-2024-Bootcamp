@AbapCatalog.sqlViewName: 'ZOB_VW_WURST'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'basic interface view der tabelle sbook'
@VDM.viewType: #BASIC
define view Z_I_BUHCHUNG as select from sbook
{
  key carrid as CarrierID,
  key connid as ConnectionID,
  key fldate as FlightDate,
  key bookid as BookingID,
  customid as CustomID,
  custtype as CustType,
  smoker as SmokerR,
  luggweight as LuggWeight,
  wunit as Wunity,
  invoice as Invoicee,
  class as Classs,
  forcuram as Forcuramm,
  forcurkey as Forcurkeyy,
  loccuram as Loccuramm,
  loccurkey as Loccurkeyy,
  order_date as OrderDatee,
  counter as Counterr,
  agencynum as Agencynumm,
  cancelled as Cancelledd,
  reserved as Reservedd,
  passname as Passnamee,
  passform as Passformm,
  passbirth as Passbirthh
}
