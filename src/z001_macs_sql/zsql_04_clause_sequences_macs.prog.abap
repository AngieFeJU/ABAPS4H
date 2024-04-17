*&---------------------------------------------------------------------*
*& Report zsql_03_clause_sequences_macs
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsql_04_clause_sequences_macs.

CONSTANTS: gc_fltime_ini TYPE s_fltime VALUE '60',
           gc_fltime_fin TYPE s_fltime VALUE '500'.

*Secuencias de las clausulas con Agregacion, Ordenacion, Filtros u Otras clausulas
SELECT FROM spfli
    FIELDS carrid, period
    WHERE fltime BETWEEN @gc_fltime_ini AND @gc_fltime_fin
    GROUP BY carrid, period
    ORDER BY carrid DESCENDING
    INTO TABLE @DATA(gt_flights)
    UP TO 30 ROWS.

if sy-subrc eq 0.
    cl_demo_output=>display( gt_flights ).

endif.
