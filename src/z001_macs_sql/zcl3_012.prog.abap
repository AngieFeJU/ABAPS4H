*&---------------------------------------------------------------------*
*& Report zcl3_012
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zcl3_012.


with +tmp_table as (
    select from scarr
        fields carrname,
               cast( '-' as char( 4 ) ) as connid,
               '-' as cityfrom,
               '-' as cityto
    where carrid eq 'LH'

    union

    select from spfli
        fields '-' as carrname,
               cast( connid as char( 4 ) ) as connid,
               cityfrom,
               cityto
    where carrid eq 'LH'

 )

 select  from +tmp_table
    fields *
    order by carrname descending
    into table @data(gt_results).


  if sy-subrc eq 0.
  cl_demo_output=>display( gt_results ).
endif.
