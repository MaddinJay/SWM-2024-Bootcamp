*&---------------------------------------------------------------------*
*& Report z_bfot_pruefung_neue_tickets
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_bfot_pruefung_neue_tickets.


SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS:
    p_st_sto AS CHECKBOX DEFAULT '',
    p_ga_sto AS CHECKBOX DEFAULT '',
    p_fw_sto AS CHECKBOX DEFAULT '',
    p_wa_sto AS CHECKBOX DEFAULT ''.
SELECTION-SCREEN END OF BLOCK b1.


START-OF-SELECTION.

  DATA lv_STO_strom TYPE boole.
  DATA lv_STO_gas TYPE boole.
  DATA lv_STO_fw TYPE boole.
  DATA lv_STO_wasser TYPE boole.

  lv_sto_strom = p_st_sto.
  lv_sto_gas = p_ga_sto.
  lv_sto_fw = p_fw_sto.
  lv_sto_wasser = p_wa_sto.

  DATA lo_pruef TYPE REF TO zcl_bfot_serviceticket.
  lo_pruef = NEW #(  ).

*  lo_pruef->check_alle_tickets_neu(  ).

  lo_pruef->check_alle_tickets_neu2( EXPORTING iv_STO_strom = lv_sto_strom
                                               iv_STO_gas = lv_sto_gas
                                               iv_STO_fw = lv_sto_fw
                                               iv_STO_wasser = lv_sto_wasser ).

  WRITE: 'Prüfung durchgeführt. Alle Tickets im Status "NEU" wurden bearbeitet'.
