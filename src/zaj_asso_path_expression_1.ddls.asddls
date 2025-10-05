@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consume View  ZAJ_ASSO_PATH_EXPRESSION'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZAJ_ASSO_PATH_EXPRESSION_1
  as select from ZAJ_ASSO_PATH_EXPRESSION
{
  key TravelID,
      BookingID,
      CustomerID,
      Status,
      CarrierID,
      LastName,
      /* Associations */
      _Booking,
      _Carrier,
      _Customer,
//            _Status[ inner where language = $session.system_language or language = 'G' ].text as StatusText
      _Status[ 1:language = $session.system_language or language = 'G' ].text as StatusText --To remove the cardinality warning we can give 1:(filter condition) forms to ONE relation.
      --Values : 1 or *. IF * is used then cardinality warning appears
}

/*

  We can do inner join using path expression with addition where condition (filter condition)

*/

/*
SQL Path Expressions
1. A path expression of the CDS DDL is a sequence of CDS Assocation
2. Seperated by periods(.)
Example : source._assoc1[p1,p2]._assoc2[attribute].field

When a CDs entity with path expression is accessed the follwing evaluation occurs
1. The joins defiened by the CDS association, from left to right
2. All other conditions of the CDS entities involved.

***The most simple path expression is the name of a single association. 
-> IF we get multiple fields from same assocations the joins depends on each fields


Attribute:-

* Cardinality [1:filter condition / Join]
    ->The addition 1: or *: cannot be specified as the only condition in sqaure brackets
    It must always be combined with filter condition
    The addition 1: prevents a syntax error if a pathe specified with filter condition

* Join type implemeted when used
    INNER determines an inner join
    LEFT OUTER determines left outer join
    
*Filter condition
   IF the type us explicitly defiened with [ INNER|LEFT OUTER ]
   then addition WHERE must be specified explicitly

*/
