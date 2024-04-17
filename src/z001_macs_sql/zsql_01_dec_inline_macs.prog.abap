*&---------------------------------------------------------------------*
*& Report zsql_01_dec_inline_macs
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsql_01_dec_inline_macs.


SELECT * FROM sflight
    INTO TABLE @data(gt_flights)
    up to 5 ROWS.

if sy-subrc eq 0.

    cl_demo_output=>display( gt_flights ).

endif.

*Salida de usuario
data(out) = cl_demo_output=>new( ).
out->write( : data = sy-uname ),
              data = sy-datum ),
              data = sy-uzeit )->display( ).
