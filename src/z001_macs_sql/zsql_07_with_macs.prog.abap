*&---------------------------------------------------------------------*
*& Report zsql_07_with_macs
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsql_07_with_macs.


WITH +tmp_table AS (

    SELECT FROM scarr
    FIELDS carrname,
           CAST( ' ' AS char( 4 ) ) AS connid,
           ' ' AS  cityfrom,
           ' ' AS  cityto
    WHERE carrid eq 'AZ'
*Cuando no se indica ALL o DISTINCT por default es este ultimo
    UNION

    SELECT FROM spfli
    FIELDS ' ' AS carrname,
           CAST( connid AS char( 4 ) ) AS connid,
           cityfrom,
           cityto
    WHERE carrid eq 'AZ'
)

SELECT FROM +tmp_table
    FIELDS *
    ORDER BY carrname DESCENDING
    INTO TABLE @DATA(gt_results).

*Segenera una tabla temporal con select de otras tablas de datos.
 cl_demo_output=>display( gt_results ).
