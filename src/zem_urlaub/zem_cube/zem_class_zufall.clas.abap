CLASS zem_class_zufall DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

   PUBLIC SECTION.
  Methods constructor importing cp_1 type string
   cp_2 type string cp_3 type string cp_4 type string.



   Methods erg EXPORTING rp_erg1 type string
                          rp_erg2 type string
                          rp_erg3 type string
                          rp_erg4 type string.

  Data ip_1 type string.
  Data ip_2 type string.
  Data ip_3 type string.
  Data ip_4 type string.




  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zem_class_zufall IMPLEMENTATION.
  METHOD constructor.

  ip_1 = cp_1.
  ip_2 = cp_2.
  ip_3 = cp_3.
  ip_4 = cp_4.


  ENDMETHOD.

  METHOD erg.

        DATA: BEGIN OF ls_struktur,
            name TYPE string,
          END OF ls_struktur.

    DATA lt_tabelle LIKE TABLE OF ls_struktur.

    DATA lv_name TYPE string.


    DATA lv_count1 TYPE i.
    DATA lv_count2 TYPE i.
    DATA lv_count3 TYPE i.
    DATA lv_count4 TYPE i.


    lv_count1 = ( sy-uzeit(2) + sy-uzeit+3(1) + sy-uzeit+4(1) +  sy-uzeit+4(2) ) + ( sy-uzeit+4(1) * 3 + 1 ).
    lv_count2 = ( sy-uzeit(2) + sy-uzeit+3(1) + sy-uzeit+4(1) +  sy-uzeit+4(2) )  + ( sy-uzeit+4(1) ** 3 + 2 ) .
    lv_count3 = ( sy-uzeit(2) + sy-uzeit+3(1) + sy-uzeit+4(1) +  sy-uzeit+4(2) ) +  ( sy-uzeit+4(1) ** 2 + 3 ).
    lv_count4 = ( sy-uzeit(2) + sy-uzeit+3(1) + sy-uzeit+4(1) +  sy-uzeit+4(2) ) + ( sy-uzeit+5(1) * 3 + 1 ).



DO 200 TIMES.

  lt_tabelle = VALUE #( BASE lt_tabelle
                    ( name = ip_1 )
                    ( name = ip_2 )
                    ( name = ip_3 )
                    ( name = ip_4 ) ).
ENDDO.

READ TABLE lt_tabelle INDEX lv_count1 INTO ls_struktur.
rp_erg1 = ls_struktur-name.
READ TABLE lt_tabelle INDEX lv_count2 INTO ls_struktur.
rp_erg2 = ls_struktur-name.
READ TABLE lt_tabelle INDEX lv_count3 INTO ls_struktur.
rp_erg3 = ls_struktur-name.
READ TABLE lt_tabelle INDEX lv_count4 INTO ls_struktur.
rp_erg4 = ls_struktur-name.


  ENDMETHOD.



ENDCLASS.
