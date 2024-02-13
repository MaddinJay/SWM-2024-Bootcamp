*&---------------------------------------------------------------------*
*& Report z_ob_re_mn
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_ob_re_04_fb.
TABLES: mara.      "<------------- WICHTIG, damit SELECT-OPTION ... FOR .... funktioniert
*"Ausagbe
*WRITE 'Hallo Welt'.

PARAMETERS p_value1 TYPE p DECIMALS 2.
PARAMETERS p_prod TYPE c LENGTH 24 OBLIGATORY. "<--- Eingabe ist pflicht

SELECT-OPTIONS s_pnum FOR mara-matnr NO INTERVALS. "<--- NO INTERVALS Es sind keine Intervalle erlaubt

IF p_value1 is INITIAL.
  DATA(lv_message) = |Geben sie einen anderen Betrag als { p_value1 } an.|.
  "Ausgabe einer Meldung - Information
  MESSAGE lv_message TYPE 'I'.

ENDIF.
DATA(lv_brutto) = p_value1 * '1.19'. "<----- Warum wird eine Zahl mit Nachkommestellen in Anführungszeichen geschrieben? Das ist doch dann ein Char?
WRITE lv_brutto.
WRITE : / 'Produkt:' , p_prod.

"Ausgabe der Eingebene Select Options
LOOP AT s_pnum INTO DATA(ls_pnum).
  WRITE: / 'Produktnummer:', ls_pnum-low.
ENDLOOP.
