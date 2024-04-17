@AbapCatalog.sqlViewName: 'ZCDS_01_100445'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true //Indica la posibilidad de agregar mas columnas que forman la clave, se debe tomar en cuenta la definicion de la vista y no la de la BD
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View CDS'
define view zcds_01_t100445
  as select from zproducts_100445
{
  key product            as Product,
      product_type       as ProductType,
      creation_date_time as CreationDateTime
}
