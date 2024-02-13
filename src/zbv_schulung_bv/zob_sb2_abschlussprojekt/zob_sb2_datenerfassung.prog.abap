*&---------------------------------------------------------------------*
*& Report zob_sb2_datenerfassung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_sb2_datenerfassung.

SELECTION-SCREEN BEGIN OF BLOCK a WITH FRAME.
  PARAMETERS: p_kdnr   TYPE zob_sb2_tickets-kundennummer OBLIGATORY,
              p_tnr    TYPE zob_sb2_tickets-ticketnummer OBLIGATORY,
              p_kname  TYPE zob_sb2_tickets-kundenname OBLIGATORY,
              p_anlieg TYPE zob_sb2_tickets-anliegen OBLIGATORY.
SELECTION-SCREEN END OF BLOCK a.



DATA go_bearbeitung TYPE REF TO zob_sb2_cl_db_bearbeitung.

go_bearbeitung = NEW #( ).

go_bearbeitung->einfuegen( iv_kdnr = p_kdnr
                           iv_tnr = p_tnr
                           iv_kname = p_kname
                           iv_anlieg = p_anlieg ).
go_bearbeitung->alv_aufruf( ).
