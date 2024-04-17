*&---------------------------------------------------------------------*
*& Report zsql_20_date_time_conv_macs
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zsql_20_date_time_conv_macs.


delete from demo_expressions.
insert demo_expressions from @( value #( id    = 'L'
                                         dats1 = '20300101'
                                         tims1 = '103040' ) ).

data gv_tzone type timezone.

call function 'GET_SYSTEM_TIMEZONE'
  importing
    timezone = gv_tzone.

select single from demo_expressions
              fields tstmp_current_utctimestamp(  ) as current_utc,
                     tstmp_to_dats( tstmp    = tstmp_current_utctimestamp(  ),
                                    tzone    = @gv_tzone,
                                    client   = @sy-mandt,
                                    on_error = @sql_tstmp_to_dats=>set_to_null ) as to_dats,
                     tstmp_to_tims( client   = @sy-mandt,
                                    tstmp    = tstmp_current_utctimestamp(  ),
                                    tzone    = @gv_tzone,
                                    on_error = @sql_tstmp_to_tims=>set_to_null ) as to_tims,
                     tstmp_to_dst( client    = @sy-mandt,
                                    tstmp    = tstmp_current_utctimestamp(  ),
                                    tzone    = @gv_tzone,
                                    on_error = @sql_tstmp_to_dst=>set_to_null ) as to_dst,
                     dats_tims_to_tstmp( date     = dats1,
                                         time     = tims1,
                                         client   = @sy-mandt,
                                         tzone    = @gv_tzone,
                                         on_error = @sql_dats_tims_to_tstmp=>set_to_null ) as to_tstmp
     where id = 'L'
     into @data(gs_results)  .

check sy-subrc eq 0.
cl_demo_output=>display( gs_results ).
