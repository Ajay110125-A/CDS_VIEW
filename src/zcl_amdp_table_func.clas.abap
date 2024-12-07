CLASS zcl_amdp_table_func DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_amdp_marker_hdb.
    CLASS-METHODS : get_travel FOR TABLE FUNCTION zaj_cds_table_func.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_amdp_table_func IMPLEMENTATION.

  METHOD get_travel BY DATABASE FUNCTION
                    FOR HDB
                    LANGUAGE SQLSCRIPT
                    OPTIONS READ-ONLY
                    USING zi_travel_ay_m.

    it_travel =  select '100' as client,  travelid as travel_id
                 FROM zi_travel_ay_m
                 WHERE customerid = p_customer ;

    RETURN :it_travel;

  ENDMETHOD.

ENDCLASS.
