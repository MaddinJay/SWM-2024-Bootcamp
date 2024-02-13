@AbapCatalog.sqlViewName: 'Z_AW_VW_AGGR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Übung Aggregration'
define view ZOB_AW_CDS_AGGREGATION
  as select from sflight
{
  key carrid                                                                        as Carrid,
  key connid                                                                        as Connid,
  key fldate                                                                        as Flugdatum,
      count(*)                                                                      as Fluganzahl,
      avg(seatsocc)                                                                 as Durchschnitt,
      avg(seatsocc as abap.dec( 20, 0 ))                                            as Durchschnitt_bereinigt,
      // Arithmetische Operatoren
      seatsmax - seatsocc                                                           as frei_Eco,
      seatsmax_b - seatsocc_b                                                       as frei_Bus,
      seatsmax_f - seatsocc_f                                                       as frei_First,
      (seatsmax - seatsocc) + (seatsmax_b - seatsocc_b) + (seatsmax_f - seatsocc_f) as frei_gesamt
}
group by
  carrid,
  connid,
  fldate,
  seatsmax,
  seatsmax_b,
  seatsmax_f,
  seatsocc,
  seatsocc_b,
  seatsocc_f


//  Erstellen Sie eine neue View, die pro Fluggesellschaft und Flugverbindung die Anzahl der Flüge sowie die durchschnittliche
//  Sitzplatzbelegung ausgibt.
//  Erstellen Sie eine neue View, die pro Flug die Anzahl der freien Sitzplätze ausgibt.
