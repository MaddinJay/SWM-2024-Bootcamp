@AbapCatalog.sqlViewName: 'ZFD_VW_CRLST2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Umsatz aggr.'
@VDM.viewType: #COMPOSITE
define view ZFD_CDS_CARR_List2 as select from ZFD_CDS_CARR_List

{
  key CarrierID,
  key ConnectionID,
  key FlightDate,
      PriceInEuro,
      @Semantics.amount.currencyCode: 'CurrencyEuro'
      PriceInEuro * SeatsOccupiedEconomyClass as FlightAmount,
        @Semantics.currencyCode: true
      #S_CURR.'EUR' as CurrencyEuro,
      FlightPrice,
      LocalCurrencyAirline,
      PlaneType,
      SeatsMaxEconomyClass,
      SeatsOccupiedEconomyClass,
      PaymentSum,
      SeatsMaxBusinessClass,
      SeatsOccupiedBusinessClass,
      SeatsMaxFirstClass,
      SeatsOccupiedFirstClass
}
