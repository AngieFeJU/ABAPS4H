@AbapCatalog.sqlViewName: 'ZCDS_04_100445'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Variables de Sesion'
define view zcds_04_t100445
  as select from t000
{
  key mandt as Mandt,
  $session.client          as Client,
  $session.system_date     as SystemDate,
  $session.system_language as SystemLanguage,
  $session.user            as UserField,
  $session.user_date       as UserDate,
  $session.user_timezone   as UserTimeZone


}
