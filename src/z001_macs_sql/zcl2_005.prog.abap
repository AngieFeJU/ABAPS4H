*&---------------------------------------------------------------------*
*& Report zcl2_004
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zcl2_005.

delete from demo_expressions.
insert demo_expressions from @( value #( id = 'L' char1 = 'AABbCDDe' char2 = '123456' ) ).

data gv_char type c length 6 value  'LOGALI'.

select single from demo_expressions
fields  id,
        char1,
        char2,
        left( char1, 2 ) as left,
        right( char2, 2 ) as right,
        lpad( char2, 18, '0' ) as lpad,
        rpad( char2, 18, '0' ) as rpad,
        ltrim( char1, 'A' )  as ltrim,
        rtrim( char1, 'A' )  as rtrim,
        instr( char1, 'bC' ) as instr,
        length( char2 ) as length,
        replace( char1, 'DD', '___' ) as replace,
        substring( char1, 3, 2 ) as substring,
        lower( char1 ) as lower,
        upper( char1 ) as upper
where id eq 'L'
into @data(gs_results).

if sy-subrc eq 0.

  cl_demo_output=>display( gs_results ).

endif.
