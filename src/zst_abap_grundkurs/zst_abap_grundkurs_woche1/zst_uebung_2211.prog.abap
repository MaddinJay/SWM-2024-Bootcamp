*&---------------------------------------------------------------------*
*& Report zst_uebung_2211
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_uebung_2211.
Load-of-Program.


*Write 'Hello World'.

**********************************************************************
*Parameter
**********************************************************************
TABLES: mara.
SELECTION-SCREEN BEGIN OF BLOCK main WITH FRAME TITLE TEXT-001.
  PARAMETERS p_wert1 TYPE p DECIMALS 2.
  PARAMETERS p_prod TYPE c LENGTH 24 OBLIGATORY. "Pflichteingabe


  DATA lv_brutto TYPE p DECIMALS 2.
  SELECTION-SCREEN END OF BLOCK main.
SELECTION-SCREEN BEGIN OF BLOCK main2 WITH FRAME TITLE TEXT-002.
  PARAMETERS: p_t19 RADIOBUTTON GROUP tax DEFAULT 'X',
              p_t07 RADIOBUTTON GROUP tax.

  IF p_t19 = 'X'.
    lv_brutto = p_wert1 * '1.19'.
  ELSE.
    lv_brutto = p_wert1 * '1.07'.
  ENDIF.

  IF p_wert1 IS INITIAL. "Wenn nur Initialwert befüllt ist gib einen Fehler aus.
    DATA(lv_message) = |Geben sie einen anderen Betrag als { p_wert1 } an.|.
    MESSAGE lv_message TYPE 'I'.
  ENDIF.
 SELECTION-SCREEN END OF BLOCK main2.

SELECTION-SCREEN BEGIN OF BLOCK main3 WITH FRAME TITLE TEXT-003.
  SELECT-OPTIONS s_pnum FOR mara-matnr NO INTERVALS.
  PARAMETERS p_show AS CHECKBOX DEFAULT 'X'.

  IF p_show = 'X'.
    LOOP AT s_pnum INTO DATA(ls_pnum).
      WRITE: / 'Produktnummer:', ls_pnum-low.
    ENDLOOP.
  ENDIF.
  SELECTION-SCREEN END OF BLOCK main3.

  WRITE: / 'Betrag:', p_wert1.
  WRITE: / 'Bruttobetrag:', lv_brutto.

  WRITE: / 'Produkt:', p_prod.
