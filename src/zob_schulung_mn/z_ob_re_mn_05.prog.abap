*&---------------------------------------------------------------------*
*& Report z_ob_re_mn
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_ob_re_mn_05.
TABLES: mara.      "<------------- WICHTIG, damit SELECT-OPTION ... FOR .... funktioniert
*"Ausagbe
*WRITE 'Hallo Welt'.

SELECTION-SCREEN BEGIN OF BLOCK main WITH FRAME TITLE TEXT-HDR.
  PARAMETERS p_value1 TYPE p DECIMALS 2.
  PARAMETERS p_prod TYPE c LENGTH 24 OBLIGATORY. "<--- Eingabe ist pflicht
SELECTION-SCREEN END OF BLOCK main.

"Es muss der MWSt. Betrag gewählt werden
PARAMETERS: p_t19 RADIOBUTTON GROUP tax DEFAULT 'X',
            p_t07 RADIOBUTTON GROUP tax.

SELECT-OPTIONS s_pnum FOR mara-matnr NO INTERVALS. "<--- NO INTERVALS Es sind keine Intervalle erlaubt

"Checkbox zur Azeige der Produktnummer
PARAMETERS p_show AS CHECKBOX DEFAULT 'X'. "<--- Kann ich das Feld auch standardmäßig vorbelegen?

IF p_value1 IS INITIAL.
  DATA(lv_message) = |Geben sie einen anderen Betrag als { p_value1 } an.|.
  "Ausgabe einer Meldung - Information
  MESSAGE lv_message TYPE 'I'.

ENDIF.
DATA(lv_tax) = '0.00'.
IF p_t19 = abap_true.
  lv_tax = '1.19'.
ELSEIF p_t07 = abap_true.
  lv_tax = '1.07'.
ENDIF.

DATA(lv_brutto) = p_value1 * lv_tax.
WRITE lv_brutto.
WRITE : / 'Produkt:' , p_prod.
IF p_show = abap_true.
  "Ausgabe der Eingebene Select Options
  LOOP AT s_pnum INTO DATA(ls_pnum).
    WRITE: / 'Produktnummer:', ls_pnum-low.
  ENDLOOP.
ENDIF.
