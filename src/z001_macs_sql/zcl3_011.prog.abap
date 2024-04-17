*&---------------------------------------------------------------------*
*& Report zcl3_011
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zcl3_011.


*For all entries se debe evitar y para ello hay las tablas temporales
insert zemployees from table @( value #( ( employee_id = 123
                                           name        = 'John'
                                           last_name   = 'Smith'
                                           gender      = 'M' ) ) ).

select from ztb_employees as tt
    inner join zemployees as gtt
            on tt~empl_num eq gtt~employee_id
           and tt~name eq gtt~name
    fields tt~empl_num,
           gtt~name,
           gtt~last_name,
           gtt~gender
    into table @data(gt_employees).

 delete from zemployees.

if sy-subrc eq 0.
  cl_demo_output=>display( gt_employees ).
endif.
