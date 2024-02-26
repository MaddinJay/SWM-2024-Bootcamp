CLASS zob_cl_db_pruefung DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

**********************************************************************
* Type-Definition für die notwendigen Tabellen
**********************************************************************
    TYPES: BEGIN OF t_stoerung,
             kundennummer  TYPE ZOB_SB2_Stoerung-kundennummer,
             kundenname    TYPE zob_sb2_stoerung-kundenname,
             ticketnummer  TYPE zob_sb2_tickets-ticketnummer,
             stoerung      TYPE zob_sb2_stoerung-stoerung,
             anmerkung     TYPE zob_sb2_tickets-anmerkung,
             status        TYPE zob_sb2_tickets-status,
             nicht_bezahlt TYPE zob_sb2_stoerung-nicht_bezahlt,
           END OF t_stoerung.
**********************************************************************
* Definition der notwendigen Strukturen und Tabellen
**********************************************************************
    DATA: lt_stoerung         TYPE TABLE OF t_stoerung,
          lt_stoerung_bekannt TYPE TABLE OF t_stoerung,
          ls_stoerung         LIKE LINE OF lt_stoerung,
          ls_stoerung_bekannt LIKE LINE OF lt_stoerung_bekannt,
          lt_tickets          TYPE SORTED TABLE OF t_stoerung WITH NON-UNIQUE KEY kundennummer kundenname stoerung,
          ls_tickets          LIKE LINE OF lt_tickets.


**********************************************************************
* Methoden
**********************************************************************

    METHODS constructor.
    METHODS set_status_offene_forderung.
    METHODS set_status_bekannte_stoerung.
    METHODS set_status_neue_Stoerung.
    METHODS del_status_erledigte_Stoerung.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zob_cl_db_pruefung IMPLEMENTATION.

  METHOD constructor.

**********************************************************************
* SELECT für säumige Kunden
**********************************************************************
    SELECT FROM ZOB_SB2_tickets
    LEFT JOIN ZOB_SB2_stoerung
    ON ZOB_SB2_tickets~kundennummer = ZOB_SB2_stoerung~kundennummer AND ZOB_SB2_stoerung~kundenname = ZOB_SB2_tickets~kundenname
    FIELDS
    ZOB_SB2_tickets~kundennummer,
    ZOB_SB2_tickets~kundenname,
    ZOB_SB2_tickets~ticketnummer,
    ZOB_SB2_stoerung~stoerung,
    ZOB_SB2_tickets~anmerkung,
    ZOB_SB2_tickets~status,
    ZOB_SB2_stoerung~nicht_bezahlt
    INTO CORRESPONDING FIELDS OF TABLE @lt_stoerung.

**********************************************************************
* SELECT aus der Störungstabelle für bekannte und neue Störungen
**********************************************************************

    SELECT * FROM zob_sb2_stoerung
    INTO CORRESPONDING FIELDS OF TABLE @lt_stoerung_bekannt.

**********************************************************************
* SELECT aus der Ticketstabelle für bekannte und neue Störungen
**********************************************************************

    SELECT * FROM zob_sb2_tickets
    INTO CORRESPONDING FIELDS OF TABLE @lt_tickets.


  ENDMETHOD.


  METHOD set_status_offene_forderung.
**********************************************************************
* Kunde hat eine offene Forderung
**********************************************************************

    LOOP AT lt_stoerung INTO DATA(ls_stoerung).
      IF ls_stoerung-nicht_bezahlt = 'X' AND ls_stoerung-status = 'NEU'.
        ls_stoerung-status = 'INFORMIERT'.
        UPDATE zob_sb2_tickets SET status = ls_stoerung-status WHERE kundennummer = ls_stoerung-kundennummer AND Ticketnummer = Ls_stoerung-ticketnummer.
        IF sy-subrc = 0.
          MESSAGE |Status für { ls_stoerung-ticketnummer } wurde auf informiert gesetzt, da Kunde offene Forderungen hat.| TYPE 'I'.
        ELSE.
          MESSAGE 'Es wurde kein Status geändert' TYPE 'I'.
        ENDIF.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.


  METHOD set_status_bekannte_stoerung.
**********************************************************************
* Stoerung ist bereits bekannt und in der Störungstabelle hinterlegt
**********************************************************************

    LOOP AT lt_tickets INTO DATA(ls_tickets) WHERE status = 'NEU'.
      READ TABLE lt_stoerung_bekannt TRANSPORTING NO FIELDS WITH KEY kundenname = ls_tickets-kundenname kundennummer = ls_tickets-kundennummer stoerung = ls_tickets-stoerung.

      IF sy-subrc = 0.

        UPDATE zob_sb2_tickets SET status = 'INFORMIERT' WHERE ticketnummer = ls_tickets-ticketnummer.
        IF sy-subrc = 0.
          COMMIT WORK AND WAIT.
          MESSAGE |Status für { ls_tickets-ticketnummer } wurde auf informiert gesetzt, da die Störung bereits bekannt ist.| TYPE 'I'.
        ELSE.
          MESSAGE 'Status konnte nicht geändert werden' TYPE 'I'.
        ENDIF.

      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD set_status_neue_stoerung.

**********************************************************************
* Störung ist unbekannt und wird in die Störungstabelle eingefügt
**********************************************************************

    LOOP AT lt_tickets INTO DATA(ls_tickets) WHERE status ='NEU'.
      READ TABLE lt_stoerung_bekannt TRANSPORTING NO FIELDS WITH KEY kundenname = ls_tickets-kundenname kundennummer = ls_tickets-kundennummer stoerung = ls_tickets-stoerung.
      IF sy-subrc <> 0.

        UPDATE zob_sb2_tickets SET status = 'zuweisen T.' WHERE ticketnummer = ls_tickets-ticketnummer.
        INSERT INTO zob_sb2_stoerung VALUES @(  VALUE
                #( kundennummer = ls_tickets-kundennummer
                   stoerung = ls_tickets-stoerung
                   kundenname = ls_tickets-kundenname
                             ) ).
        IF sy-subrc = 0.
          COMMIT WORK AND WAIT.
          MESSAGE |Für { ls_tickets-ticketnummer } wurde eine Störung angelegt, bitte einen Techniker zuweisen.| TYPE 'I'.
        ELSE.
          MESSAGE 'Die Störung konnte nicht erfolgreich gespeichert werden' TYPE 'I'.
        ENDIF.

      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD del_status_erledigte_stoerung.

*********************************************************************************
* löscht die Störung aus der Störungstabelle, wenn das Ticket auf erledigt steht
*********************************************************************************

    LOOP AT lt_stoerung INTO DATA(ls_stoerung) WHERE status = 'ERLEDIGT'.

      DELETE FROM zob_sb2_stoerung WHERE kundenname = ls_stoerung-kundenname AND kundennummer = ls_stoerung-kundennummer AND stoerung = ls_stoerung-stoerung.

      IF sy-subrc = 0.
        COMMIT WORK AND WAIT.
        MESSAGE |Da Ticket { ls_stoerung-ticketnummer } erledigt ist, wurde die Störung aus der Tabelle für bekannte Störungen gelöscht.| TYPE 'I'.
      ENDIF.

    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
