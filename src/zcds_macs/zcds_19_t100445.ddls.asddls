@AbapCatalog.sqlViewName: 'ZCDS_19_100445'
//Al poner esta anotacion en False nos agrega un query con esto LEFT OUTER MANY TO ONE JOIN
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Association Filters'
define view zcds_19_t100445
  with parameters
    //Pasar el valor en tiempo de Ejecucuiion
    //Se puede agregar la anotacion antes o despues del parametro, si se agrega antes se debe poner el < Tambien se puede con las Semanticas
    //@Environment.systemField: #SYSTEM_LANGUAGE
    pLanguage : syst_langu @<Environment.systemField: #SYSTEM_LANGUAGE
  as select from scarr as CompanyCode
  //Asociacion con tabla
  //Cuando no se asigna Cardinalidad se considera [1] se puede poner solo [*]
  association [0..*]to tcurt as _Curency on _Curency.waers = CompanyCode.currcode
{
  key CompanyCode.carrid                            as Carrid,
      CompanyCode.carrname                          as CarrName,
      CompanyCode.currcode                          as CurrencyCode,
      $parameters.pLanguage                         as Language,
      //Se puede realizar el Filtros con los campos que tiene la asociacion
      //Se pueden ocupar los operadores logicos <>=
      // En este caso es diferente a la proyeccion que pide parametros de entrada se hace directamente a la asociacion de la tabla
      //Se puede agregar la cardinalidad para este registro  con 1: o *:
      _Curency[1:spras = $parameters.pLanguage].ktext as CurrencyName,
      _Curency[1:spras = $parameters.pLanguage].ktext as CurrencyName1
}
//Pide el Parametro y si lo ingresamos tomara el que mandemos, pero si no toma como lo declaramos el del sistema
