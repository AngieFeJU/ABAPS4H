@AbapCatalog.sqlViewName: 'ZCDS_22_100445'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Path Expressions 2'
define view zcds_22_t100445
  as select from scarr
  association [*] to zcds_21_t100445 as _Flights on _Flights.carrid = scarr.carrid
{
  key scarr.carrid,
      scarr.carrname,
      _Flights

}
