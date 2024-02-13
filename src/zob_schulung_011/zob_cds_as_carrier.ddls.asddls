@AbapCatalog.sqlViewName: 'ZOB_VW_AS_SCARR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Erster CDS View'
@AbapCatalog.buffering.status: #ACTIVE      //Puffering aktivieren
@AbapCatalog.buffering.type: #GENERIC       //Generisches Puffering einstellen
@AbapCatalog.buffering.numberOfKeyFields: 2

define view ZOB_CDS_AS_CARRIER
  with parameters
    p_currcode : s_currcode,
    p_txtfld   : abap.char(10)
  as select from    scarr
    left outer join spfli on scarr.carrid = spfli.carrid
{
  key scarr.carrid    as Carrid,
  key spfli.connid    as Connid,
      scarr.carrname  as Carrname,
      spfli.countryfr as Countryfr,
      spfli.cityfrom  as Cityfrom,
      spfli.airpfrom  as Airpfrom,
      spfli.countryto as Countryto,
      spfli.cityto    as Cityto,
      scarr.currcode  as currcode @<Semantics.currencyCode: true,
      @EndUserText: {
      label: 'Test',
      quickInfo: 'Nur zu Testzwecken'
      }
      $parameters.p_txtfld          as Testfield
}
where
  scarr.currcode = $parameters.p_currcode
  
