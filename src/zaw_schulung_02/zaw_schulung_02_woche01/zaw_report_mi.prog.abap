*&---------------------------------------------------------------------*
*& Report zaw_report_mi
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_report_mi.

**********************************************************************
TABLES: mara. "SAP Standard-Tabelle für Materialwirtschaft

*** Eingabefeld für den User

PARAMETERS: p_wert TYPE p DECIMALS 2. "Ziffernfeld (Dezimalzahl mit 2 Nachkommastellen)

SELECTION-SCREEN BEGIN OF BLOCK steuer WITH FRAME TITLE TEXT-002. "Rahmen um Optionsgruppe mit Überschrift
  PARAMETERS: p_t19 RADIOBUTTON GROUP tax DEFAULT 'X',
              p_t07 RADIOBUTTON GROUP tax.
SELECTION-SCREEN END OF BLOCK steuer.

PARAMETERS p_show AS CHECKBOX.

*PARAMETERS p_prod TYPE c LENGTH 24 OBLIGATORY. "Textfeld mit max. 24 Stellen - Pflichtfeld

SELECT-OPTIONS s_pnum FOR mara-matnr NO INTERVALS. "Es können mehrere Einzelwerte vom User eingegeben werden.

DATA: lv_brutto TYPE p DECIMALS 2. "lokale Variable für Bruttobetrag (Dezimalzahl mit 2 Nachkommastellen)
DATA(lv_tax) = '0.00'.
DATA lv_steu TYPE string.

*** Nachricht für User ausgeben

*IF p_wert IS INITIAL. "Wenn nichts angegeben wird, dann wird der Initialwert ausgegeben.
*  DATA(lv_message) = |Es wurde kein Nettobetrag eingegeben, deshalb wird { p_wert } ausgegeben.|.
*  MESSAGE lv_message TYPE 'I'.
*ENDIF.
*MESSAGE lv_message TYPE 'I' DISPLAY LIKE 'W'. "Information mit Warnungs-Icon
*MESSAGE lv_message TYPE 'W' DISPLAY LIKE 'I'. "Warnung mit Info-Icon

IF p_t19 = abap_true.
  lv_tax = '1.19'.
  lv_steu = '19'.
ELSEIF p_t07 = abap_true.
  lv_tax = '1.07'.
  lv_steu = '7'.
ENDIF.
lv_brutto = p_wert * lv_tax.

*** Ausgabe im Programm
IF p_show = abap_true.
  LOOP AT s_pnum INTO DATA(ls_pnum).
    WRITE: / 'Produktnummer:', ls_pnum-low.
  ENDLOOP.
ELSEIF p_show = abap_false.
ENDIF.

WRITE: / 'Nettobetrag: ', p_wert.
WRITE: / |Steuersatz { lv_steu } %|.
WRITE: / 'Bruttobetrag: ' , lv_brutto.
