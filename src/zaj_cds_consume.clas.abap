CLASS zaj_cds_consume DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zaj_cds_consume IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA(l_travel_id) = CONV /dmo/travel_id( '22' ).

    SELECT
        FROM zaj_sample_02( p_travel = @l_travel_id )
        FIELDS * "TravelID, BookingID, CustomerID
        INTO TABLE @DATA(li_sample).

*    IF sy-subrc EQ 0.
*
*        out->write(
*          EXPORTING
*            data   = li_sample
**            name   =
**          RECEIVING
**            output =
*        ).

*    ENDIF.
    DATA : l_date TYPE  /dmo/begin_date .
    l_date = cl_abap_context_info=>get_system_date(  ).

    SELECT
      FROM zaj_para_cds_view( p_date = '20250806' )
      FIELDS *
      INTO TABLE @DATA(li_data).
*    cl_abap_dbfe

  ENDMETHOD.
ENDCLASS.
