*&---------------------------------------------------------------------*
*& Report ZEM_DOLLARSPIEL
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZEM_DOLLARSPIEL.

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

IF p_richt >< abap_true and p_netto > 0 OR p_richt >< abap_true and p_brutto > 0.
  Data(lv_message33) = |Berechnung ist nicht aktiviert|.
  MESSAGE lv_message33 type 'S'.

  Write: 'Berechnung war für min. 1 Betrag nicht aktiviert:', /.

  Uline.

Endif.

*IF p_richt >< abap_true and p_brutto > 0.
*  Data(lv_message33) = |Berechnung (Brutto --> Netto) war nicht ativiet. Keine Ausgabe!|.
*  MESSAGE lv_message33 type 'S'.
*
*Endif.



  IF p_richt = abap_true AND p_netto IS INITIAL.
    DATA(lv_message) = |Fehlende Eingabe eines Nettobetrages!|.
    MESSAGE lv_message TYPE 'I'.

    ULINE.

    WRITE 'Berechnung Brutto --> Netto:'.
    ULINE.
    WRITE 'Es wurde kein Nettobetrag für die gewünschte Berechnung eingegeben!'.

    SKIP 2.


  ELSEIF p_richt = abap_true.
    lv_ergb = p_netto * lv_tax.
    WRITE:  /, |Netto zu Brutto mit { lv_taxdis }%:|.
    ULINE.
    WRITE:  'Nettobetrag:', p_netto, /,
            'Bruttobetrag:', lv_ergb, /.

    ULINE.

  ENDIF.

  IF p_richt2 = abap_true AND p_brutto IS INITIAL.
    DATA(lv_message2) = |Fehlende Eingabe eines Bruttobetrages!|.
    MESSAGE lv_message2 TYPE 'I'.

    ULINE.

    WRITE 'Berechnung Netto --> Brutto:'.
    ULINE.
    WRITE 'Es wurde kein Bruttobetrag für die gewünschte Berechnung eingegeben!'.

    SKIP 2.

  ELSEIF p_richt2 = abap_true.
    lv_ergn = p_brutto / lv_tax.

    WRITE: /,|Brutto zu Netto mit { lv_taxdis }%:'|.
    ULINE.
    WRITE: 'Bruttobetrag', p_brutto, /,
           'Nettobetrag:', lv_ergn, /.

    ULINE.

  ENDIF.





.
