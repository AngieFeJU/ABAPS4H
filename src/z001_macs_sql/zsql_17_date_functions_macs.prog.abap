*&---------------------------------------------------------------------*
*& Report zsql_17_date_functions_macs
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsql_17_date_functions_macs.

DATA(gv_seconds) = 3600.
get TIME STAMP FIELD DATA(gv_timestamp).

DELETE FROM demo_expressions.
INSERT demo_expressions FROM @( VALUE #( id         = 'L'
                                         num1       = gv_seconds
                                         timestamp1 = gv_timestamp
                                           ) ).
TRY.
 SELECT SINGLE FROM demo_expressions
    FIELDS id, num1, timestamp1,
*Validez de una hora
           TSTMP_IS_VALID( timestamp1 ) as valid,
*Segundos disponibles entre dos tiempos.
*TSTMP_CURRENT_UTCTIMESTAMP Hora Actual.
*TSTMP_ADD_SECONDS Agrega Segundos
*@sql_tstmp_add_seconds=>fail Cachar los errores
            TSTMP_SECONDS_BETWEEN( TSTMP1 = TSTMP_CURRENT_UTCTIMESTAMP( ),
                                   TSTMP2 = TSTMP_ADD_SECONDS( TSTMP    = timestamp1,
                                                               SECONDS  = CAST( num1 as DEC( 15,0 ) ),
                                                               ON_ERROR = @sql_tstmp_add_seconds=>fail ),
                                   ON_ERROR = @sql_tstmp_seconds_between=>fail ) as difference
    WHERE id = 'L'
    INTO @DATA(gs_results).
CATCH cx_sy_open_sql_db into DATA(gx_sql_db).
    cl_demo_output=>display( gx_sql_db->get_longtext(  ) ).
ENDTRY.


*    cl_demo_output=>display( gs_results ).

    CONVERT TIME STAMP gv_timestamp
            TIME ZONE 'UTC'
            INTO DATE DATA(gv_data)
                 TIME DATA(gv_time).

    WRITE: / gv_data, gv_time.

    CONVERT UTCLONG CONV utclong( '2025-11-27 22:30:00')
            INTO DATE gv_data
            TIME gv_time
            DAYLIGHT SAVING TIME DATA(gv_dst)
            TIME ZONE 'CET'.

    WRITE: / gv_data, gv_time, gv_dst.
