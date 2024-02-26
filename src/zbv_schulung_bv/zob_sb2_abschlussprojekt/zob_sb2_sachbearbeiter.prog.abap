*&---------------------------------------------------------------------*
*& Report zob_sb2_sachbearbeiter
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_sb2_sachbearbeiter.

DATA go_pruefung TYPE REF TO zob_cl_db_pruefung.
DATA go_alv TYPE REF TO zob_sb2_cl_db_bearbeitung.

**********************************************************************
* Automatische Prüfung der erfassten Tickets
**********************************************************************

go_pruefung = NEW #(  ).
go_pruefung->set_status_offene_forderung( ).
go_pruefung->del_status_erledigte_stoerung(  ).
go_pruefung->set_status_bekannte_stoerung(  ).
go_pruefung->set_status_neue_stoerung(  ).

**********************************************************************
* Aufruf der ALV-Tabelle mit Extra-Buttons und Funktionen
* sowie erzeugen Instanz der globalen Klasse
**********************************************************************

go_alv = zob_sb2_cl_db_bearbeitung=>create_object( ).
go_alv->alv_aufruf_sachbearbeiter( ).
