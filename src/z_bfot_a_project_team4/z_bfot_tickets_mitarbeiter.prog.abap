*&---------------------------------------------------------------------*
*& Report z_bfot_tickets_mitarbeiter
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_bfot_tickets_mitarbeiter.

SELECTION-SCREEN BEGIN OF SCREEN 001.
  SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
    PARAMETERS: p_all   RADIOBUTTON GROUP g_1 DEFAULT 'X', " Ansicht alle Tickets, Status NE erledigt
                p_ibsb  RADIOBUTTON GROUP g_1, " Ansicht alle Tickets, Status = in Bearbeitung Sachbearbeiter
                p_ibte  RADIOBUTTON GROUP g_1, " Ansicht alle Tickets, Status = in Bearbeitung Techniker
                p_erl   RADIOBUTTON GROUP g_1, " Ansicht alle Tickets, Status = ERLEDIGT
                p_bearb RADIOBUTTON GROUP g_1.
  SELECTION-SCREEN END OF BLOCK b1.
SELECTION-SCREEN END OF SCREEN 001.

SELECTION-SCREEN BEGIN OF SCREEN 011.
  SELECTION-SCREEN BEGIN OF BLOCK b11 WITH FRAME TITLE TEXT-011.
    PARAMETERS: p_z1   RADIOBUTTON GROUP g_11 MODIF ID sc1, " Zurück zu SCREEN 001
                p_tt   RADIOBUTTON GROUP g_11 MODIF ID sc1, " Ticket auf Status iBTE setzen.
                p_terl RADIOBUTTON GROUP g_11 MODIF ID sc1. " Ticket auf Status erledigt setzen.
  SELECTION-SCREEN END OF BLOCK b11.

  SELECTION-SCREEN BEGIN OF BLOCK b12 WITH FRAME TITLE TEXT-012.
    PARAMETERS: p_TNRCB  AS CHECKBOX USER-COMMAND ddd.
    PARAMETERS: p_TNr TYPE n LENGTH 6 MODIF ID sc2.
*    PARAMETERS: p_Stat TYPE n LENGTH 6 MODIF ID sc2.
    PARAMETERS: p_TechID TYPE zbfot_tickets-bearbeiterid MODIF ID sc2.
  SELECTION-SCREEN END OF BLOCK b12.

  SELECTION-SCREEN BEGIN OF BLOCK b13 WITH FRAME TITLE TEXT-013.
    PARAMETERS: p_loesCB AS CHECKBOX USER-COMMAND eee, " soll eine Lösung gesetzt werden ?
                p_loes1  TYPE String MODIF ID sc3.
  SELECTION-SCREEN END OF BLOCK b13.

SELECTION-SCREEN END OF SCREEN 011.

AT SELECTION-SCREEN OUTPUT.
  IF p_TNRCB EQ abap_true.
    LOOP AT SCREEN.
      IF screen-group1 = 'SC2'.
        screen-active = 1.
        MODIFY SCREEN.
      ENDIF.
    ENDLOOP.
  ELSE.
    LOOP AT SCREEN.
      IF screen-group1 = 'SC2'.
        screen-active = 0.
        MODIFY SCREEN.
      ENDIF.
    ENDLOOP.
  ENDIF.
  IF p_loesCB EQ abap_true.
    LOOP AT SCREEN.
      IF screen-group1 = 'SC3'.
        screen-active = 1.
        MODIFY SCREEN.
      ENDIF.
    ENDLOOP.
  ELSE.
    LOOP AT SCREEN.
      IF screen-group1 = 'SC3'.
        screen-active = 0.
        MODIFY SCREEN.
      ENDIF.
    ENDLOOP.
  ENDIF.

*******************************
* Beginn des Programms -> Start-of-Selection
*******************************
START-OF-SELECTION.
  DATA lo_service TYPE REF TO zcl_bfot_serviceticket.
  lo_service = NEW #(  ).

  DO 100 TIMES.

    CALL SELECTION-SCREEN 001.

    IF p_all = abap_true.

      lo_service->show_alle_tickets(  ). " mit ALV
*      lo_service->show_alle_tickets2(  ). " mit cl_demo_output

    ENDIF.

    IF p_ibsb = abap_true.
      lo_service->show_alle_tickets_ibsb(  ).
      CALL SELECTION-SCREEN 001.
    ENDIF.

    IF p_ibte = abap_true.
      lo_service->show_alle_tickets_ibte(  ).
      CALL SELECTION-SCREEN 001.
    ENDIF.

    IF p_erl = abap_true.
      lo_service->show_alle_tickets_erl(  ).
      CALL SELECTION-SCREEN 001.
    ENDIF.

    IF p_bearb = abap_true.
      CALL SELECTION-SCREEN 011.
      IF p_z1 = abap_true.
        p_z1 = abap_false.
        CALL SELECTION-SCREEN 001.
      ENDIF.

      IF p_tt = abap_true AND p_tNr IS NOT INITIAL.
        p_z1 = abap_true.
        p_tt = abap_false.
        lo_service->set_status_ibte( iv_tnr = p_tnr
                                     iv_techid = p_techid ).
      ENDIF.

      IF p_terl = abap_true AND p_tNr IS NOT INITIAL.
        p_z1 = abap_true.
        p_terl = abap_false.
        lo_service->set_status_erl( iv_tnr = p_tnr iv_loes1 = p_loes1 ).
      ENDIF.


    ENDIF.
  ENDDO.
