*&---------------------------------------------------------------------*
*& Report zgtt_t100445
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zgtt_t100445.


INSERT zgt_emp_t100445 FROM TABLE @( VALUE #( ( employee_number = 121 name = 'Jean' last_name   = 'Her'   gender  = 'M' )
                                              ( employee_number = 122 name = 'Ann'  last_name   = 'Sanz'  gender  = 'F' )
                                              ( employee_number = 123 name = 'Robe' last_name   = 'Ruiz'  gender  = 'M' )
                                              ( employee_number = 124 name = 'Mar'  last_name   = 'Lopez' gender  = 'F' )
                                              ( employee_number = 125 name = 'John' last_name   = 'Smith' gender  = 'M' ) ) ).

delete from ztb_emp_t100445.
INSERT ztb_emp_t100445 FROM TABLE @( VALUE #( ( employee_number = 101 name = 'Luis' last_name   = 'Serv' gender  = 'M' )
                                              ( employee_number = 102 name = 'Sam'  last_name   = 'Hut'  gender  = 'F' )
                                              ( employee_number = 103 name = 'Carl' last_name   = 'Oca'  gender  = 'M' )
                                              ( employee_number = 104 name = 'Lau'  last_name   = 'Zey'  gender  = 'F' )
                                              ( employee_number = 105 name = 'Juan' last_name   = 'Koo'  gender  = 'M' ) ) ).

select from zgt_emp_t100445
    fields employee_number, name, last_name, gender
    union all
    select from ztb_emp_t100445
    fields employee_number, name, last_name, gender
order by employee_number ascending
into table @data(gt_union_emp).

DELETE FROM zgt_emp_t100445.

if sy-subrc eq 0.

    cl_demo_output=>display( gt_union_emp ).

endif.
