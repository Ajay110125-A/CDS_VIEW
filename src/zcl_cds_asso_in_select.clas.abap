CLASS zcl_cds_asso_in_select DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cds_asso_in_select IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    SELECT
*      FROM zaj_asso_inner_join"\_Booking[ (1) ] as Booking "This forms TO One Join
*      FIELDS TravelId, \_Booking[ (1) INNER  ]-booking_id AS BookingId, "WHERE flight_price > 500
*                       \_Booking[ (1) INNER  ]-flight_price AS FlightPrice "WHERE flight_price > 100
**     By keeping same where condition on both _Booking Fields, this system will combine condition into 1 left outer join. If didn't do it
**     Then it will form left outer join to booking_id, that result left outer joined to flight_price condition
*
*
****  IF Inner is not used, then flight price < 100 data will be display but with zeros for booking id and flight price because it's doing left outer
**    join leads to display of empty values, to avoid that use INNER
*
****  Without Cardinality (1) we cannot use INNER
*      INTO TABLE @DATA(li_assoc)
*      UP TO 1000 ROWS.
*    IF sy-subrc EQ 0.
*
*      out->write(
*        EXPORTING
*          data   = li_assoc
*              name   = 'Inner Join of Table'
**            RECEIVING
**              output =
*      )..
*
*    ENDIF.


    SELECT *
        FROM ZAJ_CDS_TABLE_FUNC( p_customer = '000608' )
        INTO TABLE @DATA(li_table_func).

    out->write( data = li_table_func name = 'Table Function' ).

  ENDMETHOD.
ENDCLASS.
