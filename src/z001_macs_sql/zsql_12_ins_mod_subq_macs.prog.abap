*&---------------------------------------------------------------------*
*& Report zsql_12_ins_mod_subq_macs
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsql_12_ins_mod_subq_macs.

DELETE FROM demo_join1.

INSERT demo_join1
    FROM TABLE @( VALUE #( ( a = 'A1' b = 'b1' c = 'c1' d = 'd1' )
                           ( a = 'A2' b = 'b2' c = 'c2' d = 'd2' )
                           ( a = 'A3' b = 'b3' c = 'c3' d = 'd3' ) ) ).

DELETE FROM demo_join2.

INSERT demo_join2
    FROM TABLE @( VALUE #( ( d = 'd1' e = 'E1' f = 'F1' g = 'g1' )
                           ( d = 'd2' e = 'e2' f = 'F2' g = 'g2' )
                           ( d = 'd3' e = 'E3' f = 'F3' g = 'g3' ) ) ).

*DELETE FROM demo_join3.
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
