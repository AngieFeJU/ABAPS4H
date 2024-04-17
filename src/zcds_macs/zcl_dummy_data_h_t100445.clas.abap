class zcl_dummy_data_h_t100445 definition
  public
  final
  create public .

  public section.
    interfaces if_oo_adt_classrun.
  protected section.
  private section.
endclass.



class zcl_dummy_data_h_t100445 implementation.
  method if_oo_adt_classrun~main.

    modify zempl_h_100445 from table @( value #( (    employee  = '1' manager = ''  name = 'Name 1'  )
                                                    ( employee  = '2' manager = '1' name = 'Name 2'  )
                                                    ( employee  = '3' manager = '2' name = 'Name 3'  )
                                                    ( employee  = '4' manager = '2' name = 'Name 4'  )
                                                    ( employee  = '5' manager = ''  name = 'Name 5'  )
                                                    ( employee  = '6' manager = '5' name = 'Name 6'  )
                                                    ( employee  = '7' manager = '5' name = 'Name 7'  )
                                                    ( employee  = '8' manager = '7' name = 'Name 8'  )
                                                    ( employee  = '9' manager = '8' name = 'Name 9'  )
                                                    ) ).
  endmethod.

endclass.
