@AbapCatalog.viewEnhancementCategory: [ #NONE ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo of Association'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType: { serviceQuality: #X, sizeCategory: #S, dataClass: #MIXED }

define view entity ZAJ_CDS_ASSOCIATION_DEMO
  as select from /dmo/travel as _Travel

  association [1..*] to /dmo/booking as _Booking on _Travel.travel_id = _Booking.travel_id

{
  key travel_id              as TravelId,

      _Booking.booking_id    as BookingID,
      agency_id              as AgencyId,
      customer_id            as CustomerId,
      _Booking.carrier_id    as CarrierID,
      _Booking.connection_id as ConnectionID,
      begin_date             as BeginDate,
      end_date               as EndDate,
      _Booking.booking_date  as BookingDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price            as TotalPrice,
      //      @c
      currency_code          as CurrencyCode,
      description            as Description,
      status                 as Status,
      createdby              as CreatedBy,

      _Booking
}
