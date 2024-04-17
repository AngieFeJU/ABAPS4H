*&---------------------------------------------------------------------*
*& Report zsql_14_numeric_functions_macs
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsql_14_numeric_functions_macs.

DATA(gv_offset) = 18.

DATA gv_decimal TYPE p LENGTH 13 DECIMALS 4 VALUE '27.0671'.

DELETE FROM demo_expressions.
INSERT demo_expressions FROM @( VALUE #( id   = 1
                                         num1 = 14
                                         num2 = 8 ) ).


SELECT SINGLE FROM demo_expressions
        FIELDS id, num1, num2,
               CAST( num1 as fltp ) / CAST( num2 as fltp ) as ratio,
               DIVISION( num1, num2, 2 ) as division,
               DIV( num1, num2 ) as div,
               MOD( num1, num2 ) as mod,
               num1 + num2 + @gv_offset as sum,
               ABS( num1 - num2 ) as abs,
               @gv_decimal as decimal,
               CEIL( @gv_decimal ) as ceil,
               FLOOR( @gv_decimal ) as floor,
               ROUND( @gv_decimal, 2 ) as round
         WHERE id eq 1
         INTO @DATA(gs_results).

if sy-subrc eq 0.

    cl_demo_output=>display( gs_results ).

endif.
