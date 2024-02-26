CLASS zem_class_cube_erg DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS: wuerfeln IMPORTING iv_auge1 TYPE string
                                iv_auge2 TYPE string
                                iv_auge3 TYPE string
                                iv_auge4 TYPE string.


    METHODS: get_erg RETURNING VALUE(rv_erg) TYPE string.


Methods: set_erg exporting ev_erg type string.


    DATA mv_erg TYPE string.
    DATA mv_erg1 TYPE string.


  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zem_class_cube_erg IMPLEMENTATION.
  METHOD get_erg.

    rv_erg = mv_erg.


  ENDMETHOD.

    METHOD set_erg.

    ev_erg = mv_erg1.


  ENDMETHOD.


  METHOD wuerfeln.

    DATA: BEGIN OF ls_struktur,
            name TYPE string,
          END OF ls_struktur.

    DATA lt_tabelle LIKE TABLE OF ls_struktur.

    DATA lv_name TYPE string.


    DATA lv_count TYPE i.
    lv_count = ( sy-uzeit(2) + sy-uzeit+3(1) + sy-uzeit+4(1) +  sy-uzeit+4(2) ) + 1.


    DO 80 TIMES.

      lt_tabelle = VALUE #( BASE lt_tabelle
                        ( name = iv_auge1 )
                        ( name = iv_auge2 )
                        ( name = iv_auge3 )
                        ( name = iv_auge4 ) ).
    ENDDO.

    READ TABLE lt_tabelle INDEX lv_count INTO ls_struktur.

    IF sy-subrc = 4.

      WRITE 'kein Ergebnis, bitte versuchen Sie es erneut'.

    ENDIF.


    mv_erg = ls_struktur-name.

    mv_erg1 = ls_struktur-name.



  ENDMETHOD.



ENDCLASS.
