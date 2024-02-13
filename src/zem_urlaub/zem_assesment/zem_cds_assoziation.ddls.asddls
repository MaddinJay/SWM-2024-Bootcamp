@AbapCatalog.sqlViewName: 'ZEM_SQL_ASSO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Assoziationen'
define view ZEM_CDS_Assoziation as select from spfli 
association [0..1] to scarr as _scarr on spfli.carrid = _scarr.carrid 
association [0..*] to sflight as _sflight on spfli.carrid = _sflight.carrid
and $projection.fldate = _sflight.fldate


{

key spfli.carrid as Carrid,
 key spfli.connid as Connid,
 
 _scarr,
 _sflight,
 _sflight.fldate

}
