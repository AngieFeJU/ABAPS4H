@AbapCatalog.sqlViewName: 'ZCDS_11_100445'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Join'
define view zcds_11_t100445
  with parameters
    pCurrency : s_currcode
  as select from spfli   as FlighPlan
    inner join   sflight as Flight on  FlighPlan.carrid = Flight.carrid
                                   and FlighPlan.connid = Flight.connid
{
  key FlighPlan.carrid    as Carrid,
  key Flight.connid       as Connid,
      FlighPlan.countryfr as CountryFrom,
      Flight.fldate       as FlightDate,
      FlighPlan.period    as Period

}
where
  Flight.currency = $parameters.pCurrency
//Siempre se ejecutara a nivel de BD de la F1 y F2 de acuerdo a la condicion. 
