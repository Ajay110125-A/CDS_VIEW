CLASS zcl_inner_join DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_inner_join IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


   SELECT
     FROM /dmo/travel_m as t
     LEFT OUTER JOIN /dmo/booking_m as b
     ON t~travel_id = b~travel_id
     FIELDS t~travel_id, b~booking_id
     INTO TABLE @DATA(li_travel).
     IF sy-subrc EQ 0.

        DELETE li_travel WHERE booking_id IS NOT INITIAL.
        out->write( li_travel ).

     ENDIF.


*    out->write( li_bookins ).

  ENDMETHOD.
ENDCLASS.
