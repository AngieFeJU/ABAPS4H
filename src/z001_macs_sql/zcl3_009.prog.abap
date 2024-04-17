*&---------------------------------------------------------------------*
*& Report zcl3_009
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zcl3_009.

*En union El numero de columas que puede tener la tabla en su definion no condicionante,
*el numero de columnas que se se lecciona en los union deben ser el mismo en los selects involucrados
*Todas las columnas se deben de nombrar igual en todas la fuentes.
*Todas las columnas en el mismo orden deben tener el mismo tipo

select from zint_products
    fields product_id as id,
           description

union distinct

select from zext_products
    fields id,
           name as description

union distinct (

            select from zint_products
                fields product_id as id,
                       description

            union distinct

            select from zext_products
                fields id,
                       name as description )

    into table @data(gt_union_destinct)
    .


    cl_demo_output=>display( gt_union_destinct ).
