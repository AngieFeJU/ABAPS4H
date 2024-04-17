*&---------------------------------------------------------------------*
*& Report zsql_01_dec_inline_macs
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsql_02_fields_macs.


SELECT FROM sflight
    FIELDS carrid, connid, currency, fldate
    INTO TABLE @data(gt_flights)
    up to 5 ROWS.

if sy-subrc eq 0.

    cl_demo_output=>display( gt_flights ).

endif.
