*&---------------------------------------------------------------------*
*& Report zsql_hints_t100445
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zsql_hints_t100445.

SELECT FROM sflights
    FIELDS *
    WHERE carrid = 'AA'
    %_HINTS HDB 'INDEX_SEARCH'
    INTO TABLE @DATA(gt_sflights).

 if sy-subrc eq 0.

    cl_demo_output=>display( gt_sflights ).

 endif.
