*&---------------------------------------------------------------------*
*& Report zob_report_od_selection_screen
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_report_od_selection_screen.
TABLES: mara.

SELECTION-SCREEN BEGIN OF BLOCK main WITH FRAME TITLE TEXT-hdr.
  PARAMETERS p_value1 TYPE p DECIMALS 2.
  PARAMETERS p_prod TYPE c LENGTH 24 OBLIGATORY.
SELECTION-SCREEN END OF BLOCK main.

SELECTION-SCREEN BEGIN OF BLOCK main1 WITH FRAME TITLE TEXT-odt.
PARAMETERS: p_t19 RADIOBUTTON GROUP tax DEFAULT 'X',
            p_t07 RADIOBUTTON GROUP tax.
SELECTION-SCREEN END OF BLOCK main1.

PARAMETERS p_show AS CHECKBOX.


SELECT-OPTIONS s_pnum FOR mara-matnr NO INTERVALS.

INITIALIZATION.
  p_value1 = '100'.
  MESSAGE 'INITIALIZATION' TYPE 'I'.

AT SELECTION-SCREEN OUTPUT.
  MESSAGE 'output' TYPE 'I'.
  LOOP AT SCREEN.
    IF Screen-name ='p_value1'.
      screen-input = abap_false.
    ENDIF.
    MODIFY SCREEN.
  ENDLOOP.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR s_pnum-low.
  MESSAGE 'value request' TYPE 'I'.
START-OF-SELECTION.
*DATA(lv_tax) ='1.19'.
*DATA(lv_brutto) = p_value1 * lv_tax.
*WRITE lv_brutto.
WRITE : / 'Produkt: ' , p_prod.
 DATA(lv_tax) = '0.00'.
 LOOP AT SCREEN.
  IF p_t19 = 'X'.
    lv_tax = '1.19'.
  ELSEIF p_t07 = 'X'.
    lv_tax = '1.07'.
  ENDIF.
  DATA lv_brutto TYPE curky.
  lv_brutto = p_value1 * lv_tax.
  WRITE: / 'Brutto Betrag: ' , lv_brutto.
  ENDLOOP.
