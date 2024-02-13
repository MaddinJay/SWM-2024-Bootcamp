@AbapCatalog.sqlViewName: 'ZEM_VIEW_BOOK'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Währung'
define view ZEM_VIEW_SBOOK as select from sbook
//association [1] to I_Currency as _currency on $projection.Forcurkey = sbook.forcurkey



{key carrid as Carrid,
 key connid as Connid,
 key fldate as Fldate,
 key bookid as Bookid, 
 forcurkey as Forcurkey,
 loccurkey as Loccurkey
 //_currency

  
}
