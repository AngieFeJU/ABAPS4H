*&---------------------------------------------------------------------*
*& Report zhost_variables_t100445
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zhost_variables_t100445.


data gv_carrid type s_carr_id value 'AA'.

data:
  begin of gs_sflight,
    carrid type sflight-carrid,
    connid type sflight-connid,
  end of gs_sflight.

*Objeto de Referencia
data go_ref_sflight like ref to gs_sflight.
go_ref_sflight = new #(  ).

select single from sflight
    fields carrid, connid
    where carrid eq @gv_carrid
    into corresponding fields of @go_ref_sflight->*.

*Tipo Estructura
  select single from sflight
      fields carrid, connid
      where carrid eq @gv_carrid
      into corresponding fields of @gs_sflight.


*Puntero
    assign gs_sflight to field-symbol(<fs_sflight>).
    select single from sflight
        fields carrid, connid
        where carrid eq @gv_carrid
        into corresponding fields of @<fs_sflight>.


      cl_demo_output=>new(
         )->next_section( title = '***************Host de Tipo Estructura***************'
         )->write( gs_sflight
         )->next_section( title = '**************Host Field Symbol Puntero**************'
         )->write( <fs_sflight>
         )->next_section( title = '**************Host Objeto de Referencia**************'
         )->write( go_ref_sflight->* )->display(  ).
