*&---------------------------------------------------------------------*
*& Report zaw_report_mi
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_report_mi2.

**********************************************************************
TABLES: mara. "SAP Standard-Tabelle für Materialwirtschaft

*** Eingabefeld für den User

PARAMETERS: p_wert TYPE p DECIMALS 2 OBLIGATORY. "Ziffernfeld (Dezimalzahl mit 2 Nachkommastellen)

SELECTION-SCREEN BEGIN OF BLOCK steuer WITH FRAME TITLE TEXT-002.
  PARAMETERS: p_t19 RADIOBUTTON GROUP tax DEFAULT 'X',
              p_t07 RADIOBUTTON GROUP tax.
SELECTION-SCREEN END OF BLOCK steuer.

PARAMETERS p_show AS CHECKBOX.

*PARAMETERS p_prod TYPE c LENGTH 24 OBLIGATORY. "Textfeld mit max. 24 Stellen - Pflichtfeld
*SELECT-OPTIONS s_pnum FOR mara-matnr NO INTERVALS. "Es können mehrere Einzelwerte vom User eingegeben werden.

DATA: lv_brutto TYPE p DECIMALS 2. "lokale Variable für Bruttobetrag (Dezimalzahl mit 2 Nachkommastellen)
DATA: lv_taxamount TYPE p DECIMALS 2.
DATA(lv_tax) = '0.00'.
DATA lv_steu TYPE string.

**********************************************************************
*** Nachricht für User ausgeben

*IF p_wert IS INITIAL. "Wenn nichts angegeben wird, dann wird der Initialwert ausgegeben.
*  DATA(lv_message) = |Es wurde kein Nettobetrag eingegeben, deshalb wird { p_wert } ausgegeben.|.
*  MESSAGE lv_message TYPE 'I'.
*ENDIF.
*MESSAGE lv_message TYPE 'I' DISPLAY LIKE 'W'. "Information mit Warnungs-Icon
*MESSAGE lv_message TYPE 'W' DISPLAY LIKE 'I'. "Warnung mit Info-Icon
**********************************************************************

IF p_t19 = abap_true.
  lv_tax = '1.19'.
  lv_steu = '19'.
ELSEIF p_t07 = abap_true.
  lv_tax = '1.07'.
  lv_steu = '7'.
ENDIF.
lv_brutto = p_wert * lv_tax.

IF p_show = abap_true.
  IF p_t19 = abap_true.
    lv_tax = '0.19'.
    lv_steu = '19'.
  ELSEIF p_t07 = abap_true.
    lv_tax = '0.07'.
    lv_steu = '7'.
  ENDIF.
  lv_taxamount = p_wert * lv_tax.
ENDIF.

WRITE: / |Nettobetrag: { p_wert } Euro|.
WRITE: / |Steuersatz: { lv_steu } %|.
IF p_show = abap_true.
  WRITE: / |Steuerbetrag: { lv_taxamount } Euro|.
ENDIF.
WRITE: / |Bruttobetrag: { lv_brutto } Euro|.
