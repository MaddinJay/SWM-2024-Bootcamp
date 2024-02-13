*&---------------------------------------------------------------------*
*& Report z_report_as_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
* Meine Transaktion: Z_OB_TC011
REPORT z_report_as_01.
TABLES: mara. "Tabellenimport, damit die SELECT-OPTION funktioniert

**********************************************************************
* Variablendeklaration
**********************************************************************
SELECTION-SCREEN BEGIN OF BLOCK main WITH FRAME TITLE TEXT-hdr. "??????
  PARAMETERS p_value TYPE i. "Parameter pv_value
  PARAMETERS p_prdct TYPE c LENGTH 24 OBLIGATORY. "Parameter p_prdct mit Kennzeichen obligatorisch (MUSS-Feld)
SELECTION-SCREEN END OF BLOCK main.

SELECTION-SCREEN BEGIN OF BLOCK radio WITH FRAME TITLE TEXT-rdr.
  PARAMETERS: p_t19 RADIOBUTTON GROUP tax, "Parameter als Radiobutton deklariert
              p_t07 RADIOBUTTON GROUP tax.
SELECTION-SCREEN END OF BLOCK radio.

DATA lv_betrag TYPE p DECIMALS 2. "Variable lv_betrag mit 2 Nachkommastellen
SELECTION-SCREEN BEGIN OF BLOCK pnummern WITH FRAME TITLE TEXT-pnr.
  PARAMETERS p_show AS CHECKBOX. "Parameter p_show als Checkbox deklariert
  SELECT-OPTIONS s_pnum FOR mara-matnr NO INTERVALS. "Select-Option s_pnum wird für das Feld mara-matnr der Tabelle mara ohne! Wertebereiche erstellt
SELECTION-SCREEN END OF BLOCK pnummern.
DATA lv_tax TYPE p DECIMALS 2. "Variable lv_tax mit 2 Nachkommastellen
lv_betrag = p_value * lv_tax.

AT SELECTION-SCREEN.
  LOOP AT SCREEN.
    CASE screen-name.
      WHEN 'P_VALUE'.
        screen-input = abap_false.
      WHEN 'P_PRDCT'.
        screen-input = abap_false.
    ENDCASE.
    MODIFY screen.
  ENDLOOP.
 START-OF-SELECTION.
**********************************************************************
* IF-Schleife
**********************************************************************

  IF p_value IS INITIAL. "Prüft, ob p_value keinen Inhalt beinhaltet.
    DATA(lv_message) = |Geben Sie einen anderen Betrag als { p_value } ein!|. "Wenn p_value keinen Inhalt hat, wird eine Informationsmeldung ausgegeben
    MESSAGE lv_message TYPE 'I'. "Die Nachricht ist vom Typ "Information"
  ENDIF.


  IF p_t19 = abap_true. "Wenn p_t19 angeklickt ist, wird p_value mit lv_tax(1.19) multipliziert
    lv_tax = '1.19'.
    lv_betrag = p_value * lv_tax.
  ELSEIF p_t07 = abap_true. "Wenn p_t07 angeklickt ist, wird p_value mit lv_tax(1.07) multipliziert
    lv_tax = '1.07'.
    lv_betrag = p_value * lv_tax.
  ENDIF.

**********************************************************************
* LOOP-Schleife
**********************************************************************
  IF p_show = abap_true. "Wenn p_show angeklickt ist, wird der Loop durchgeführt (Produktnummer wird angezeigt)
    LOOP AT s_pnum INTO DATA(ls_pnum). "Führt eine Loop-Schleife über die SELECT-OPTION s_pnum auf die Variable ls_pnum durch
      WRITE: / 'Produktnummer:', ls_pnum-low. "low ist eine Spalte der Tabelle s_pnum
    ENDLOOP.
  ENDIF.

**********************************************************************
* Ausgabe
**********************************************************************
  WRITE lv_betrag.
  WRITE: 'Produkt:', p_prdct.
