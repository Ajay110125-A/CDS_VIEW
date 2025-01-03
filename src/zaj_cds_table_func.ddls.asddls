@EndUserText.label: 'Table function creation demo'
//@ClientHandling.algorithm: #NONE
@ClientHandling.algorithm: #SESSION_VARIABLE
//@ClientHandling.type: #CLIENT_INDEPENDENT
@ClientHandling.type: #CLIENT_DEPENDENT
@AccessControl.authorizationCheck: #NOT_REQUIRED
define table function ZAJ_CDS_TABLE_FUNC
  with parameters
    p_customer : /dmo/customer_id   
//    @Environment.systemField: #CLIENT
//    client : abap.clnt

returns
{
  client    : abap.clnt;
  travel_id : /dmo/travel_id;

}
implemented by method
  zcl_amdp_table_func=>get_travel;