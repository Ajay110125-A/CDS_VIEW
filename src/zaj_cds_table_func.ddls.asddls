@EndUserText.label: 'Table function creation demo'
@ClientHandling.algorithm: #SESSION_VARIABLE
@ClientHandling.type: #CLIENT_DEPENDENT
define table function ZAJ_CDS_TABLE_FUNC
//  with parameters
    //    @Environment.systemField: #CLIENT
//    p_travel_id : /dmo/travel_id

returns
{
  client    : abap.clnt;
  travel_id : /dmo/travel_id;

}
implemented by method
  zcl_amdp_table_func=>get_travel;