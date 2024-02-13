*&---------------------------------------------------------------------*
*& Report zaw_zahlen_form
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_zahlen_form.

*PARAMETERS: p_zahl1 TYPE i,
*            p_zahl2 TYPE i.
*
*DATA: cv_back TYPE i,
*      gv_back TYPE i.
*
*PERFORM unterprogramm USING p_zahl1
*                            p_zahl2
*                      CHANGING gv_back.
*
*WRITE gv_back.
*
** Wenn die Implementierung (FORM) unter dem Aufruf (PERFORM) steht, dann benötigt man kein START-OF-SELECTION.
*
*FORM unterprogramm USING iv_zahl1 TYPE i
*                         iv_zahl2 TYPE i
*                   CHANGING cv_back.
*
*  IF iv_zahl1 > iv_zahl2.
*    cv_back = iv_zahl1.
*  ELSE.
*    cv_back = iv_zahl2.
*  ENDIF.
*
*ENDFORM.
*
DATA: lv_result TYPE int4.

CALL FUNCTION 'Z_AW_FM_RECHNER'
  EXPORTING
    ip_basis    = 5
    ip_exponent = 7
  IMPORTING
    ep_result   = lv_result.

WRITE lv_result.

**********************************************************************

DATA: lv_fibo TYPE int4.

CALL FUNCTION 'Z_AW_FM_FIBONACCI'
  EXPORTING
    ip_zahl1 = 0
    ip_zahl2 = 1
  IMPORTING
    ep_fibo  = lv_fibo.

WRITE lv_fibo.
