@AbapCatalog.sqlViewName: 'ZOB_VW_UH_SCARR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AbapCatalog.buffering.status: #ACTIVE    // Buffering => Zwischenspeichern von Daten
@AbapCatalog.buffering.type: #GENERIC
@AbapCatalog.buffering.numberOfKeyFields: 1
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Meine allererstes CDV View'
define view ZOB_CDS_UH_Carrier
  with parameters
    p_waehrung : s_currcode,
    p_text     : abap.char( 10 )

  as select from scarr
    inner join   spfli on spfli.carrid = scarr.carrid
{
  key scarr.carrid       as Carrid,
  key spfli.connid       as Coonid,
      scarr.carrname     as Carrname,
      scarr.currcode     as Currcode @<Semantics.currencyCode: true,
      spfli.cityfrom     as vonStadt,
      spfli.cityto       as nachStadt,
      @EndUserText:{
      label: 'Test',
      quickInfo: 'Nur zu Testzwecken'
      }
      $parameters.p_text as Testfield
}
where
  scarr.currcode = $parameters.p_waehrung

// Kommentar (siehe Java - /* über mehrere Zeilen */) 
