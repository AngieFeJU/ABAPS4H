@AbapCatalog.sqlViewName: 'ZCDS_08_100445'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Aggregations'
define view zcds_08_t100445
  as select from zcds_07_t100445
{
  key Field1,
      min(Field3)                     as FieldMin,
      max(Field3)                     as FieldMax,
      avg(Field3)                     as FieldAvg,
      cast( sum(Field3) as abap.int4) as FieldSum1,
      sum(Field3)                     as FieldSum2,
      count( distinct Field2)         as FieldCountDistinct,
      count(*)                        as FielCountAll
}
group by
  Field1
