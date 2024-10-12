@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Define View Entity'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

//@ClientHandling: {
//    type: #INHERITED,
//    algorithm: #AUTOMATED
//}
define view entity ZAJ_SAMPLE_02
  as select from zay_travel_m  as t
    inner join   zay_booking_m as b on t.travel_id = b.travel_id
{
  key t.travel_id     as TravelID,
      t.description   as Description,
      b.booking_id    as BookingID,
      b.customer_id   as CustomerID,
      b.carrier_id    as CarrierID,
      b.connection_id as ConnectionID,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      t.total_price   as TotalPrice,
      t.currency_code as CurrencyCode

}
//where t.travel_id = '00000022'
