CLASS zcl_amdp_table_func DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_amdp_marker_hdb.
    CLASS-METHODS : get_travel FOR TABLE FUNCTION ZAJ_CDS_TABLE_FUNC.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_amdp_table_func IMPLEMENTATION.
  METHOD get_travel BY DATABASE FUNCTION
                    FOR HDB
                    LANGUAGE SQLSCRIPT
                    OPTIONS READ-ONLY
                    USING zi_travel_ay_m.

    RETURN SELECT '100' as client,  TravelId as travel_id
             FROM zi_travel_ay_m;


  ENDMETHOD.

ENDCLASS.
