@AbapCatalog.sqlViewName: 'ZCDS_06_100445'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Union 1'
define view zcds_06_t100445
  as select from zint_products
{
  key product_id  as ProductId,
      description as Description
}
union select from zext_products
{
  key id   as ProductId,
      name as Description
}
//Consideraciones entre uniones 
//El número de datos que se proyectan deben ser los mismos en las diferentes uniones 
//Para cada elemento el tipo de daato debe coincidir 
//Todo los elementos deben de coincidir con el nombre 

//La sentencia union funciona como un distinc si queremos traer todos es necesario poner all
