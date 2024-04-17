*&---------------------------------------------------------------------*
*& Report zcl2_004
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zcl2_006.

delete from demo_expressions.
insert demo_expressions from @( value #( id = 'L' dats1 = '20240329' dats2 = '20250329' ) ).

data gv_char type c length 6 value  'LOGALI'.

select single from demo_expressions
fields  id,
        dats1,
        dats2,
        dats_is_valid( dats1 ) as valid,
        dats_days_between( dats1, dats2 ) as dats_between,
        dats_add_days( dats1, 20 ) as days,
        dats_add_months( dats1, 1 ) as months,
        dats_add_days( dats1, -20 ) as days_min,
        dats_add_months( dats1, -1 ) as months_min
where id eq 'L'
into @data(gs_results).

if sy-subrc eq 0.

  cl_demo_output=>display( gs_results ).

endif.
