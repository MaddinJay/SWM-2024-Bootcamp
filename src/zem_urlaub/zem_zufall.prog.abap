*&---------------------------------------------------------------------*
*& Report zem_zufall
*&---------------------------------------------------------------------*

Report zem_zufall.


types: BEGIN OF ls_names,
        name TYPE string,
      END OF ls_names.

DATA: lt_names TYPE TABLE OF ls_names,
      ls_s type ls_names,
      lv_random_index TYPE i,
      lv_selected_name TYPE string.

START-OF-SELECTION.

  APPEND VALUE ls_names( name = 'Ahmed' ) TO lt_names.
  APPEND VALUE ls_names( name = 'Frank' ) TO lt_names.
  APPEND VALUE ls_names( name = 'Fabian' ) TO lt_names.
  APPEND VALUE ls_names( name = 'Michi' ) TO lt_names.

  CALL FUNCTION 'SAP_COMMON_RAND_GEN_UNIT'
    EXPORTING
      imin = 1
      imax = 4
    IMPORTING
      random_number = lv_random_index.

  READ TABLE lt_names INTO ls_s INDEX lv_random_index.
  lv_selected_name = ls_s-name.

  WRITE: / 'Random Output:', lv_selected_name.
