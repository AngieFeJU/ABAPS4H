@AbapCatalog.sqlViewName: 'ZCDS_24_100445'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'CDS Entity - Base for Hierarchy'
define view zcds_24_t100445
  as select from zempl_h_100445
  association [0..1] to zcds_24_t100445 as _Manager on $projection.Manager = _Manager.Employee 
{
  key employee as Employee,
      manager  as Manager,
      name     as Name,
      _Manager
}
