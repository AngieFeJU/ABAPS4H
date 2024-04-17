*&---------------------------------------------------------------------*
*& Report zcase_t100445
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zcase_t100445.

constants: t1 type char1025 value 'Ambos < de 50',
           t2 type char1025 value 'Ambos > de 50',
           t3 type char1025 value 'Ambos = de 50',
           t4 type char1025 value 'Otro'.

*Implementacion del Metodo RANDOM
*data(lcl_random) = cl_abap_random_int=>create( seed = conv i( sy-uzeit )
*                                                   min  = 1
*                                                   max  = 100 ).
*insert demo_expressions from table @( value #(
*                                for i = 1 until i > 10 ( id   = i
*                                                        num1 = lcl_random->get_next( )
*                                                        num2 = lcl_random->get_next( ) ) ) ).

select from demo_expressions
fields num1, num2,
case
  when num1 < 50 and num2 < 50 then @t1
  when num1 > 50 and num2 > 50 then @t2
  when num1 = 50 and num2 = 50 then @t3
  else @t4
end as validacion
group by num1, num2
order by validacion
into table @data(gt_expressions).

     if sy-subrc eq 0.

        cl_demo_output=>display( gt_expressions ).

     endif.
