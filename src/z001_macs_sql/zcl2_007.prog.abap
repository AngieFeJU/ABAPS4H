*&---------------------------------------------------------------------*
*& Report zcl2_004
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zcl2_007.

delete from demo_expressions.
insert demo_expressions from @( value #( id = 'L' ) ).

data gv_char type c length 6 value  'LOGALI'.

select single from demo_expressions
fields  id,
        abap_system_timezone( client = @sy-mandt,
                              on_error = @sql_abap_system_timezone=>set_to_null ) as system_tz,
        abap_user_timezone( client = @sy-mandt,
                            user = @sy-uname,
                            on_error = @sql_abap_user_timezone=>set_to_null ) as user_tz
where id eq 'L'
into @data(gs_results).

if sy-subrc eq 0.

  cl_demo_output=>display( gs_results ).

endif.
