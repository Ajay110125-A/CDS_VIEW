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
  with parameters
    p_travel : /dmo/travel_id,
    @Environment.systemField: #SYSTEM_DATE //This annotation helps us to give default values to p_date. This can be done for few fields which are there in that annotation
    p_date   : abap.dats                   //And also it helps to make the patameter not mandatory
  as select from zay_travel_m  as t
    inner join   zay_booking_m as b on t.travel_id = b.travel_id
{
  key t.travel_id        as TravelID,
      t.description      as Description,
      b.booking_id       as BookingID,
      b.customer_id      as CustomerID,
      b.carrier_id       as CarrierID,
      b.connection_id    as ConnectionID,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      t.total_price      as TotalPrice,
      t.currency_code    as CurrencyCode,
      $parameters.p_date as syst_date

}
where
  t.travel_id = $parameters.p_travel

//Parameters are optional only when default values are assigned. We can only use system fields such as #SYSTEM_DATE. Possible values are
//Check this CDS View for default values handling DEMO_CDS_SYSTEM_FIELDS_VE
