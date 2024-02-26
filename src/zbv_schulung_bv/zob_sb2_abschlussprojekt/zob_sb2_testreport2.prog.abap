*&---------------------------------------------------------------------*
*& Report zob_sb2_testreport2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_sb2_testreport2.

*SELECTION-SCREEN BEGIN OF SCREEN 100.
  PARAMETERS: p_kdnr   TYPE zob_sb2_tickets-kundennummer OBLIGATORY,
              p_tnr    TYPE zob_sb2_tickets-ticketnummer OBLIGATORY,
              p_kname  TYPE zob_sb2_tickets-kundenname OBLIGATORY,
              r1 RADIOBUTTON GROUP rad1,
              r2 RADIOBUTTON GROUP rad1,
              r3 RADIOBUTTON GROUP rad1,
              p_anmerk TYPE zob_sb2_tickets-anmerkung OBLIGATORY.
*SELECTION-SCREEN END OF SCREEN 100.


*SELECTION-SCREEN BEGIN OF SCREEN 200.
DATA go_bearbeitung TYPE REF TO zob_sb2_cl_db_bearbeitung.

go_bearbeitung = NEW #( ).

go_bearbeitung->alv_aufruf_datenerfassung( ).
*SELECTION-SCREEN END OF SCREEN 200.

*START-OF-SELECTION.
*CALL SELECTION-SCREEN 100.

*CALL SELECTION-SCREEN 200.
*IF r1 = 'X'.
*go_bearbeitung->einfuegen( iv_kdnr = p_kdnr
*                           iv_tnr = p_tnr
*                           iv_rad = 'Stromausfall'
*                           iv_kname = p_kname
*                           iv_anmerk = p_anmerk ).
*ELSEIF r2 = 'X'.
*go_bearbeitung->einfuegen( iv_kdnr = p_kdnr
*                           iv_tnr = p_tnr
*                           iv_rad = 'Zählerdefekt'
*                           iv_kname = p_kname
*                           iv_anmerk = p_anmerk ).
*ELSEIF r3 = 'X'.
*go_bearbeitung->einfuegen( iv_kdnr = p_kdnr
*                           iv_tnr = p_tnr
*                           iv_rad = 'Zählerverwechslung'
*                           iv_kname = p_kname
*                           iv_anmerk = p_anmerk ).
*ENDIF.
