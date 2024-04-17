*&---------------------------------------------------------------------*
*& Report zsql_hier_mult_t100445
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zsql_hier_mult_t100445.


TRY.
    SELECT FROM HIERARCHY( SOURCE DEMO_CDS_PARENT_CHILD_SOURCE
                       CHILD TO PARENT ASSOCIATION _relat
                       START WHERE id = 'A'
                       MULTIPLE PARENTS leaves only
                       )
       FIELDS
             id,
             parent,
             hierarchy_level
       order by id
       INTO TABLE @DATA(gt_results).



  CATCH cx_sy_open_sql_db INTO DATA(lx_sql_db).
    WRITE lx_sql_db->get_longtext(  ).
    EXIT.
ENDTRY.

CHECK gt_results IS NOT INITIAL.
cl_demo_output=>display( gt_results ).
