*&---------------------------------------------------------------------*
*& Report zmb_mapping_uebung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmb_mapping_uebung.

DATA go_mapping TYPE REF TO zcl_mb_mapping.

PARAMETERS: p_gender TYPE int1,
            P_langu  TYPE char1.

go_mapping = NEW #( ).

DATA(gv_gender) = go_mapping->map_gender( p_gender ).
DATA(gv_language) = go_mapping->map_language( p_langu ).


WRITE:'Geschlecht:', gv_gender, / 'Sprache:',gv_language.
