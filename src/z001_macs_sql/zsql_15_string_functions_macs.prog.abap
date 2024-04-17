*&---------------------------------------------------------------------*
*& Report zsql_15_string_functions_macs
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsql_15_string_functions_macs.

DATA gv_char TYPE c LENGTH 6 VALUE 'LOGALI' .
DELETE FROM demo_expressions.
INSERT demo_expressions FROM @( VALUE #( id    = 'L'
                                         char1 = 'AABbCDDe'
                                         char2 = '123456'
                                           ) ).

SELECT SINGLE FROM demo_expressions
    FIELDS id, char1, char2,
           CONCAT( char1, char2 ) as concat,
           CONCAT_WITH_SPACE( char1, @gv_char, 2 ) as concat2,
           char1 && char2 && 'HANA-' && @gv_char as concat3
    WHERE id eq 'L'
    INTO @DATA(gs_result)
    .
if sy-subrc eq 0.
  cl_demo_output=>display( gs_result ).
endif.
