@AbapCatalog.sqlViewName: 'ZCDS_21_100445'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Path Expressions 1'
define view zcds_21_t100445
  as select from spfli
  //No es necesario agregar el mandt porque las asociaciones ya lo manejan dentro
  association [0..*] to sflight  as _Flight   on  _Flight.carrid = spfli.carrid
                                              and _Flight.connid = spfli.connid
  association [1..1] to sairport as _Airports on _Airports.id    = spfli.airpfrom
{
  key mandt,
  key carrid,
  key connid,
      spfli.airpfrom,
      _Flight,
      _Airports

}
