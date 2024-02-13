*&---------------------------------------------------------------------*
*& Report zfd_stuktur_tabellen_ext_ext
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_stuktur_tabellen_ext_ext.
"DW, Schicker kurzer Code
DATA lv_derstring TYPE string VALUE ' Tomuschei t  ? Micha el ? Gern linde n? 1979'.
DATA go_member TYPE REF TO zfd_cl_members. "DW, lo -> lokal da das Objekt nur in diesem Report existiert
go_member = NEW #( iv_string = lv_derstring iv_trennzeichen = '?' ). "DW, Klasseninstanzierung ist komplett richtig, kürzer wäre:
"DW, DATA(lo_member) = NEW zfd_cl_members( iv_string = lv_derstring iv_trennzeichen = '?' ).
go_member->setdb( ).
WRITE lv_derstring.
