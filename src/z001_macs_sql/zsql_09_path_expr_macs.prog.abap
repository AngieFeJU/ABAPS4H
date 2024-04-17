*&---------------------------------------------------------------------*
*& Report zsql_09_path_expr_macs
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsql_09_path_expr_macs.


SELECT FROM demo_cds_assoc_scarr
    FIELDS carrname,
********* \ Indica que estamos navegando a las asociasiones
*********[ (1) ] Indica la cardinalidad 1 o n o *
        \_spfli[ (*) ]-connid as connid,
        \_spfli[ (*) ]\_sflight[ (*) ]-fldate as fldate,
        \_spfli[ (*) ]\_sairport[ (1) ]-name as name
     where carrid eq 'LH'
     ORDER BY carrname, connid, fldate
     INTO TABLE @DATA(gt_results).

if sy-subrc eq 0.
    cl_demo_output=>display( gt_results ).
endif.
