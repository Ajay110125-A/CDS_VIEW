@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Path Expression Sample DEMO'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZAJ_ASSO_PATH_EXPRESSION
  as select from /dmo/travel as _Travel
  association [1..*] to /dmo/booking     as _Booking  on _Travel.travel_id = _Booking.travel_id
  association [1..1] to /dmo/customer    as _Customer on _Travel.customer_id = _Customer.customer_id
  association [1..1] to /dmo/carrier     as _Carrier  on $projection.CarrierID = _Carrier.carrier_id
  association [1..*] to /dmo/trvl_stat_t as _Status   on _Travel.status = _Status.travel_status
{
  key _Travel.travel_id          as TravelID,

      _Booking.booking_id        as BookingID,

      _Travel.customer_id        as CustomerID,
      _Travel.status             as Status,

      _Booking.carrier_id        as CarrierID,

      _Customer[inner].last_name as LastName,  --[inner] helps us to get only the data where there is customer info is available. This way we can do inner join on table 
      //      _Status[language = $session.system_language ].text as StatusText,
//            _Carrier.name                                      as CarrierName,

      _Customer,
      _Carrier,
      _Status,
      _Booking

}

/*

  Path Expression :
  ******************
  ---- source._assoc1[parameters/properties]._assoc2.field

  souce : CDS View Name
  _assoc1 : Assocation 1
  Parameters : Parameter of that Associaion
  Properties : Like [inner]
  Field : Table fields


  ****
  IMP : Here we cannot user _Carrier.name because the association formed based on $projection
        means association forms after data retrival happens for this CDS View. To solve this issue we can use this CDS View in another another CDS View
        to get the _Carrier.name

  IF we expose the _Carrier then we can view the data because this Association is happended after retrival of the CDS View data
*/
