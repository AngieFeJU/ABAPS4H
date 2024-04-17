*&---------------------------------------------------------------------*
*& Report zsql_with_t100445
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zsql_with_t100445.

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

SELECT FROM +tmp_table
    FIELDS *
    ORDER BY carrname DESCENDING
    INTO TABLE @DATA(gt_results).

cl_demo_output=>display( gt_results ).
