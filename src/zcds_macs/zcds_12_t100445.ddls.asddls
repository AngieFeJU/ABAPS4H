@AbapCatalog.sqlViewName: 'ZCDS_12_100445'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Text'
//CDS con datos de Text Entre mas info se indique, ayuda al rendimiento 
@ObjectModel:
{ dataCategory: #TEXT,
  representativeKey: 'Unit'
}

define view zcds_12_t100445
  with parameters
    pLanguage : spras
  as select from t006a
{
      @Semantics.language: true
  key spras as Language,
  key msehi as Unit,
      mseh3 as CommercialFormat,
      mseh6 as TechnicalFormat,
      @Semantics.text: true
      @EndUserText.label: 'Unit of Measurement - Text'
      msehl as UnitText
}
where
  spras = $parameters.pLanguage
