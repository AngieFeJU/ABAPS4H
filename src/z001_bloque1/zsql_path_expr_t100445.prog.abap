*&---------------------------------------------------------------------*
*& Report zsql_path_expr_t100445
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zsql_path_expr_t100445.

SELECT FROM demo_cds_assoc_scarr
    FIELDS carrname,
        \_spfli[ (*) ]-connid as connid,
        \_spfli[ (*) ]\_sflight[ (*) ]-fldate as fldate,
        \_spfli[ (*) ]\_sairport[ (1) ]-name as name
     where carrid eq 'LH'
     ORDER BY carrname, connid, fldate ASCENDING
     INTO TABLE @DATA(gt_results)
     up to 10 rows.

if sy-subrc eq 0.
    cl_demo_output=>display( gt_results ).
endif.
