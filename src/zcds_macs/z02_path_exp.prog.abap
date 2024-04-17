*&---------------------------------------------------------------------*
*& Report z02_path_exp
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z02_path_exp.

data gv_carrid_id type s_carr_id value 'LH'.

*Clase Standar Nos ayuda a recoger un valor con reques que genera una pantalla de seleccion
cl_demo_input=>request( changing field = gv_carrid_id ).

select from zcds_22_t100445 as cds
fields cds~carrname as Carrname,
\_Flights-connid as Conid,
\_Flights\_Flight-fldate as Fldate,
\_Flights\_Airports-name as Name
where cds~carrid eq @gv_carrid_id
into table @data(gt_results).

if sy-subrc eq 0.
cl_demo_output=>display( gt_results ).

endif.
