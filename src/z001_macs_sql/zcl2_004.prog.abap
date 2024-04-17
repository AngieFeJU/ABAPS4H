*&---------------------------------------------------------------------*
*& Report zcl2_004
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zcl2_004.

delete from demo_expressions.

insert demo_expressions from @( value #( id = 'L' char1 = 'AABbCDDe' char2 = '123456' ) ).

data gv_char type c length 6 value  'LOGALI'.

select single from demo_expressions
fields  id,
        char1,
        char2,
*Solo se pueden 2 pero se pueden usar la misma funcion para concatenar mas
        concat( char1, char2 ) as concat,
        concat_with_space( char1, @gv_char, 2  ) as concat2,
        char1 && char2 && @gv_char as ampersand
where id eq 'L'
into @data(gs_results).

if sy-subrc eq 0.

  cl_demo_output=>display( gs_results ).

endif.
