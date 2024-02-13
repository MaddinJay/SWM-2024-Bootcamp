@AbapCatalog.sqlViewName: 'ZOB_HUM_AGG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Übung Aggregation'
define view ZOB_CDS_HUM_AGGREGATES as select from sflight

{key carrid as Carrid,
 key connid as Connid,
 key fldate as Fldate,
count(*) as Flightcount,
avg( seatsocc ) as Averageseatsocc,
avg( seatsocc_b ) as AverageSeatbusi,
avg( seatsocc_f ) as Averageseatfirst,
seatsmax - seatsocc as seatsfree,
seatsmax_b - seatsocc_b as seatsfree_b,
seatsmax_f - seatsocc_f as seaatsfree_f
}

group by 
carrid,
connid,
fldate,
seatsmax,
seatsocc,
seatsmax_b,
seatsocc_b,
seatsmax_f,
seatsocc_f

