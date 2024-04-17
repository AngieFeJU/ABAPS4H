*&---------------------------------------------------------------------*
*& Report zinline_declar_t100445
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zinline_declar_t100445.

SELECT FROM SFLIGHT
*FIELDS *
fields carrid, connid, price, fldate
INTO TABLE @DATA(gt_spflight).

if sy-subrc eq 0.
  cl_demo_output=>display( gt_spflight ).
endif.
