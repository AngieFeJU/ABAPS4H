*&---------------------------------------------------------------------*
*& Report zsql_13_temporary_table_macs
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsql_13_temporary_table_macs.

*Tablas temporales Globales se ocupan la aplicaiones en la misma unidad de trabajo, guardar datos en la aplicacion y seleccionarlos
*No van a percistir, no almacena
*Logical Unit of Work debe finalizar correctamente pero como es una tabla temporal no puede guardar por lo que se debera borrar
*En la definicion de la tabla se setea el parametro como temporal @AbapCatalog.tableCategory : #GLOBAL_TEMPORARY
INSERT zemployees FROM TABLE @( VALUE #( ( employee_id = 123
                                           name        = 'John'
                                           last_name   = 'Smith'
                                           gender      = 'M' ) ) ).
SELECT FROM zemployees
    FIELDS *
    INTO TABLE @DATA(gt_employees).
*Buena Practica el Delete
DELETE FROM zemployees.
*ROLLBACK WORK.
*COMMIT WORK.
if sy-subrc eq 0.

    cl_demo_output=>display( gt_employees ).

endif.
