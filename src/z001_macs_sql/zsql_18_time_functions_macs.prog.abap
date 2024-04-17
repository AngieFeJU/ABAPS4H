*&---------------------------------------------------------------------*
*& Report zsql_17_date_functions_macs
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsql_18_time_functions_macs.

DELETE FROM demo_expressions.
INSERT demo_expressions FROM @( VALUE #( id    = 'L'
                                         dats1 = '20270101'
                                         dats2 = '20280101'
                                           ) ).

 SELECT SINGLE FROM demo_expressions
    FIELDS id, dats1, dats2,
*Validez de una fecha
           DATS_IS_VALID( dats1 ) as valid,
*Numero de dias disponibles
            DATS_DAYS_BETWEEN( dats1, dats2 ) as days_between,
*Agregar dias a una fecha
            DATS_ADD_DAYS( dats1, 30 ) as add_days,
*Restar dias a una fecha
            DATS_ADD_DAYS( dats1, -30 ) as less_days,
*Agregar meses a una fecha
            DATS_ADD_MONTHS( dats1, -2 ) as add_moths
    WHERE id = 'L'
    INTO @DATA(gs_results).


if sy-subrc eq 0.

    cl_demo_output=>display( gs_results ).

endif.
