*&---------------------------------------------------------------------*
*& Report zob_sb2_datenerfassung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_sb2_datenerfassung.

SELECTION-SCREEN BEGIN OF BLOCK a WITH FRAME.

**********************************************************************
* Eingabeparameter
**********************************************************************
  PARAMETERS: p_kdnr   TYPE zob_sb2_tickets-kundennummer OBLIGATORY,
              p_tnr    TYPE zob_sb2_tickets-ticketnummer OBLIGATORY,
              p_kname  TYPE zob_sb2_tickets-kundenname OBLIGATORY,

**********************************************************************
* Radiobutton für die Auswahl der Störung
**********************************************************************

              r1 RADIOBUTTON GROUP rad1,
              r2 RADIOBUTTON GROUP rad1,
              r3 RADIOBUTTON GROUP rad1,
              p_anmerk TYPE zob_sb2_tickets-anmerkung OBLIGATORY.

SELECTION-SCREEN END OF BLOCK a.



DATA go_bearbeitung TYPE REF TO zob_sb2_cl_db_bearbeitung.

go_bearbeitung = NEW #( ).

***********************************************************************************
*IF-Formel mit Methode der Datenerfassung für Zuweisung der Störung (fallabhängig)
***********************************************************************************

IF r1 = 'X'.
go_bearbeitung->einfuegen( iv_kdnr = p_kdnr
                           iv_tnr = p_tnr
                           iv_rad = 'STROMAUSFALL'
                           iv_kname = p_kname
                           iv_anmerk = p_anmerk ).
ELSEIF r2 = 'X'.
go_bearbeitung->einfuegen( iv_kdnr = p_kdnr
                           iv_tnr = p_tnr
                           iv_rad = 'ZÄHLERDEFEKT'
                           iv_kname = p_kname
                           iv_anmerk = p_anmerk ).
ELSEIF r3 = 'X'.
go_bearbeitung->einfuegen( iv_kdnr = p_kdnr
                           iv_tnr = p_tnr
                           iv_rad = 'ZÄHLERVERWECHSLUNG'
                           iv_kname = p_kname
                           iv_anmerk = p_anmerk ).
ENDIF.

**********************************************************************
*Methode zum Aufruf der ALV-Tabelle
**********************************************************************

go_bearbeitung->alv_aufruf_datenerfassung( ).
