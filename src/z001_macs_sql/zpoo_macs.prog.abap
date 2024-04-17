*&---------------------------------------------------------------------*
*& Report zpoo_macs
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zpoo_macs.

CLASS lcl_factura DEFINITION.

PUBLIC SECTION.
TYPES: BEGIN OF ty_factura,
           importe_base TYPE i,
           iva          TYPE i,
       END OF ty_factura,
       tt_fatura TYPE TABLE OF ty_factura.

METHODS: add_item IMPORTING is_item TYPE ty_factura,
         add_items IMPORTING it_item TYPE tt_fatura,
         constructor IMPORTING iv_value TYPE char2.


ENDCLASS.

CLASS lcl_factura IMPLEMENTATION.

  METHOD add_item.

  ENDMETHOD.

  METHOD add_items.

  ENDMETHOD.

  METHOD constructor.

  ENDMETHOD.

ENDCLASS.


 START-OF-SELECTION.

 DATA go_factura_old TYPE REF TO lcl_factura.
 create OBJECT go_factura_old
 EXPORTING
 iv_value = 'AB'.

DATA go_factura_new_1 TYPE REF TO lcl_factura.
go_factura_new_1 = NEW #( iv_value = 'AB' ).

DATA(go_factura_new_2) = NEW lcl_factura( iv_value = 'AC' ).

go_factura_new_1->add_item( is_item = VALUE #( importe_base = 10 iva = 2 ) ).

go_factura_new_1->add_items( it_item = VALUE #( ( importe_base = 10 iva = 2 )
                                                ( importe_base = 20 iva = 2 ) ) ).

DATA gt_factura TYPE TABLE OF lcl_factura=>ty_factura.

gt_factura = VALUE #( ( importe_base = 10 iva = 2 )
                      ( importe_base = 10 iva = 2 ) ).

go_factura_new_1->add_items( gt_factura ).


DATA(gv_xstr) = cl_abap_codepage=>convert_to( source = CONV #( sy-uname ) ).
