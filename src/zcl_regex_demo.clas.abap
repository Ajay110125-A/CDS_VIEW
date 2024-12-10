CLASS zcl_regex_demo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_regex_demo IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA(text) = |"Jack" and "Jill" went up the "hill"|.
    DATA(text1) = |ABCDEFG|.
    DATA(matches) = |[A]*|.

    IF matches( val = text1 regex = matches ).
    ENDIF.

*    DATA(lo_regex) = cl_abap_regex=>create_pcre(
*                    pattern          = |[A*]|
**                    ignore_case      = abap_false
**                    enable_jit       = abap_true
**                    enable_multiline = abap_false
**                    no_submatches    = abap_false
**                    newline_mode     = C_NEWLINE_MODE-CRLFANY
**                    unicode_handling = C_UNICODE_HANDLING-STRICT
**                    extended         = abap_true
**                    dot_all          = abap_false
*                  ).

*   lo_regex->create_matcher(
*     EXPORTING
*       text    = text1
**       table   =
**       callout =
**     RECEIVING
**       matcher =
*   ).

*   DATA(matcher) = lo_regex->create_matcher( text = text1 ).
*
*   DATA(match) = matcher->get_match( ).
**   CATCH cx_sy_matcher.
*   CATCH cx_sy_matcher.

  ENDMETHOD.
ENDCLASS.
