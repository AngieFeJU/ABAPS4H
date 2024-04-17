*&---------------------------------------------------------------------*
*& Report zcl3_010
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zcl3_010.

data(gv_blanck) = ''.

select from zint_products as Product
    inner join mara as Material on Product~product_id = Material~matnr
    fields product_id as id,
           description,
           Material~matnr as Material

union distinct

select from zext_products
    fields id,
           name as description,
           @gv_blanck as Material


    into table @data(gt_union_destinct)
    .


    cl_demo_output=>display( gt_union_destinct ).
