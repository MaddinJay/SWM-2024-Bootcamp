*&---------------------------------------------------------------------*
*& Report zem_report333
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_report333.

DATA g_langu TYPE sy-langu.

LOAD-OF-PROGRAM.                         "Funktion von außen im Report aufrufen
  g_langu = COND #( WHEN sy-langu = 'D' THEN 'D' ELSE 'E' ).

Write g_langu.


  PARAMETERS p_langu TYPE pgl_langu.

INITIALIZATION.                           "Vorbelegung Eingabefeld (hier p_langu vorbelegt mit sy-langu
  p_langu = sy-langu.

 Write p_langu.
