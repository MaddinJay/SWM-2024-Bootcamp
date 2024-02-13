*&---------------------------------------------------------------------*
*& Report zbv_mapping
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbv_mapping.

DATA go_mapping TYPE REF TO zcl_bv_mapping.

PARAMETERS: p_gender TYPE int1,
            p_langu  TYPE char1.

go_mapping = NEW #( ).

DATA(gv_gender) = go_mapping->map_gender( iv_gender = p_gender ).
DATA(gv_language) = go_mapping->map_language( iv_language = p_langu ).

WRITE:'Geschlecht:', gv_gender, / 'Sprache:', gv_language.
