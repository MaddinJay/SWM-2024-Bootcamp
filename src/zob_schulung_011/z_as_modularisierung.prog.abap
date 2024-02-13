*&---------------------------------------------------------------------*
*& Report z_as_modularisierung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_as_modularisierung.

**********************************************************************
* Definition im Programm
**********************************************************************
*FORM test1  USING zahl1 TYPE i "Using sind Importparameter
*zahl2 TYPE i
*CHANGING ergebnis TYPE i.
*
*  IF zahl1 > zahl2.
*    ergebnis = zahl1.
*  ELSE.
*    ergebnis = zahl2.
*  ENDIF.
*
*ENDFORM.

**********************************************************************
* Aufruf im Programm
**********************************************************************
*START-OF-SELECTION.
*  DATA lv_ergebnis TYPE i.
*  PERFORM test1 USING 5 15 CHANGING lv_ergebnis.
*  WRITE lv_ergebnis.
*
*END-OF-SELECTION.

* Erstellt ein Unterprogramm welches das erste Wort eines Satzes ausgibt.
* Ruft das Unterprogramm auf.

*FORM ausgabe USING text1 TYPE string
*CHANGING satz TYPE string.
*
*  SPLIT text1 AT space INTO satz DATA(satz2).
*
*ENDFORM.
*
*START-OF-SELECTION.
*  DATA lv_satz TYPE string.
*
*  PERFORM ausgabe USING 'Das ist ein Satz' CHANGING lv_satz.
*  WRITE lv_satz.

*Erstellt ein Unterprogramm welches das dreifach einer Zahl zurück gibt.
*Ruft das Unterprogramm auf und lasst euch das Ergebnis ausgeben.

*FORM verdreifachen USING zahl1 TYPE i
*CHANGING result TYPE i.
*
*  result = zahl1 * 3.
*ENDFORM.
*
*START-OF-SELECTION.
*  DATA lv_result TYPE i.
*  PERFORM verdreifachen USING 5 CHANGING lv_result.
*  WRITE lv_result.
*
*END-OF-SELECTION.

*Erstellen Sie einen Funktionsbaustein, welcher die Potenz berechnet

*DATA: lv_result TYPE int4.
*
*CALL FUNCTION 'Z_OBAS_FM_011'
*  EXPORTING
*    ip_basis    = 5
*    ip_exponent = 7
*  IMPORTING
*    ep_result   = lv_result.
*WRITE: 'Ergebnis: ', lv_result.

*DATA: lv_summe TYPE i.
*
*CALL FUNCTION 'Z_OBAS_FM_011'
*  EXPORTING
*    ip_summand1 = 7
*  IMPORTING
*    ep_summe    = lv_summe.
*WRITE: 'Ergebnis: ', lv_summe.

*PARAMETERS p_name TYPE string.
*DATA lv_name type string.
*lv_name = p_name.
DATA lv_result TYPE string.

CALL FUNCTION 'Z_OBAS_FM_011_CUSTOMER'
  EXPORTING
    iv_name   = ''
  IMPORTING
    ev_result = lv_result.
WRITE: 'Ergebnis: ', lv_result.
