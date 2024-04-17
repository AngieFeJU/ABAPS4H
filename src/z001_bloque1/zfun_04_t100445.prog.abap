*&---------------------------------------------------------------------*
*& Report zfun_04_t100445
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zfun_04_t100445.


data(lv_id) = 'H'.

    DATA:
          lv_date1 TYPE c LENGTH 10 VALUE '20230329',
          lv_date2 TYPE c LENGTH 10 VALUE '20250329'.


    select from demo_expressions
        fields id
        where id = @lv_id
        order by id
        into table @data(lt_demo_exp_id)
        .

        if sy-subrc <> 0.
           INSERT demo_expressions FROM @( VALUE #( id    = lv_id
                                                    dats1 = lv_date1
                                                    dats2 = lv_date2
                                           ) ).
        endif.


 SELECT SINGLE FROM demo_expressions
    FIELDS id, dats1, dats2,
           DATS_IS_VALID( dats1 ) as valid,
           DATS_DAYS_BETWEEN( dats1, dats2 ) as days_between,
           DATS_ADD_DAYS( dats1, 30 ) as add_days,
           DATS_ADD_MONTHS( dats1, -2 ) as add_moths
    WHERE id = @lv_id
    INTO @DATA(gs_results).


if sy-subrc eq 0.
    cl_demo_output=>display( gs_results ).
endif.
