@AbapCatalog.sqlViewName: 'ZCDS_10_100445'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Amount Conversions'
define view zcds_10_t100445
  with parameters
    p_CurrencyConv : abap.cuky

  as select from sflight
{
  key carrid                                  as AirlineCode,
  key connid                                  as ConnectionNumber,
  key fldate                                  as FlightDate,
//      @Semantics.amount.currencyCode: 'Currency'
      price                                   as Price,
 //     @Semantics.currencyCode: true
      currency                                as Currency,
 //     @Semantics.amount.currencyCode: 'ConvertedCurrency'
      currency_conversion( amount              => price,
                           source_currency     => currency,
                           target_currency     => $parameters.p_CurrencyConv,
                             //target_currency => cast( 'EUR' as abap.cuky ) ,
                           exchange_rate_date  => fldate,
                           error_handling      => 'SET_TO_NULL' ) as PriceConverted,
      @Semantics.currencyCode: true
      $parameters.p_CurrencyConv              as ConvertedCurrency

}
where
  currency = 'USD';
