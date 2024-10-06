@AbapCatalog.sqlViewName: 'ZAJ_DDLS_SAMPLE'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SQL View Sample'
//define view zcds_sample
//  as select
//    key travel_id,
//        description
//  from zay_travel_m;
@AbapCatalog: {
    buffering: {
        status: #SWITCHED_OFF,
        type: #NONE,
        numberOfKeyFields: 000
    },
    compiler: {
        compareFilter: true
    },
    dataMaintenance: #RESTRICTED
}
define view zcds_sample
  as select from zay_travel_m
{
  key travel_id,
      description,
      $session.client          as sys_client,
      $session.system_date     as sys_date,
      $session.system_language as sys_lang,
      $session.user            as user_id
}
