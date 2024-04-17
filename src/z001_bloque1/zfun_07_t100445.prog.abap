*&---------------------------------------------------------------------*
*& Report zfun_07_t100445
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zfun_07_t100445.

data(lv_id) = 'J'.
data gv_tzone type timezone.

data:
  lv_dats1 type c length 10 value '20300101',
  lv_tims1 type c length 6  value '103040'.

select from demo_expressions
    fields id
    where id = @lv_id
    order by id
    into table @data(lt_demo_exp_id)
    .

if sy-subrc <> 0.
  insert demo_expressions from @( value #( id    = lv_id
                                           dats1 = lv_dats1
                                           tims1 = lv_dats1
                                  ) ).
endif.



select single from demo_expressions
              fields tstmp_current_utctimestamp(  ) as current_utc,
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
     where id = @lv_id
     into @data(gs_results)  .

check sy-subrc eq 0.
cl_demo_output=>display( gs_results ).
