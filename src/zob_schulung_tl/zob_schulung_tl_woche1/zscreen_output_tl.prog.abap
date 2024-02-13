*&---------------------------------------------------------------------*
*& Report zscreen_output_tl
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zscreen_output_tl.
* http://zevolving.com/2014/07/selection-screen-disable-standard-toolbar-button/
* https://www.saptutorial.org/hide-execute-button-selection-screen/
PARAMETERS: p_string TYPE string DEFAULT 'Schreibe etwas...'.

* Eigener Startbutton: Triggert das Kommando 'ONLI' (Ausführen (F8)) -> START-OF-SELECTION
SELECTION-SCREEN BEGIN OF LINE.
  SELECTION-SCREEN PUSHBUTTON 2(30) b_start USER-COMMAND onli.
SELECTION-SCREEN END OF LINE.

INITIALIZATION.
  b_start   = 'Start'.

AT SELECTION-SCREEN OUTPUT.
  DATA: it_ucomm TYPE STANDARD TABLE OF sy-ucomm WITH DEFAULT KEY.
* Standard-Button Ausführen (F8) in der Toolbar entfernen
  APPEND 'ONLI' TO it_ucomm.

  CALL FUNCTION 'RS_SET_SELSCREEN_STATUS'
    EXPORTING
      p_status  = sy-pfkey
    TABLES
      p_exclude = it_ucomm.

START-OF-SELECTION.
  WRITE: / p_string.
