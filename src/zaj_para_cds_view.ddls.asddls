@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Parameterized CDS VIew'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZAJ_PARA_CDS_VIEW
  with parameters
    // @Consumption.defaultValue: '000531' //This will not give a defualt value when used in select query you have to pass the value.
    // p_customer : /dmo/customer_id
    @Environment.systemField: #SYSTEM_DATE //For system fields passing values is optional
    p_date : /dmo/begin_date
  as select from /dmo/travel_m

{
  key travel_id      as TravelId,
      agency_id      as AgencyId,
      customer_id    as CustomerId,
      begin_date     as BeginDate,
      end_date       as EndDate,
      description    as Description,
      overall_status as OverallStatus
}
where
  begin_date = $parameters.p_date
//customer_id = $parameters.p_customer
