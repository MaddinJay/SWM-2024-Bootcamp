*&---------------------------------------------------------------------*
*& Report zob_sb2_testreoport
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_sb2_testreoport.

DATA go_pruefung TYPE REF TO zob_cl_db_pruefung.

go_pruefung = NEW #(  ).

go_pruefung->set_status_offene_forderung( ).

go_pruefung->set_status_bekannte_stoerung(  ).

go_pruefung->set_status_neue_stoerung(  ).
go_pruefung->del_status_erledigte_stoerung(  ).
*
*DATA go_alv TYPE REF TO zob_sb2_cl_db_erledigt.
*go_alv = zob_sb2_cl_db_erledigt=>create_object( ). " erzeuge Instanz der globalen Klasse
*go_alv->alv_aufruf_sachbearbeiter( ).
