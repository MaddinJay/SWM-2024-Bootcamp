@AbapCatalog.sqlViewName: 'ZTL_SQL_JOIN2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AbapCatalog.buffering.status: #ACTIVE
@AbapCatalog.buffering.type: #GENERIC
@AbapCatalog.buffering.numberOfKeyFields: 1
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Übung JOIN2 Tea'
define view ZTL_CDS_JOIN2
  as select from    scarr
    left outer join spfli on spfli.carrid = scarr.carrid
{
      //Schlüssel von Tabelle SCARR und SPFLI definiert
  key scarr.carrid   as Carrid,
  key spfli.connid   as Connid,
      //SCARR Tabelle Felder
      scarr.carrname as Carrname,
      scarr.currcode as Currcode,
      //SPFLI Tabelle Felder
      spfli.cityfrom as CityFrom,
      spfli.cityto   as CityTo,
      
      @EndUserText: {

      label: 'Test',
      quickInfo: 'Nur zu Testzwecken'
      }
      'Test'         as Testfield
}
where
  scarr.currcode = 'EUR'
