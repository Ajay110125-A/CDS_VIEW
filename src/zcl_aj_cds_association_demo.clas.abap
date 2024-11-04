CLASS zcl_aj_cds_association_demo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_aj_cds_association_demo IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT
      FROM zaj_cds_association_demo
      FIELDS TravelId, BookingID, \_Booking-flight_price
      INTO TABLE @DATA(li_association).

    out->write( li_association ).


  ENDMETHOD.
ENDCLASS.
