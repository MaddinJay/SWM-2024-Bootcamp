*&---------------------------------------------------------------------*
*& Report zuh_unterprogramm
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_unterprogramm.

*******************************************************
*Unterprogramm
*******************************************************

FORM zobuh_bigger USING number_1
                        number_2
 CHANGING result.
 IF number_1 > number_2.
 result = number_1.
 ELSE.
 result = number_2.
 ENDIF.
ENDFORM.
*******************************************************
*Ende Unterprogramm
*******************************************************

START-OF-SELECTION.

*******************************************************
*Report
*******************************************************
DATA: lv_result TYPE i,
      lv_zahl1 type i,
      lv_zahl2 type i.

      lv_zahl1 = 100.
      lv_zahl2 = 15.
*******************************************************
*Aufruf vom Unterprogramm
*******************************************************
PERFORM zobuh_bigger USING lv_zahl1 lv_zahl2 CHANGING lv_result.
WRITE |die höhere Zahl lautet: { lv_result } |.
