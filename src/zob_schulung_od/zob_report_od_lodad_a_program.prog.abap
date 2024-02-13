*&---------------------------------------------------------------------*
*& Report zob_report_od_lodad_a_program
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_report_od_lodad_a_program.
*LOAD-OF-PROGRAM.
*DATA global_langu TYPE sy-langu.
*global_langu = COND #( WHEN sy-langu = 'D' THEN 'Deutsch' ELSE 'Englisch' ).
*
*WRITE: 'Sprache ist auf: ' , global_langu.

PARAMETERS p_langu TYPE pgl_langu.

INITIALIZATION.
p_langu = sy-langu.
