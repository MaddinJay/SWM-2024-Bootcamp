/*
Das ist ein mehrzeiliger Kommentar.
*/
@AbapCatalog.sqlViewName: 'ZOB_AW_VW_SCARR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'erster CDS View'

@AbapCatalog.buffering.status: #ACTIVE  // Ein Puffer ist eine temporäre Speichermöglichkeit.
@AbapCatalog.buffering.type: #GENERIC
@AbapCatalog.buffering.numberOfKeyFields: 2

define view ZOB_AW_CDS_CARRIER
  with parameters
    p_currcode : s_currcode,
    p_text     : abap.char( 10 )
  as select from scarr
    inner join   spfli on scarr.carrid = spfli.carrid
{
  key scarr.carrid       as Carrid,
  key spfli.connid       as Connid,
      scarr.carrname     as Carrname,
      scarr.currcode     as Currcode,
      spfli.cityfrom     as Cityfrom,
      spfli.cityto       as Cityto,
      @EndUserText:{
      label: 'Das ist ein Test',
      quickInfo: 'Nur zu Testzwecken'
      }
      'Das ist ein Test' as Testfield, // Inhalt der neuen Spalte
      
      $parameters.p_text as Textfeld // Inhalt der neuen Spalte
}
where
  scarr.currcode = $parameters.p_currcode // Das ist ein einzeiliger Kommentar.
