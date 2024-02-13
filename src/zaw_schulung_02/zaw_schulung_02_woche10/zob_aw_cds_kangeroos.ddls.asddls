@AbapCatalog.sqlViewName: 'Z_OB_CDS_AW_001'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Kangeroos'

define view ZOB_AW_CDS_KANGEROOS
  with parameters
    p_name : s_agncynam,
    @Environment.systemField: #SYSTEM_DATE
    p_date : s_date
  as select from sbook
    inner join   stravelag on sbook.agencynum = stravelag.agencynum
{
  key sbook.carrid                                            as Carrid,
  key sbook.connid                                            as Connid,
  key sbook.fldate                                            as Fldate,
  key sbook.bookid                                            as Bookid,
  key stravelag.agencynum                                     as Agencynum,
      substring(sbook.fldate, 5, 2)                           as flmonth,        // extrahiert ab der fünften Stelle 2 Zeichen (20240207 -> Monat Februar)
      sbook.customid                                          as Customid,
      sbook.custtype                                          as Custtype,
      sbook.luggweight                                        as Luggweight,
      sbook.wunit                                             as Wunit,
      sbook.passname                                          as Passname,
      length(sbook.passname)                                  as LaengePassname, // Zählt die Länge (Anzahl der Stellen).
      stravelag.name                                          as Name,
      replace(stravelag.name, 'Kangeroos', 'Kangoo AG')       as NewName,        // Ersetzt einen bestimmten Wert, auch einzelne Zeichen möglich.
      concat(stravelag.street,                                                   // Fügt die Werte mehrerer Spalten zu einer Spalte zusammen,
      concat_with_space(',',                                                     // getrennt durch Komma.
      concat_with_space(stravelag.postcode,
      concat(stravelag.city,
      concat_with_space(',', stravelag.country, 1)), 1 ), 1)) as Adresse, // 1 -> Leerzeichen
      stravelag.telephone                                     as Telephone,
      stravelag.url                                           as Url,
      stravelag.langu                                         as Langu,
      stravelag.currency                                      as Currency
}
where
      stravelag.name = $parameters.p_name
  and sbook.passname is not initial
  and sbook.fldate   = $parameters.p_date
