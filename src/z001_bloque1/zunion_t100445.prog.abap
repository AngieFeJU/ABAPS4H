*&---------------------------------------------------------------------*
*& Report zunion_t100445
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zunion_t100445.

 DATA(lo_output) = cl_demo_output=>new(  ).

select from zint_t100445
    fields product_id, description
union distinct
select from zext_t100445
fields product_id, description
order by product_id
into table @data(gt_result_union).


    lo_output->write( gt_result_union ).
    lo_output->display(  ).

*insert zint_t100445 from table @( value #(
*( product_id  = 'P1'
*  description = 'Placa Base Asus ROG Zenith' )
*( product_id  = 'P2'
*  description = 'Procesador I9-7980XE 2.6Ghz' )
*( product_id  = 'P3'
*  description = 'Disco duro - SSD Samsung 850 Eco 4TB SATA3' )
*( product_id  = 'P4'
*  description = 'RAM - G.Skill Trident Z RGB DDR4 PC4-25600 64GB' ) ) ).
*
*
*INSERT zext_t100445 FROM TABLE @( VALUE #(
*( product_id  = 'P3'
*  description = 'Disco duro - SSD Samsung 850 Eco 4TB SATA3' )
*( product_id  = 'P4'
*  description = 'RAM - G.Skill Trident Z RGB DDR4 PC4-25600 64GB' )
*( product_id  = 'P5'
*  description = 'Tarjeta Gráfica - PNY NVIDIA Quadro P6000 24GB GDDR5X' )
*( product_id  = 'P6'
*  description = 'Fuente de alimentación - EVGA Supernova G2 1600W 80 Plus Gold' ) ) ).
