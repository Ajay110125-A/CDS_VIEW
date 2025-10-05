@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Inner Join achieving with assocation'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZK_INNER_JOIN_ASSO
  as select from /dmo/travel_m as _Travel
  ////    inner join   /dmo/booking_m as _Booking on _Travel.travel_id = _Booking.travel_id
  association [0..*] to /dmo/booking_m as _Booking on  _Travel.travel_id  = _Booking.travel_id
//                                                and _Booking.travel_id is null
  //  as select from    /dmo/travel_m  as _Travel
  //    left outer join /dmo/booking_m as _Booking on _Travel.travel_id = _Booking.travel_id
  //                                               and _Booking.travel_id is null
{
  key _Travel.travel_id   as TravelId,
      _Booking.booking_id as BookingId,
      _Travel.agency_id   as AgencyId,
      _Travel.customer_id as CustomerId,

      //    _association_name // Make association public
      _Booking
}
//where
//  _Travel.travel_id = '00004148'
//group by
//  _Travel.travel_id,
//  _Travel.agency_id,
//  _Travel.customer_id
