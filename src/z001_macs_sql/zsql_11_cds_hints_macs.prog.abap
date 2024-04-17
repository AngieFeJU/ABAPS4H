*&---------------------------------------------------------------------*
*& Report zsql_11_cds_hints_macs
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsql_11_cds_hints_macs.


*HINTS Depende de las BD disponibles, el optimizador buscara los indixes en este caso
*st05 Activar trace con Filtros
SELECT FROM scustom
    FIELDS *
    %_HINTS HDB 'INDEX_SEARCH'
    INTO TABLE @DATA(gt_customers).

 if sy-subrc eq 0.

    cl_demo_output=>display( gt_customers ).

 endif.
