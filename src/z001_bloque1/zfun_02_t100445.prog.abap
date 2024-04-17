*&---------------------------------------------------------------------*
*& Report zfun_02_t100445
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zfun_02_t100445.


    data(lv_id) = 'M'.

    DATA: lv_char  TYPE c LENGTH 6  VALUE 'LOGALI',
          lv_char1 TYPE c LENGTH 10 VALUE 'AABbCDDe',
          lv_char2 TYPE c LENGTH 10 VALUE '123456',
          lv_char3 TYPE c LENGTH 5  VALUE 'HANA-'.


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
           CONCAT( char1, char2 ) as concat,
           CONCAT_WITH_SPACE( char1, @lv_char, 2 ) as conca_with_space,
           char1 && char2 && @lv_char3 && @lv_char as ampersand
    WHERE id eq @lv_id
    INTO @DATA(gs_result)
    .
if sy-subrc eq 0.
  cl_demo_output=>display( gs_result ).
endif.
