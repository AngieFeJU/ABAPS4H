@AbapCatalog.sqlViewName: 'ZCDS_17_100445'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Association base for Public'
@ObjectModel.representativeKey: 'AirportId'
define view zcds_17_t100445
  as select from sairport
{
  key id        as AirportId,
      name      as AirportName,
      time_zone as AirportTimeZone
}
