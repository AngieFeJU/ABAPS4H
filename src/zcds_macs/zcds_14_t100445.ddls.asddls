@AbapCatalog.sqlViewName: 'ZCDS_14_100445'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Association'
define view zcds_14_t100445
  with parameters
    pAirline  : s_carr_id,
    planguage : spras
  as select from spfli as Flight
  //Se puede indicar la cardinalidad si no la inicamos se asigna 1
  //association [1] to zcds_13_t100445 as _CountryNameFrom on _CountryNameFrom.CountryKey
  //Es posible utilizar detalle o elementos de la projection $projection
  association [1] to zcds_13_t100445 as _CountryNameFrom on  $projection.CountryKeyFrom = _CountryNameFrom.CountryKey
                                                         and _CountryNameFrom.Language  = $parameters.planguage

  association [1] to zcds_13_t100445 as _CountryNameTo   on  $projection.CountryKeyto = _CountryNameTo.CountryKey
                                                         and _CountryNameTo.Language  = $parameters.planguage
{
  key Flight.carrid                as AirlineCode,
  key Flight.connid                as FlightConnection,
      Flight.cityfrom              as CityFrom,
      Flight.countryfr             as CountryKeyFrom,
      _CountryNameFrom.CountryName as CountryNameFrom,
      Flight.cityto                as CityTo,
      Flight.countryto             as CountryKeyto,
      _CountryNameTo.CountryName   as CountryNameTo

}
where
  Flight.carrid = $parameters.pAirline
