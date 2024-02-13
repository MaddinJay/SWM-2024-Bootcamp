*&---------------------------------------------------------------------*
*& Report ZEM_GTBL
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZEM_GTBL.

Data gs_struktur Type ZEM_S_MITARBEITER.
Data gt_tabelle type TABLE OF ZEM_S_MITARBEITER. "über globale Struktur ZEM_S_MITARBEITER

PARAMETERS gv_log type string.

gs_struktur-nachname = 'Peter'.
APPEND gs_struktur to gt_tabelle.

gs_struktur-nachname = 'Sabine'.
APPEND gs_struktur to gt_tabelle.

gs_struktur-nachname = '????'.
APPEND gs_struktur to gt_tabelle.

   Do 2 TIMES.
    WRITE: gs_struktur-nachname, gv_log, /.

ENDDO.



 IF sy-subrc = 0.
   Write: 'HEY HEY', /.

   Endif.

    Loop AT gt_tabelle into gs_struktur.
  WRITE: gs_struktur-nachname, gv_log, /.
  ULINE.
Endloop.


Find '????' in gs_struktur.


If sy-subrc = 0.
  Write 'wow'.
  Else. write 'no'.
  endif.
