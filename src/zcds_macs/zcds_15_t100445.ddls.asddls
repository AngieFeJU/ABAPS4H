@AbapCatalog.sqlViewName: 'ZCDS_15_100445'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Association Base For Param'
define view zcds_15_t100445
  with parameters
    pAirCode : s_carr_id
  as select from scarr as Airline
{
  key carrid   as Carrid,
      carrname as Carrname,
      @Semantics.currencyCode: true
      currcode as Currcode,
      @Semantics.url.mimeType: 'Url'
      url      as Url
}
where
  Airline.carrid = $parameters.pAirCode
