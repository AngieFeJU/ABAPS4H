*&---------------------------------------------------------------------*
*& Report zfun_03_t100445
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zfun_03_t100445.


    data(lv_id) = 'M'.

    DATA: lv_char  TYPE c LENGTH 6  VALUE 'LOGALI',
          lv_char1 TYPE c LENGTH 10 VALUE 'AABbCDDe',
          lv_char2 TYPE c LENGTH 10 VALUE '123456'.


    select from demo_expressions
        fields id, char1, char2
        where id = @lv_id
        order by id
        into table @data(lt_demo_exp_id)
        .

        if sy-subrc <> 0.
           INSERT demo_expressions FROM @( VALUE #( id    = lv_id
                                                    char1 = lv_char1
                                                    char2 = lv_char2
                                           ) ).
        endif.

SELECT SINGLE FROM demo_expressions
    FIELDS id, char1, char2,
           LEFT( char1, 2  ) as left,
           RIGHT( char1, 3 ) as rigth,
           LPAD( char2, 18, '0' ) as lpad,
           RPAD( char2, 18, '0' ) as rpad,
           LTRIM( char1, 'A' ) as ltrim,
           RTRIM( char1, 'e' ) as rtrim,
           INSTR( char1, 'bC' ) as instr,
           LENGTH( char1 ) as length,
           REPLACE( char1, 'DD', '__' ) as replace,
           SUBSTRING( char1, 3, 2 ) as substring,
           LOWER( char1 ) as lower,
           UPPER( char1 ) as upper
    WHERE id eq 'L'
    INTO @DATA(gs_result).

if sy-subrc eq 0.
  cl_demo_output=>display( gs_result ).
endif.
