*&---------------------------------------------------------------------*
*& Report zti_macs
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zti_macs.

SELECT FROM sflight
       FIELDS carrid, connid, fldate
       INTO TABLE @DATA(gt_sflight).

 DATA(gv_carrid) = 'AA'.

 SELECT carrid, connid, fldate
    FROM sflight
    INTO TABLE @gt_sflight
    WHERE carrid EQ @gv_carrid.

READ TABLE gt_sflight INTO DATA(gs_sflight) INDEX 1.

TRY.

    DATA(gs_sflight_2) = gt_sflight[ 1 ].

    gs_sflight_2 = gt_sflight[ carrid = 'AA' connid = '1017' ].

    CATCH cx_sy_itab_line_not_found INTO DATA(go_exception).
    WRITE go_exception->get_text(  ).

ENDTRY.


    APPEND INITIAL LINE TO gt_sflight ASSIGNING FIELD-SYMBOL(<gs_sflight>).
    <gs_sflight>-carrid = 'LH'.

    DATA: gv_value1 TYPE f VALUE '10',
          gv_value2 TYPE f VALUE '20'.

    DATA(gv_final) = gv_value1 + gv_value2.

    SELECT FROM sflight
       FIELDS carrid, connid, fldate
       INTO TABLE @DATA(gt_flights).

    SELECT FROM sflight
       FIELDS carrid, connid, fldate
       INTO TABLE @DATA(gt_airlines).



   DATA: gt_final TYPE TABLE OF sflight,
         gs_final TYPE sflight.

**Old Model
*
*LOOP AT gt_flights ASSIGNING FIELD-SYMBOL(<gs_old_flights>)
*     WHERE carrid EQ 'LH'.
*
*     LOOP AT gt_airlines INTO DATA(gs_old_airlines)
*        WHERE connid  EQ <gs_old_flights>-connid.
*        gs_final-carrid = <gs_old_flights>-carrid.
*        gs_final-connid = gs_old_airlines-connid.
*        APPEND gs_final to gt_final.
*     ENDLOOP.
*
*ENDLOOP.

*New Model

  gt_final = VALUE #( FOR <gs_new_flightsfor> IN gt_flights WHERE ( carrid = 'LH' )
                      FOR gs_new_airlines IN gt_airlines
                      WHERE ( connid = <gs_new_flightsfor>-connid )
                            ( carrid = <gs_new_flightsfor>-carrid
                              connid = gs_new_airlines-connid ) ).
