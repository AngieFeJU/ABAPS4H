@AbapCatalog.sqlViewName: 'ZCDS_05_100445'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Client Handeling'
//@ClientHandling: { 
//algorithm: #AUTOMATED, //Es el valor por defecto incluso si no se agrega la anotacion  
//algorithm: #SESSION_VARIABLE //El valor del mandante clic derecho Show SQL Statements
//type: #INHERITED //Cuando tenemos diferentes vistas, 
//}
@ClientHandling.algorithm: #SESSION_VARIABLE
define view zcds_05_t100445
  as select from scarr
{
  key carrid   as Carrid,
      carrname as Carrname,
      currcode as Currcode,
      url      as Url
}
