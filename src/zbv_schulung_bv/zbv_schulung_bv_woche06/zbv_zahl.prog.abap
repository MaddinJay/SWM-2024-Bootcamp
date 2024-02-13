*&---------------------------------------------------------------------*
*& Report zbv_zahl
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbv_zahl.

FORM zbv_zahl_U USING number_1 TYPE int1 "Bei Form startet das Unterprogramm
                    number_2 TYPE int1
           CHANGING result TYPE int1.

  IF number_1 > number_2.
    result = number_1.
  ELSE.
    result = number_2.
  ENDIF.

ENDFORM.                                 "Bei Endform endet das Unterprogramm

START-OF-SELECTION. "Muss benutzt werden, damit das Unterprogramm performt werden kann.
DATA lv_result TYPE int1.

PERFORM zbv_zahl_U USING 30 22 CHANGING lv_result. "Unterprogramm ZBV_ZAHL_U wird aufgerufen
WRITE lv_result.
