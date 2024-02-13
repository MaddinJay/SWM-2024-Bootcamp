*&---------------------------------------------------------------------*
*& Report zem_report1
*&---------------------------------------------------------------------*
*MSWST Berechnung nach Eingabe
*&---------------------------------------------------------------------*
REPORT zem_report1.

DATA: lv_steubr  TYPE p DECIMALS 2,
      lv_steunet TYPE p DECIMALS 2.


SELECTION-SCREEN BEGIN OF BLOCK Header WITH FRAME TITLE TEXT-001.

  PARAMETERS: p_netto TYPE p DECIMALS 2,
              p_richt AS CHECKBOX.

  PARAMETERS: p_brutto TYPE p DECIMALS 2,
              p_richt2 AS CHECKBOX.

SELECTION-SCREEN END OF BLOCK Header.



SELECTION-SCREEN BEGIN OF BLOCK mwst WITH FRAME TITLE TEXT-002.

  PARAMETERS: p_t19 RADIOBUTTON GROUP steu DEFAULT 'X',
              P_t07 RADIOBUTTON GROUP steu.

  DATA: lv_tax    TYPE p DECIMALS 2,
        lv_taxdis TYPE n LENGTH 2,
        lv_ergb   TYPE p DECIMALS 2,
        lv_ergn   TYPE p DECIMALS 2.

SELECTION-SCREEN END OF BLOCK mwst.


IF p_t19 = abap_true.
  lv_tax = '1.19'.
  lv_taxdis = '19'.
ELSE.
  lv_tax = '1.07'.
  lv_taxdis = '7'.
ENDIF.


IF p_richt >< abap_true AND p_netto > 0 AND p_richt2 >< abap_true AND p_brutto > 0.
  DATA(lv_message33) = |Bitte Berechnung aktivieren. Andernfalls erfolgt keine Ausgabe der gewünschen Beträge!|.
  MESSAGE lv_message33 TYPE 'I'.

ENDIF.

IF p_richt >< abap_true AND p_netto > 0 OR p_richt2 >< abap_true AND p_brutto > 0.
  DATA(lv_message44) = |Für eine Eingabe wurde die Berechnung nicht aktiviert. Ausgabe erfolgt nur für aktivierte Berechnungen!|.
  MESSAGE lv_message44 TYPE 'S'.


ENDIF.


IF p_richt = abap_true AND p_netto IS INITIAL.
  DATA(lv_message) = |Fehlende Eingabe eines Nettobetrages!|.
  MESSAGE lv_message TYPE 'I'.

  WRITE:  '|', 'Berechnung Netto --> Brutto:', 'Es wurde kein Nettobetrag für die gewünschte Berechnung eingegeben!'.
  ULINE.

ELSEIF p_richt = abap_true.
  lv_ergb = p_netto * lv_tax.
  lv_steunet = lv_ergb - p_netto.
  ULINE.
  WRITE:  /, |Netto zu Brutto mit { lv_taxdis }%:|.
  ULINE.
  ULINE.
  WRITE:  '|', 'Nettobetrag:', p_netto, '|',
          '|','Bruttobetrag:', lv_ergb,'|',
          '|','Steuerbetrag:', lv_steunet,'|'.
  ULINE.

  SKIP 2. ULINE.

ENDIF.

IF p_richt2 = abap_true AND p_brutto IS INITIAL.
  DATA(lv_message2) = |Fehlende Eingabe eines Bruttobetrages!|.
  MESSAGE lv_message2 TYPE 'I'.

  ULINE.
  WRITE: '|', 'Berechnung Brutto --> Netto:', 'Es wurde kein Bruttobetrag für die gewünschte Berechnung eingegeben!'.
  ULINE.

ELSEIF p_richt2 = abap_true.
  lv_ergn = p_brutto / lv_tax.
  lv_steubr = p_brutto - lv_ergn.

  ULINE.
  WRITE: /,|Brutto zu Netto mit { lv_taxdis }%:'|.
  ULINE.
  ULINE.
  WRITE: '|', 'Bruttobetrag', p_brutto, '|',
        '|', 'Nettobetrag:', lv_ergn, '|',
        '|', 'Steuerbetrag:', lv_steubr, '|'.
  ULINE.

ENDIF.





*TYPES: BEGIN OF ty_langu,
*         land1 TYPE t002-SPRAS,
*       END OF ty_langu.
*
*DATA: lt_langu TYPE TABLE OF ty_langu.
*
*SELECT SPRAS
*  FROM t002
*  INTO TABLE @lt_langu
*  WHERe spras like 'A'.
*
*LOOP AT lt_langu INTO DATA(ls_langu).
*  WRITE: / ls_langu-land1.
*ENDLOOP.
