*&---------------------------------------------------------------------*
*& Report z_ob_re_mn
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_ob_re_mn_04.
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

PARAMETERS: p_t07 RADIOBUTTON GROUP tax ,
           p_t19 RADIOBUTTON GROUP tax DEFAULT 'X'.

DATA: gv_tax TYPE p DECIMALS 2.

if p_t07 = abap_true.
         gv_tax = '0.07'.
 else.
  p_t19 = abap_true.
        gv_tax = '0.19'.
endif.

DATA: gv_erg TYPE p DECIMALS 2.
      gv_erg = p_value1 * gv_tax.

WRITE: / 'tax ergebnisse: ' , gv_erg.

ENDIF.
DATA(lv_brutto) = p_value1 * gv_tax. "<----- Warum wird eine Zahl mit Nachkommestellen in Anführungszeichen geschrieben? Das ist doch dann ein Char?
WRITE: / 'Bruttokosten betragen: ' , lv_brutto.
WRITE : / 'Produkt:' , p_prod.

"Ausgabe der Eingebene Select Options
LOOP AT s_pnum INTO DATA(ls_pnum).
  WRITE: / 'Produktnummer:', ls_pnum-low.
ENDLOOP.




WRITE gv_erg.
