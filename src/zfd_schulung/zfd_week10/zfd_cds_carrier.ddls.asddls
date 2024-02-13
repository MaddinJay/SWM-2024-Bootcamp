@AbapCatalog.sqlViewName: 'ZFD_VW_SCARR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AbapCatalog.buffering: {
status: #ACTIVE, // buffering Sinnvoll: damit die Abfrage im Speicher der DB für eine Zeit gehalten wird.
type: #GENERIC,
numberOfKeyFields: 2
}
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Übung CDS View mit Erweiterung Join 2'
define view ZFD_CDS_CARRIER
  with parameters
    p_curr : s_currcode,
    p_text : abap.char( 10 )

  as select from    scarr
    left outer join spfli on scarr.carrid = spfli.carrid
{
  key scarr.carrid       as Carrid,
  key spfli.connid,
      scarr.carrname     as Carrname,
      scarr.currcode     as Currcode @<Semantics.currencyCode: true,
      scarr.url          as url,
      spfli.cityfrom,
      spfli.cityto,
      @EndUserText:{
                    label: 'Test',
                    quickInfo: 'Nur zu Testzwecken'
                   }
      $parameters.p_text as Textfield
}
where
  scarr.currcode = $parameters.p_curr /* Kommentar*/
