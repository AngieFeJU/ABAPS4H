@AbapCatalog.sqlViewName: 'ZCDS_18_100445'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Association Public'
define view zcds_18_t100445
  as select from spfli as Flight
  association [1] to zcds_17_t100445 as _AirportFrom on _AirportFrom.AirportId = Flight.airpfrom
{
  key carrid,
  key connid,
      countryfr,
      cityfrom,
      airpfrom,
      //Se proyecta la asociacion y se tiene una gran mejora en el rendimiento con esto 
      //Solo se ejecuta cuando se necesitan los datos
      _AirportFrom

}
