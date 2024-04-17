*&---------------------------------------------------------------------*
*& Report zfun_06_t100445
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zfun_06_t100445.


SELECT SINGLE FROM demo_expressions
    FIELDS ABAP_SYSTEM_TIMEZONE( CLIENT = @sy-mandt,
                                 ON_ERROR = @sql_abap_system_timezone=>set_to_null ) as system_tz,
           ABAP_USER_TIMEZONE( USER = @sy-uname,
                               CLIENT = @sy-mandt,
                               ON_ERROR = @sql_abap_user_timezone=>set_to_null ) as user_tz
    INTO @DATA(gs_results).


   cl_demo_output=>display( gs_results ).
