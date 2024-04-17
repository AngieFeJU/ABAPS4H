*&---------------------------------------------------------------------*
*& Report zsql_02_host_variables_macs
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsql_03_host_variables_macs.

DATA gv_carrid TYPE s_carr_id VALUE 'AA'.

DATA:
    BEGIN OF gs_result,
        carrid TYPE sflight-carrid,
        connid TYPE sflight-connid,
    END OF gs_result.

DATA go_ref LIKE REF TO gs_result.

*Definicion de Obj de Referencia
go_ref = NEW #( ).

**Importante el uso del caracter de escape (@) para usar las variables globales del host
*Estructura
SELECT SINGLE FROM sflight
    FIELDS carrid, connid
    WHERE carrid eq @gv_carrid
    INTO CORRESPONDING FIELDS OF @gs_result.

*Puntero Field Symbol
ASSIGN gs_result TO FIELD-SYMBOL(<fs_result>).

SELECT SINGLE FROM sflight
    FIELDS carrid, connid
    WHERE carrid eq @gv_carrid
    INTO CORRESPONDING FIELDS OF @<fs_result>.

*Objeto Referencia
SELECT SINGLE FROM sflight
    FIELDS carrid, connid
    WHERE carrid eq @gv_carrid
    INTO CORRESPONDING FIELDS OF @go_ref->*.

cl_demo_output=>new(
    )->next_section( title = 'Structure host variable'
    )->write( gs_result
    )->next_section( title = 'Field Symbol host variable'
    )->write( <fs_result>
    )->next_section( title = 'Reference host variable'
    )->write( go_ref->* )->display(  ).


*Nota> Formatear la salida
