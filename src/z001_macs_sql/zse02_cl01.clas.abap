class zse02_cl01 definition
  public
  final
  create public .

  public section.
    interfaces if_oo_adt_classrun.
  protected section.
  private section.
endclass.



class zse02_cl01 implementation.
  method if_oo_adt_classrun~main.

    types: begin of ty_structure,
             col1 type i,
             col2 type i,
             col3 type i,
           end of ty_structure,
           ty_table type standard table of ty_structure with empty key.

    data: lt_table type ty_table,
          lv_index type i.

    field-symbols <ls_tab> type ty_structure.

    lv_index = 1.

    do.
      lv_index = lv_index + 10.
      if lv_index > 40.
        exit.
      endif.

      append initial line to lt_table assigning <ls_tab>.
      <ls_tab>-col1 = lv_index.
      <ls_tab>-col2 = lv_index.
      <ls_tab>-col3 = lv_index.
    enddo..

    data(lt_itab_new) = value ty_table( for i = 11 then i + 10 until i > 40
                                       ( col1 = i
                                         col2 = i + 1
                                         col3 = i + 2 ) ).

     out->write( 'OLD ' ).
     loop at lt_table assigning <ls_tab>.
        out->write( |{ <ls_tab>-col1 }--{ <ls_tab>-col2 }--{ <ls_tab>-col3 }| ).
     endloop.

     out->write( 'NEW ' ).
     loop at lt_itab_new assigning <ls_tab>.
        out->write( |{ <ls_tab>-col1 }--{ <ls_tab>-col2 }--{ <ls_tab>-col3 }| ).
     endloop..
  endmethod.

endclass.
