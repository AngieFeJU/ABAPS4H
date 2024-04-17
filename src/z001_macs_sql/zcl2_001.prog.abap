*&---------------------------------------------------------------------*
*& Report zcl2_001
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zcl2_001.

types: begin of ty_empleado,
        nombre type char30,
        posicion type char30,
        edad type i,
       end of ty_empleado,
       ty_empleado_t type standard table of ty_empleado with key nombre.

data(gt_empleado) = value ty_empleado_t( ( nombre = 'Oscar'  posicion = 'ABAP'      edad = 34 )
                                         ( nombre = 'Carlos' posicion = 'FUNCIONAL' edad = 26 )
                                         ( nombre = 'Adolfo' posicion = 'ABAP'      edad = 32 )
                                         ( nombre = 'Erick'  posicion = 'FUNCIONAL' edad = 37 )
                                         ( nombre = 'Samuel' posicion = 'ABAP'      edad = 29 )
                                         ( nombre = 'Jimmy'  posicion = 'BASIS'     edad = 24 )  ).

data: gv_edad_tot type i,
      gv_edad_avg type i.

loop at gt_empleado into data(gs_employee)
    group by ( posicion = gs_employee-posicion
                  size  = group size
                  index = group index )
    ascending
    assigning field-symbol(<group>).

     clear gv_edad_tot.

     write: / |Indice: { <group>-index } Posición: { <group>-posicion width = 10 }|
               & |Número de empleados: { <group>-size } |.

    loop at group <group> assigning field-symbol(<gs_miembros>).
*gv_edad_tot = gv_edad_tot + <gs_miembros>-edad.
    gv_edad_tot += <gs_miembros>-edad.

    write: /20 <gs_miembros>-nombre.

    endloop.

    gv_edad_avg = gv_edad_tot / <group>-size.

    write: / | Edad Media:  { gv_edad_avg } |.



endloop.
