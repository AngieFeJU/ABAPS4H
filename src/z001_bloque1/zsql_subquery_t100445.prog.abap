*&---------------------------------------------------------------------*
*& Report zsql_subquery_t100445
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zsql_subquery_t100445.

DELETE FROM demo_join3.

MODIFY demo_join3
    FROM ( SELECT FROM demo_join1 as demo1
            INNER JOIN demo_join2 as demo2 ON demo1~d eq demo2~d
            FIELDS demo1~a,
                   demo1~b,
                   demo2~e,
                   demo2~f ).

SELECT FROM demo_join3
    FIELDS *
    INTO TABLE @DATA(gt_results).

if sy-subrc eq 0 .

    cl_demo_output=>display( gt_results ).

endif.
