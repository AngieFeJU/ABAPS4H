*&---------------------------------------------------------------------*
*& Report zsql_06_union_macs
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsql_06_union_macs.

CLASS lcl_sql_union DEFINITION.
    PUBLIC SECTION.
    CLASS-METHODS main.
ENDCLASS.

CLASS lcl_sql_union IMPLEMENTATION.

  METHOD main.
  DATA(lo_output) = cl_demo_output=>new(  ).

    SELECT FROM zint_products
        FIELDS product_id as id, description as name
    UNION DISTINCT
        SELECT FROM zext_products
            FIELDS id, name
            INTO TABLE @DATA(lt_union_distinct).

    lo_output->write( lt_union_distinct ).

    SELECT FROM zint_products
        FIELDS product_id as id, description as name
    UNION ALL
        SELECT FROM zext_products
            FIELDS id, name
            INTO TABLE @DATA(lt_union_all).

     lo_output->write( lt_union_all ).


    SELECT FROM zint_products
        FIELDS product_id AS id, description AS name
    UNION DISTINCT
        SELECT FROM zext_products
            FIELDS id, name
    UNION DISTINCT (
        SELECT FROM zint_products
        FIELDS product_id AS id, description AS name
        UNION ALL
        SELECT FROM zext_products
            FIELDS id, name
        )
            INTO TABLE @DATA(lt_union_distinct_all).

    lo_output->write( lt_union_distinct_all ).


        SELECT FROM zint_products
        FIELDS product_id AS id, description AS name
    UNION ALL
        SELECT FROM zext_products
            FIELDS id, name
    UNION ALL (
        SELECT FROM zint_products
        FIELDS product_id AS id, description AS name
        UNION ALL
        SELECT FROM zext_products
            FIELDS id, name
        )

        ORDER BY id
            INTO TABLE @DATA(lt_union_all_all).

    lo_output->write( lt_union_all_all ).

    lo_output->display(  ).
  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.

    lcl_sql_union=>main( ).
