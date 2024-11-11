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
  as select from           /dmo/travel  as t
    left outer to one join /dmo/booking as _book on t.travel_id = _book.travel_id --and b.booking_id is not initial
{
  key t.travel_id   as TravelID,
      t.description as Description,
//      b.booking_id  as BookingID,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      sum( _book.flight_price ) as FlightPrice,
      _book.currency_code as CurrencyCode
//      _book
}
group by
  t.travel_id,
  t.description,
//  b.booking_id,
  _book.currency_code


/*
1:N left outer join :- It will create the join even we don't fetch the data from right table
N:1 left outer join :- It will not create the join if we don't fetch data from right table

LEFT OUTER TO ONE JOIN : Optimises the query which selects only data from Header table only when no fields is selected form Item Table 
( "TO ONE" is explicity defining the defining the system it has only 1 records with repectivie to header table in line item table )
LEFT OUTER TO MANY JOIN : It works as normal join duplicates data if there are multiple entries in item table 
( This is explictly defining system that it has multiple records for 1 entry in Header table to Line Item Table )

-> If requirement is to get data from Header and Item as 1:1 then it's not possible if and only if it satisfies above CDS view condition
Example : Here amoount is agrregated based on Curreny, travel id and description where 
1. currency is same for all the line item entries for 1 travel ID then it will give only unique records with no duplicates 
2. But if currency is not same for all the line item entries for 1 travel ID then 
it will create duplicate records with combition of TravelID, Description, Currency Code with Agrregated Value repective different Curreny Code
Sample 
TravelID Desciption CurrencyCode Amount
1        test1      USD          10
1        test1      INR          20


-> We can't expose a Table in Joins which can done with Association
*/


// When "to one join" is used ( Specifies the cardinality of a left outer join) :-
/*
    -> Select doesn't contain any fields from Right Table then optimization take place
    -> Aggregate funtion Count(*) is used then optimization take place
*/
