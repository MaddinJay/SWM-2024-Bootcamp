*&---------------------------------------------------------------------*
*& Report ZST_03_DURCHBLICK
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_03_durchblick.
TABLES: zst03project.
PARAMETERS pa_proj TYPE zst03project-projekt OBLIGATORY.

DATA: gs_project TYPE zst03project.

DATA: go_container TYPE REF TO cl_gui_custom_container,
      go_picture   TYPE REF TO cl_gui_picture.

START-OF-SELECTION.
  WRITE: / 'Durchblick 3.0'.
  SELECT SINGLE * FROM zst03project INTO gs_project
    WHERE projekt = pa_proj.
  IF sy-subrc = 0.
    WRITE: / gs_project.
  ELSE.
    WRITE: / 'Och schade, nichts gefunden für Projekt = ', pa_proj.
  ENDIF.

  AT LINE-SELECTION.
    zst03project = gs_project.
    Call Screen 9100.
