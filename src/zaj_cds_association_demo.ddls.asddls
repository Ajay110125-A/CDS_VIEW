@AbapCatalog.viewEnhancementCategory: [ #NONE ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo of Association'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType: { serviceQuality: #X, sizeCategory: #S, dataClass: #MIXED }

define view entity ZAJ_CDS_ASSOCIATION_DEMO
  as select from /dmo/travel as _Travel

  association [1..*] to /dmo/booking as _Booking on _Travel.travel_id = _Booking.travel_id --WE need to select travel ID because we are doing Association based on Travel ID
  --else WE won't be able to user _Booking Association because Associaton search happens based on the ON condition fields
  with default filter _Booking.flight_price > 500 --This default is activated only when user doesn't use any filter in Select query on CDS View Refer : ZCL_CDS_ASSO_IN_SELECT

{
  key travel_id     as TravelId,

      //      _Booking.booking_id    as BookingID,
      agency_id     as AgencyId,
      customer_id   as CustomerId,
      //      _Booking.carrier_id    as CarrierID,
      //      _Booking.connection_id as ConnectionID,
      begin_date    as BeginDate,
      end_date      as EndDate,
      //      _Booking.booking_date  as BookingDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price   as TotalPrice,
      //      @c
      currency_code as CurrencyCode,
      description   as Description,
      status        as Status,
      createdby     as CreatedBy,

      _Booking
}
/*
[1..*] -> [min..max] of target entity
Rules
1. max > min
2. If no cardinality defined then default will be [0..1] or [1..1] depends on the data available in target entity ([min..1])
3. If cardinality is given as [n] then [0..n]
Example :
[*] -> [0..*]
[1] -> [0..1]

***
*/
