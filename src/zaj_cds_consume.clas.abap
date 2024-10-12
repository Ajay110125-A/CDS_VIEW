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

    SELECT
        FROM zaj_sample_02
        FIELDS * "TravelID, BookingID, CustomerID
        INTO TABLE @DATA(li_sample).

    IF sy-subrc EQ 0.

        out->write(
          EXPORTING
            data   = li_sample
*            name   =
*          RECEIVING
*            output =
        ).

    ENDIF.

  ENDMETHOD.
ENDCLASS.
