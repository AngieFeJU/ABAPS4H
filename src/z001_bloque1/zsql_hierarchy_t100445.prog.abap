*&---------------------------------------------------------------------*
*& Report zsql_hierarchy_t100445
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zsql_hierarchy_t100445.

TRY.
    SELECT FROM HIERARCHY( SOURCE DEMO_CDS_SIMPLE_TREE_SOURCE
                       CHILD TO PARENT ASSOCIATION _tree
                       START WHERE id = 1
                       DEPTH 1
                       )
       FIELDS
             id,
             parent,
             name
       order by id
       INTO TABLE @DATA(gt_results).



  CATCH cx_sy_open_sql_db INTO DATA(lx_sql_db).
    WRITE lx_sql_db->get_longtext(  ).
    EXIT.
ENDTRY.

CHECK gt_results IS NOT INITIAL.
cl_demo_output=>display( gt_results ).
