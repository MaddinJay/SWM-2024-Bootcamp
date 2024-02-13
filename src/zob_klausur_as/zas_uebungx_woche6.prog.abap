*&---------------------------------------------------------------------*
*& Report zas_uebungx_woche6
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zas_uebungx_woche6.

*Erstellen Sie mehrere Unterprogramm in Ihrem Report, welcher von zwei Zahlen die größere Zahl zurückgibt.
*FORM zob$$_bigger USING number_1 TYPE int1
*                        number_2 TYPE int1
*                  CHANGING result TYPE int1.
*  IF number_1 > number_2.
*    result = number_1.
*  ELSE.
*    result = number_2.
*  ENDIF.
*ENDFORM.
*
*START-OF-SELECTION.
*  DATA: lv_result TYPE int1.
*  PERFORM zob$$_bigger USING 25 15 CHANGING lv_result.
*  WRITE lv_result.
*END-OF-SELECTION.
*Wenn Sie Perform über der Implementierung (FORM) schreiben können Sie START-OF-SELECTION weglassen

**********************************************************************
*Rufen Sie Ihren Funktionsbaustein von einem Report aus auf.

*DATA: lv_result TYPE int4.
*PARAMETERS: p_1 TYPE int1, p_2 TYPE int1.
*
*CALL FUNCTION 'Z_AS_FM_011'
*  EXPORTING
*    ip_basis    = p_1 "5
*    ip_exponent = p_2 "7
*  IMPORTING
*    ep_result   = lv_result.
*
*WRITE lv_result.

**********************************************************************
*Erstellen Sie einen Funktionsbaustein, welcher die ersten X Fibonacci Zahlen zurückgibt.
*Ordnen Sie den neuen Funktionsbaustein Ihrer Funktionsgruppe ZOB$$_FG_### zu.

*DATA: lv_fibo1    TYPE i,
*      lv_ergebnis TYPE i.
*
*CALL FUNCTION 'Z_AS_FM_011_FIBONACCI'
*  EXPORTING
*    ip_zahl1  = 10
*  IMPORTING
*    ep_result = lv_ergebnis.
*
*WRITE lv_ergebnis.

*Gibt die 10. Stelle der Fibonacci Reihenfolge aus
