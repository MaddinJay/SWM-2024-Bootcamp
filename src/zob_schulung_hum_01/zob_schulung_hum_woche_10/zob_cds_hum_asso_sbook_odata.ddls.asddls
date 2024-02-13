@AbapCatalog.sqlViewName: 'ZOB_HUMM_SBOOK'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Übung'
@VDM.viewType: #CONSUMPTION
define view ZOB_CDS_HUM_ASSO_SBOOK_ODATA as select from Z_I_BUCHUNG
{key CarrierID,
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
