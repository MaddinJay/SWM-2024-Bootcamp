*&---------------------------------------------------------------------*
*& Report zob_mb_flugstatistiken
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_mb_flugstatistiken.


SELECTION-SCREEN BEGIN OF BLOCK a WITH FRAME.
PARAMETERS p_id TYPE sbook-carrid OBLIGATORY LOWER CASE MODIF ID sc1.
REPLACE ALL OCCURRENCES OF '*' IN p_id WITH '%'.
SELECTION-SCREEN END OF BLOCK a.

START-OF-SELECTION.
  DATA: BEGIN OF ls_tabelle,
          id               TYPE sbook-carrid,
          Fluggesellschaft TYPE scarr-carrname,
          Flugdatum        TYPE sbook-fldate,
          END OF ls_tabelle,
        lt_tabelle LIKE TABLE OF ls_tabelle.




  CALL FUNCTION 'Z_MB_FLIGHT_COUNT'
    EXPORTING
      ip_fluggesell = p_id
    IMPORTING
      ept_anzahl    = lt_tabelle.


  cl_demo_output=>display( lt_tabelle ).
