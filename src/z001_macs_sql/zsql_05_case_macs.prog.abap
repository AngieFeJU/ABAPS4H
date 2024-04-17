*&---------------------------------------------------------------------*
*& Report zsql_05_case_macs
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsql_05_case_macs.

*Definicion de Clase e Implementacion para uso del CASE
CLASS lcl_sql_case DEFINITION.
    PUBLIC SECTION.
        CLASS-METHODS main.
ENDCLASS.

CLASS lcl_sql_case IMPLEMENTATION.

  METHOD main.
*Implementacion del Metodo RANDOM
    DATA(lcl_random) = cl_abap_random_int=>create( seed = CONV i( sy-uzeit )
                                                   min  = 1
                                                   max  = 100 ).
*Ya existe info USO de # y @
*    INSERT demo_expressions FROM TABLE @( value #(
*                                    FOR i = 10 UNTIL i > 20 ( id   = i
*                                                            num1 = lcl_random->get_next( )
*                                                            num2 = lcl_random->get_next( ) ) ) ).
* Concatenacion de CASE en un select
    SELECT FROM demo_expressions
        FIELDS num1, num2,

        case
          when num1 < 50 and num2 < 50 then 'Both lower than 50'
          when num1 > 50 and num2 > 50 then 'Both higher than 50'
          when num1 = 50 and num2 = 50 then 'Both equal 50'
          when num1 = 50 and num2 = 50 then char1
          else 'Other'
        end as number,

        case num1
          when 10 then 'The value is 10'
          when 20 then 'The value is 20'
          else 'Different than 10 or 20'
        end as number2,

        case
          when num1 < 50 and num2 < 50 then  case num1
                                                  when 10 then 'The value is 10'
                                                  when 20 then 'The value is 20'
                                                  else 'Different than 10 or 20'
                                             end
          when num1 > 50 and num2 > 50 then 'Both higher than 50'
          when num1 = 50 and num2 = 50 then 'Both equal 50'
          else 'Other'
        end as number3

        ORDER BY number
        INTO TABLE @DATA(lt_results).

     if sy-subrc eq 0.

        cl_demo_output=>display( lt_results ).

     endif.

  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.

    lcl_sql_case=>main(  ).
