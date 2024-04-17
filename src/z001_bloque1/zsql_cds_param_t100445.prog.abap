*&---------------------------------------------------------------------*
*& Report zsql_cds_param_t100445
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zsql_cds_param_t100445.

CONSTANTS : p_distance_l TYPE s_distance VALUE 1000,
            p_distance_u TYPE s_distance VALUE 5000,
            p_unit       TYPE s_distid VALUE 'MI'.

SELECT FROM demo_cds_parameters( p_distance_l = @p_distance_l,
                                 p_distance_u = @p_distance_u,
                                 p_unit       = @p_unit )
       FIELDS *
       ORDER BY carrid, connid
       INTO TABLE @DATA(gt_results).

if sy-subrc = 0.
  cl_demo_output=>display( gt_results ).
endif.
