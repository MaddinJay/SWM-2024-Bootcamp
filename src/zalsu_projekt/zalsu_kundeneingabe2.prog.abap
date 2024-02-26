*&---------------------------------------------------------------------*
*& Report zalsu_kundeneingabe2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zalsu_kundeneingabe2.

DATA: lv_hoechste_ticketid TYPE zsl_no.
DATA: lv_ticket TYPE zsl_no.
DATA lt_tabelle LIKE STANDARD TABLE OF ZALSU_DB_Ticket.
DATA: BEGIN OF ls_grosto,
        Postleitzahl TYPE zalsu_db_grsto-postleitzahl,
        Techniker    TYPE zalsu_db_grsto-techniker,
      END OF ls_grosto.

PARAMETERS: p_kdid TYPE zalsu_db_kunde-kundenid DEFAULT '821'.
PARAMETERS: p_kat  TYPE zalsu_db_ticket-kategorie DEFAULT 'STROMSTÖRUNG'.
PARAMETERS: p_text TYPE zalsu_db_ticket-beschreibung.


SELECT           " Select um das neue TicketID um 1 zu erhöhen     ********
  FROM ZALSU_DB_Ticket
  FIELDS
    MAX( ticketid )
  INTO @lv_hoechste_ticketid.
lv_ticket = lv_hoechste_ticketid + 1.
*lv_ticket = 4218.



SELECT SINGLE    " Select um Anhand der KundenID die Postleitzahl zu ermittel
FROM zalsu_db_kunde
FIELDS *
WHERE  zalsu_db_kunde~kundenid = @p_kdid
INTO @DATA(ls_kunde).

SELECT     " Select um die Postleitzahl der Großstörung zu ermitten
FROM zalsu_db_grsto
FIELDS *
INTO TABLE @DATA(lt_grosto).



LOOP AT lt_grosto INTO ls_grosto.
  IF ls_kunde-postleitzahl = ls_grosto-postleitzahl AND p_kat = 'STROMSTÖRUNG'.  " Kunde ist im Störungsraum mit einer Störung ***************

    SELECT SINGLE
  FROM zalsu_db_technik
  FIELDS *
  WHERE nachname = @ls_grosto-techniker
  INTO @DATA(ls_technik).


    INSERT INTO ZALSU_DB_Ticket VALUES @( VALUE
            #(
                ticketid = lv_ticket
                kundenid = p_kdid
                technikerid = ls_technik-technikerid
                kategorie = 'STROMSTÖRUNG'
                beschreibung = p_text
                status = 'IN BEARBEITUNG'
                grossstoerung = 'X'
                kundeninfo = 'X'
                datum_von = sy-datum
              )
              ).
    DATA(lv_message1) = |Hallo { ls_kunde-nachname } { ls_kunde-vorname }, im Augenblick gibt es in Ihrem Wohnbereich einen Großstörung. Wir arbeitet bereits an fieberhaft an der Lösung. Ihre Ticket-ID lautet { lv_ticket }|.
    MESSAGE lv_message1 TYPE 'I'.
    LEAVE PROGRAM.
  ENDIF.
ENDLOOP.

********** Kunde ist nicht im Störungsraum oder hat keine Störung ***************************************************
INSERT INTO ZALSU_DB_Ticket VALUES @( VALUE
        #(
            ticketid = lv_ticket
            kundenid = p_kdid
            kategorie = p_kat
            beschreibung = p_text
            status = 'NEU'
            datum_von = sy-datum
          )
          ).
DATA(lv_message2) = |Vielen Dank { ls_kunde-nachname } { ls_kunde-vorname } für Ihre Meldung. Ihre Ticket-ID lautet { lv_ticket } |.
MESSAGE lv_message2 TYPE 'I'.
