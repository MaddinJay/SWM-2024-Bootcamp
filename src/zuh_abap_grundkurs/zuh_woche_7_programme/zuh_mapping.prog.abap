*&---------------------------------------------------------------------*
*& Report zuh_mapping
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_mapping.

DATA go_mapping TYPE REF TO zcl_bv_mapping.

PARAMETERS: p_gender TYPE int1 DEFAULT 1,
            p_langu  TYPE char1 DEFAULT 'f'.

START-OF-SELECTION.

  go_mapping = NEW #( ).

  DATA(lv_gender) = go_mapping->map_gender( p_gender ).
  DATA(lv_language) = go_mapping->map_language( p_langu ).

  WRITE |Das Geschlecht ist { lv_gender } |.
  WRITE / |Die Sprache ist { lv_language }|.
