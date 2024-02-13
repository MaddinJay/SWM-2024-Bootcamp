*&---------------------------------------------------------------------*
*& Report zea_mapping
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zea_mapping.

DATA go_mapping TYPE REF TO ZEA_Mapping.

PARAMETERS: p_gender TYPE int1,
            p_lang   TYPE char1.

go_mapping = NEW #( ) .
DATA(gv_gender) = go_mapping->map_gender( iv_gender = p_gender ).
DATA(gv_language) = go_mapping->map_language( iv_language = p_lang ).

WRITE: 'Das Geschlecht:', gv_gender.
WRITE: / 'Die Sprache', gv_language.
