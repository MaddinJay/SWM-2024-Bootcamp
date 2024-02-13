*&---------------------------------------------------------------------*
*& Report z_ob_re_mn
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_ob_re_mn_03.
*"Ausagbe
*WRITE 'Hallo Welt'.

PARAMETERS p_value1 TYPE p DECIMALS 2.
PARAMETERS p_prod TYPE c LENGTH 24 OBLIGATORY. "<--- Eingabe ist pflicht

IF p_value1 IS INITIAL.
  DATA(lv_message) = |Geben sie einen anderen Betrag als { p_value1 } an.|.
  "Ausgabe einer Meldung - Information (es gibt weiter Typen)
  MESSAGE lv_message TYPE 'W'.

ENDIF.
DATA(lv_brutto) = p_value1 * '1.19'.
WRITE : / 'Brutto', lv_brutto.
WRITE : / 'Produkt:' , p_prod.
