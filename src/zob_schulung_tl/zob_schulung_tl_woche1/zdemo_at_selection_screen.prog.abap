*&---------------------------------------------------------------------*
*& Report zdemo_at_selection_screen
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zdemo_at_selection_screen.

TABLES: mara.

DATA: gv_condition1 TYPE abap_bool,
      gv_condition2 TYPE abap_bool.

PARAMETERS: pv_fld1 TYPE i,
            pv_fld2 TYPE i.

* Start des Selektionsbildschirms
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE text-001.

PARAMETERS: pv_fld3 TYPE i.

SELECTION-SCREEN END OF BLOCK b1.

* SELECT-OPTIONS für die Tabelle MARA
SELECT-OPTIONS s_pnum FOR mara-matnr.

* Weitere Parameter oder Logik können hier hinzugefügt werden.

AT SELECTION-SCREEN OUTPUT.
  LOOP AT SCREEN.
    CASE screen-group1.
      WHEN 'PV_FLD1'.
        " Bedingung für die Deaktivierung von pv_fld1
        IF gv_condition1 = abap_true.
          screen-input = 0. " Deaktiviere die Eingabe für pv_fld1
        ENDIF.
      WHEN 'PV_FLD2'.
        " Bedingung für die Inaktivierung von pv_fld2
        IF gv_condition2 = abap_true.
          screen-active = 0. " Mache pv_fld2 inaktiv
        ENDIF.
    ENDCASE.
  ENDLOOP.

* Weitere Logik kann hier hinzugefügt werden, um die Bedingungen gv_condition1 und gv_condition2 festzulegen.

* Hauptlogik des Programms
START-OF-SELECTION.
  " Dein Hauptprogrammcode hier
  " Verwende die Werte von pv_fld1, pv_fld2, usw.

  " Beispiel: Zugriff auf die SELECT-OPTIONS-Werte
  LOOP AT s_pnum.
    WRITE: / 'Selected Material Number:', s_pnum-sign,
           / 'Material Number:', s_pnum-low,
           / 'To:', s_pnum-high.
  ENDLOOP.
