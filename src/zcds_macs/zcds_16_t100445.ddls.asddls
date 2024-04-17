@AbapCatalog.sqlViewName: 'ZCDS_16_100445'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Association with Parameters'
define view zcds_16_t100445
  with parameters
    pAir1Code : s_carr_id
  as select from sflight as Flight

  association [1] to zcds_15_t100445 as _Airline on _Airline.Carrid = Flight.carrid
{
  key Flight.carrid,
  key Flight.connid,
  key Flight.fldate,
  @Semantics.amount.currencyCode: 'Currcode'
      Flight.price,
      Flight.planetype,
      _Airline(pAirCode : $parameters.pAir1Code).Carrname,
      @Semantics.currencyCode: true
      _Airline(pAirCode : $parameters.pAir1Code).Currcode,
      @Semantics.url.mimeType: 'Url'
      _Airline(pAirCode : $parameters.pAir1Code).Url

}
where
  Flight.carrid = $parameters.pAir1Code
