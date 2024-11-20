@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Association using Inner Join'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZAJ_ASSO_INNER_JOIN
  as select from ZAJ_CDS_ASSOCIATION_DEMO --._Booking ( For 1. Inner join )
{
          key TravelId,
          AgencyId,
      //    CustomerId,
          _Booking[1:inner].booking_id,
//          _Booking[ booking_id =  booking_id ].carrier_id  ----We can also give conditions for Association
      //    BeginDate,
      //    EndDate,
      //    TotalPrice,
      //    CurrencyCode,
      //    Description,
      //    Status,
      //    CreatedBy,
      /* Associations */
          _Booking

--Inner join With Association _Booking
//  key travel_id,
//  key booking_id
}


/*
Inner Joins Formation
1. Inner Joins will form when we directly access Assocations at select query where only Association _Booking fields will get called
2. By giving [inner] to Assiciation 
*/
