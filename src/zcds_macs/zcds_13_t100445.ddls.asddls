@AbapCatalog.sqlViewName: 'ZCDS_13_100445'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Text for Association'
@ObjectModel:{
  dataCategory: #TEXT,
  representativeKey: 'CountryKey'
}

define view zcds_13_t100445
  as select from t005t //Texto de Paise
{

  key land1   as CountryKey,
      @Semantics.language: true
  key spras   as Language,
      @Semantics.text: true
      @EndUserText.label: 'Country Name'
      landx50 as CountryName
}

//Se puede utilizar para la intercepcion de diferentes fuentes de datos,
//solo se ejecuta a nivel de BD si realmente se necesita algun elemento desde la projection
//Diferente al Join que siempre se ejecuta
