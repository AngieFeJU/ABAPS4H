*&---------------------------------------------------------------------*
*& Report zcl2_008
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zcl2_008.

select from spfli
     fields carrid,
            connid
            where fltime between '' and ''
            group by carrid, connid
            order by carrid ascending
            into table @data(gt_results)
            up to 10 rows.


if sy-subrc eq 0.
  cl_demo_output=>display( gt_results ).
endif.
