@AbapCatalog.sqlViewName: 'ZCDS_09_100445'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Quantity Conversions'
define view zcds_09_t100445
  with parameters
    p_ToUnit     : abap.unit( 3 ),
    p_UnitFilter : abap.unit( 3 )
  as select from spfli
{
  key connid,
  key carrid,
 //Probar esto en una view entity 
@Semantics.quantity.unitOfMeasure: 'OriginaUnit'
  distance                                                                        as OriginalValue,
  distid                                                                          as OriginaUnit,
  //  cast( 'KM' as abap.unit( 3 ))                                                   as KmUnit,
  cast( unit_conversion( quantity       => distance,
                         source_unit    => distid,
  //Forma anteior
                         target_unit    => :p_ToUnit,
  //                       target_unit    => cast( 'MI' as abap.unit( 3 ) ),
                         error_handling => 'SET_TO_NULL' ) as abap.dec( 10, 3 ) ) as ConvertedValue,

  $parameters.p_ToUnit                                                            as ConvertedUnit
}
where
  distid = $parameters.p_UnitFilter;
