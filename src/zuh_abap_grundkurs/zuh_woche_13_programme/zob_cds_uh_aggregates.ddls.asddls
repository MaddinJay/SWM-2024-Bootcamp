@AbapCatalog.sqlViewName: 'ZOB_VW_UH_AGGR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Übung Aggregation'
define view ZOB_CDS_UH_AGGREGATES
  as select from sflight
{
  key carrid          as Carrid,
  key connid          as Connid,
  // es werden die Flüge gezählt wo carrid und Connid gleich ist
      count(*)        as FlightCount,
  // es wird die druchschnittliche Sitzauslastung berechnet
      avg( seatsocc as abap.dec( 20,2) ) as AverageSeatsOCC   // Wert wird auf 2 nachkommastellen gerundet
}
group by
  carrid,
  connid
