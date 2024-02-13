*&---------------------------------------------------------------------*
*& Report zfd_start_of_selection
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_start_of_selection.

DATA lv_text TYPE string.


  lv_text = `Hello World!`.

  START-OF-SELECTION.
  cl_demo_output=>display_data( lv_text ).
