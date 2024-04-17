*&---------------------------------------------------------------------*
*& Report zsql_15_string_functions_macs
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsql_16_string_functions_macs.

DATA gv_char TYPE c LENGTH 6 VALUE 'LOGALI' .
DELETE FROM demo_expressions.
INSERT demo_expressions FROM @( VALUE #( id    = 'L'
                                         char1 = 'AABbCDDe'
                                         char2 = '123456'
                                           ) ).

SELECT SINGLE FROM demo_expressions
    FIELDS id, char1, char2,
           LEFT( char1, 2  ) as left,
           RIGHT( char1, 3 ) as rigth,
           LPAD( char2, 18, '0' ) as lpad,
           RPAD( char2, 18, '0' ) as rpad,
           LTRIM( char1, 'A' ) as ltrim,
           RTRIM( char1, 'e' ) as rtrim,
           INSTR( char1, 'bC' ) as instr,
           LENGTH( char1 ) as length,
           REPLACE( char1, 'DD', '__' ) as replace,
           SUBSTRING( char1, 3, 2 ) as substring,
           LOWER( char1 ) as lower,
           UPPER( char1 ) as upper
    WHERE id eq 'L'
    INTO @DATA(gs_result)
    .
if sy-subrc eq 0.
  cl_demo_output=>display( gs_result ).
endif.
