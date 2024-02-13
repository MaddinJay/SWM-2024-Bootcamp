*&---------------------------------------------------------------------*
*& Report zalsu_kundeneingabe
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zalsu_neu_ticket.
DATA: lv_hoechste_ticketid TYPE zsl_no.

*      Data lt_tabelle like STANDARD TABLE OF ZALSU_DB_Ticket.

PARAMETERS: p_kat  TYPE string,
            p_text TYPE string.


SELECT
  FROM ZALSU_DB_Ticket
  FIELDS
    MAX( ticketid )
  INTO @lv_hoechste_ticketid.

INSERT INTO ZALSU_DB_Ticket VALUES @( VALUE
        #(
            ticketid = lv_hoechste_ticketid + 1
            kundenid = 345
            kategorie = p_kat
            beschreibung = p_text
            status = 'neu'
            datum_von = sy-datum
          )
          ).

IF sy-subrc = 0.
  WRITE 'Ticket wurde aufgenommen'.
ELSE.
  WRITE 'Ticket wurde nicht aufgenommen'.
ENDIF.

*cl_demo_output=>display( ZALSU_DB_Ticket ).
