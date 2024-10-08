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
  as select from zay_travel_m
{
  key travel_id   as TravelID,
      description as Description

}
