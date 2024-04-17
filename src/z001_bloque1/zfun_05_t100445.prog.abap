*&---------------------------------------------------------------------*
*& Report zfun_05_t100445
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zfun_05_t100445.

data(lv_id) = 'I'.
DATA(gv_seconds) = 3600.
get TIME STAMP FIELD DATA(gv_timestamp).

    select from demo_expressions
        fields id
        where id = @lv_id
        order by id
        into table @data(lt_demo_exp_id)
        .

        if sy-subrc <> 0.
           INSERT demo_expressions FROM @( VALUE #( id         = lv_id
                                                    num1       = gv_seconds
                                                    timestamp1 = gv_timestamp
                                           ) ).
        endif.

TRY.
 SELECT SINGLE FROM demo_expressions
    FIELDS id, timestamp1,
           TSTMP_IS_VALID( timestamp1 ) as valid,
           TSTMP_SECONDS_BETWEEN( TSTMP1 = TSTMP_CURRENT_UTCTIMESTAMP( ),
                                  TSTMP2 = TSTMP_ADD_SECONDS(  TSTMP    = timestamp1,
                                                               SECONDS  = CAST( num1 as DEC( 15,0 ) ),
                                                               ON_ERROR = @sql_tstmp_add_seconds=>fail ),
                                  ON_ERROR = @sql_tstmp_seconds_between=>fail ) as difference
    WHERE id = @lv_id
    INTO @DATA(gs_results).
CATCH cx_sy_open_sql_db into DATA(gx_sql_db).
    cl_demo_output=>display( gx_sql_db->get_longtext(  ) ).
ENDTRY.
check gs_results is not initial.
cl_demo_output=>display( gs_results ).
