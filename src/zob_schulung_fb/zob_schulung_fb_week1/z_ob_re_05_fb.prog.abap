*&---------------------------------------------------------------------*
*& Report z_ob_re_mn
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_ob_re_05_fb.
TABLES: mara.      "<------------- WICHTIG, damit SELECT-OPTION ... FOR .... funktioniert
*"Ausagbe
*WRITE 'Hallo Welt'.
DATA: lv_brutto TYPE p DECIMALS 2.
*lv_tax    TYPE p DECIMALS 2.

*PARAMETERS p_value1 TYPE p DECIMALS 2.
*PARAMETERS p_prod TYPE c LENGTH 24 OBLIGATORY. "<--- Eingabe ist pflicht

*Rahmen um den PARAMETERS Block:
SELECTION-SCREEN BEGIN OF BLOCK main WITH FRAME TITLE TEXT-HDR.
  PARAMETERS p_value1 TYPE p DECIMALS 2.
  PARAMETERS p_prod TYPE c LENGTH 24 OBLIGATORY. "<--- Eingabe ist pflicht
SELECTION-SCREEN END OF BLOCK main.

*Radiobutton für Auswahl des MwSt Satz von 7% oder 19%
PARAMETERS: p_t19 RADIOBUTTON GROUP tax DEFAULT 'X',      "DEFAULT 'x' für Vorbelegung vom Button
            p_t07 RADIOBUTTON GROUP tax.

SELECT-OPTIONS s_pnum FOR mara-matnr NO INTERVALS. "<--- NO INTERVALS Es sind keine Intervalle erlaubt

*Checkbox zur Anzeige der Produktnummer
PARAMETERS p_show AS CHECKBOX.              "DEFAULT 'x' für Vorbelegung vom Button

IF p_value1 IS INITIAL.
  DATA(lv_message) = |Geben sie einen anderen Betrag als { p_value1 } an.|.
  "Ausgabe einer Meldung - Information
  MESSAGE lv_message TYPE 'I'.
ENDIF.

DATA lv_tax TYPE p DECIMALS 2 VALUE '0.00'.
IF p_t19 = 'X'.
  lv_tax = '1.19'.
ELSEIF p_t07 = abap_true.
  lv_tax = '1.07'.
ENDIF.

lv_brutto = p_value1 * lv_tax.

WRITE lv_brutto.
ULINE.
WRITE : / 'Produkt:' , p_prod.
IF p_show = abap_true.
  "Ausgabe der Eingebene Select Options
  LOOP AT s_pnum INTO DATA(ls_pnum).
    WRITE: / 'Produktnummer:', ls_pnum-low.
  ENDLOOP.
ENDIF.
