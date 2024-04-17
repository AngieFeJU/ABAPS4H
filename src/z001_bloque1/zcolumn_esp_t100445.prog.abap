*&---------------------------------------------------------------------*
*& Report zcolumn_esp_t100445
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zcolumn_esp_t100445.

constants: gv_fltime_ini type s_fltime value '60',
           gv_fltime_fin type s_fltime value '500'.

select from spfli
fields carrid, period
where fltime between @gv_fltime_ini and @gv_fltime_fin
group by carrid, period
order by carrid descending
into table @data(gt_spfli).

if sy-subrc eq 0.
    cl_demo_output=>display( gt_spfli ).
endif.
