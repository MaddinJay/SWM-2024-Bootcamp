*&---------------------------------------------------------------------*
*& Report ZST_05_ICHMESSEALLES
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZST_05_TEST.

DATA g_langu TYPE sy-langu.

LOAD-OF-PROGRAM.
*  g_langu = COND #( WHEN sy-langu = 'D' THEN 'D' ELSE 'E' ).
INITIALIZATION.
  g_langu = sy-langu.

  Write g_langu.
