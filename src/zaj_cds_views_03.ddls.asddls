@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cardinality of CDS View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZAJ_CDS_VIEWS_03
  as select from                 /dmo/travel  as t
    left outer to exact one join /dmo/booking as b on t.travel_id = b.travel_id --and b.booking_id is not initial
{
  key t.travel_id   as TravelID,
      t.description as Description,
      b.booking_id  as BookingID
}


/*
1:N left outer join :- It will create the join even we don't fetch the data from right table
N:1 left outer join :- It will not create the join if we don't fetch data from right table
*/

// When "to one join" is used ( Specifies the cardinality of a left outer join) :-
/*
    -> Select doesn't contain any fields from Right Table then optimization take place
    -> Aggregate funtion Count(*) is used then optimization take place
*/
