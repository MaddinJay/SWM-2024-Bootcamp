FUNCTION zem_fuba_zufall.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IV_NAME1) TYPE  STRING
*"     REFERENCE(IV_NAME2) TYPE  STRING
*"     REFERENCE(IV_NAME3) TYPE  STRING
*"     REFERENCE(IV_NAME4) TYPE  STRING
*"----------------------------------------------------------------------
DATA: BEGIN OF ls_struktur,
        name TYPE string,
      END OF ls_struktur.

DATA lt_tabelle LIKE TABLE OF ls_struktur.

DATA lv_name TYPE string.


DATA lv_count TYPE i.
lv_count = ( sy-uzeit+3(1) + sy-uzeit+4(1) + sy-uzeit+4(2) ) + 1.


DO 20 TIMES.

  lt_tabelle = VALUE #( BASE lt_tabelle
                    ( name = iv_name1 )
                    ( name = iv_name2 )
                    ( name = iv_name3 )
                    ( name = iv_name4 ) ).
ENDDO.

READ TABLE lt_tabelle INDEX lv_count INTO ls_struktur.

IF sy-subrc = 0.
  WRITE: /, |Im Funktionsbaustein gewinnt { ls_struktur-name }|.

ELSE.
    Write 'Im Funktionsbaustein hat niemand gewonnen'.

ENDIF.




ENDFUNCTION.
