@AbapCatalog.sqlViewName: 'ZEM_SQL_VIEW'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View für Übungen'
define view     ZEM_CDS_VIEW1

as 
select from     scustom

{

  substring(id, 7, 2)               as id,
  replace(city, 'dorf' , 'schlund') as adresse

}
where city <> ''
union

select from     sbook
{

  right(customid, 2 )               as id,
  cast( agencynum as abap.char(30)) as adresse

}
where sbook.customid <> '00000000' and agencynum <> '00000000'

union 

select from     scarr
{

  substring(carrid, 1, 2)             as id,
  concat_with_space( url, carrid, 1 ) as adresse

}
where carrid <> '00' 
