*&---------------------------------------------------------------------*
*& Report zfun_01_t100445
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zfun_01_t100445.

class lcl_check_num definition.
  public section.
    class-methods main.
endclass.

class lcl_check_num implementation.

  method main.

    data(gv_num1) = 14.
    data(gv_num2) = 8.

    data: gt_existe type table of demo_expressions,
          gt_insert type table of demo_expressions.


    select from demo_expressions
        fields id, num1, num2
        order by id
        into table @data(lt_demo_exp)
        .

    gt_existe = value #( for <gs_fs_dem> in lt_demo_exp where ( num1 = gv_num1 and num2 = gv_num2 )
                       ( num1 = <gs_fs_dem>-num1
                         num2 = <gs_fs_dem>-num2 ) ).

    data(lv_lines_ext) = lines( gt_existe ).
    data i_char type char1.


    if lv_lines_ext = 0.
      data(i) = 1.

      while i < 10.

        write i to i_char.
        data(v_lines) = 0.

        loop at lt_demo_exp into data(filtered_row).
          if filtered_row-id eq i_char.
            v_lines = v_lines + 1.
            exit.
          endif.
        endloop.

        if v_lines eq 0.

          gt_insert = value #( ( id = i_char
                               num1 = gv_num1
                               num2 = gv_num2 )
                             ).
          exit.
        endif.

        i = i + 1.
      endwhile.
    endif.

    data(lv_lines_check) = lines( gt_insert ).

    if lv_lines_check is not initial.

      modify demo_expressions from table gt_insert.
    elseif lv_lines_ext eq 0.
      modify demo_expressions from @( value #( id   = 3
                                               num1 = gv_num1
                                               num2 = gv_num2 ) ).
    endif.

  endmethod.

endclass.


start-of-selection.

  lcl_check_num=>main( ).

  data(gv_offset) = 18.

  data gv_decimal type p length 13 decimals 4 value '27.0671'.



  select single from demo_expressions
          fields id, num1, num2,
                 cast( num1 as fltp ) / cast( num2 as fltp ) as ratio,
                 division( num1, num2, 2 ) as division,
                 div( num1, num2 ) as div,
                 mod( num1, num2 ) as mod,
                 num1 + num2 + @gv_offset as sum,
                 abs( num1 - num2 ) as abs,
                 @gv_decimal as decimal,
                 ceil( @gv_decimal ) as ceil,
                 floor( @gv_decimal ) as floor,
                 round( @gv_decimal, 2 ) as round
           where num1 eq 14 and num2 eq 8
           into @data(gs_results).

  if sy-subrc eq 0.

    cl_demo_output=>display( gs_results ).

  endif.
