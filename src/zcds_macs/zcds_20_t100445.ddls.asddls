@AbapCatalog.sqlViewName: 'ZCDS_20_100445'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Explicit Join'
define view zcds_20_t100445
  as select from spfli
  association to scarr as _Scarr on spfli.carrid = _Scarr.carrid
{
  key spfli.carrid           as CarrId,
  key spfli.connid           as ConnId,
      //Se hace en las asociaciones donde proyectamos los elemento se usa como un Inner y no como un Left
      _Scarr[inner].carrname as CarrName,
      spfli.cityfrom         as Departure,
      spfli.cityto           as Arrival,
      _Scarr[inner].currcode        as CurrencyCode
}
//De manera predeterminada las asociaciones definidas en las vistas CDS se ejecutan como uniones externas
//Se cambia las reglas con un join explicito
//Sin hacer la idicacion se usa LEFT OUTER MANY TO ONE JOIN  usando la instruccion se usa el explicito
//  Agregar un Inner a la sentencia SQL Al agregarlos a todas las proyecciones de la asociacion se cambia totalmente la sentencia por el Inner para todo
