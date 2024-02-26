*&---------------------------------------------------------------------*
*& Report zem_1armig
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_1armig.


SELECTION-SCREEN BEGIN OF LINE.
  PARAMETERS: p_1 TYPE n LENGTH 3.
  SELECTION-SCREEN POSITION 40.
  PARAMETERS: p_2 TYPE n LENGTH 3.
  PARAMETERS: p_3 TYPE n LENGTH 3.
  SELECTION-SCREEN POSITION 75.
  PARAMETERS: p_4 TYPE n LENGTH 3.
SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN SKIP.

PARAMETERS p_erg TYPE i DEFAULT 0.
PARAMETERS p_anzahl TYPE i DEFAULT 0.

SELECTION-SCREEN SKIP 2.

SELECTION-SCREEN BEGIN OF LINE.

  SELECTION-SCREEN PUSHBUTTON (80) spielen USER-COMMAND fc.
SELECTION-SCREEN END OF LINE.
SELECTION-SCREEN BEGIN OF LINE.
  SELECTION-SCREEN PUSHBUTTON (80) cancel USER-COMMAND exec.
SELECTION-SCREEN END OF LINE.

INITIALIZATION.
  spielen = icon_pm_free && 'Spiele und verliere'.
  cancel = icon_set_copy_in_a && 'Inhalte löschen'.


  DATA lv_erg1 TYPE string.
  DATA lv_erg2 TYPE string.
  DATA lv_erg3 TYPE string.
  DATA lv_erg4 TYPE string.

  DATA lv_anzahl TYPE i VALUE 0.
  DATA lv_count TYPE i VALUE 0.

AT SELECTION-SCREEN.

  DATA(lo_zufall) = NEW zem_class_zufall( cp_1 = '1'
                                          cp_2 = '2'
                                          cp_3 = '3'
                                          cp_4 = '4' ).

  CASE sy-ucomm.

    WHEN 'EXEC'.

      CLEAR: p_1, p_2, p_3, p_4, p_anzahl, p_erg.

      EXIT.

    WHEN 'FC'.

    lo_zufall->erg( IMPORTING rp_erg1 = lv_erg1
                              rp_erg2 = lv_erg2
                              rp_erg3 = lv_erg3
                              rp_erg4 = lv_erg4 ).


      p_1 = lv_erg1.
      p_2 = lv_erg2.
      p_3 = lv_erg3.
      p_4 = lv_erg4.

  ENDCASE.

  IF p_1 = p_2 AND p_3 = p_4 AND p_4 = p_1.

    lv_count = 6.

 elseif p_2 = p_3 and p_1 = p_4.

 lv_count = 4.

  ELSEIF  p_2 = p_1 or p_2 = p_3.

    lv_count = 2.

  ELSEIF p_3 = p_4 AND p_2 = p_3.

    lv_count = 1.

  ELSEIF p_1 = p_2 AND p_2 = p_3.

    lv_count = 1.

  ELSEIF p_2 = p_3.

    lv_count = 3.

  ELSEIF p_1 = p_4 .

    lv_count = 2.

  ELSE.

    lv_count = -2.

  ENDIF.

  IF p_anzahl < 10.

    p_erg = p_erg + lv_count.


    p_anzahl = p_anzahl + 1.

  ELSEif p_anzahl >= 10.

    MESSAGE | Ergebnis nach 10 Spielen: { p_erg } Punkte | TYPE 'I'.

    p_anzahl = 0.


  IF p_erg > 0.
  message |Deine Punktzahl ist positiv. Du hast gewonnen | type 'I'.
  Else.
  message |Deine Punktzahl ist negativ. Du hast verloren | type 'I'.
  Endif.

  ENDIF.
