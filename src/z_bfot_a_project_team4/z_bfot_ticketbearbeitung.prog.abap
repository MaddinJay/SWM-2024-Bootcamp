*&---------------------------------------------------------------------*
*& Report z_bfot_ticketbearbeitung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_bfot_ticketbearbeitung.

START-OF-SELECTION.

DATA lo_service TYPE REF TO zcl_bfot_serviceticket.
lo_service = zcl_bfot_serviceticket=>create_object( ).
lo_service->show_alle_tickets(  ).
