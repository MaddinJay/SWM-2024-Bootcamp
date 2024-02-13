*&---------------------------------------------------------------------*
*& Report zst_mapping
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_mapping.

SELECTION-SCREEN BEGIN OF BLOCK eingabe.

  PARAMETERS: p_gender TYPE int1,
              p_lang   TYPE char1.

SELECTION-SCREEN END OF BLOCK eingabe.

DATA go_mapping TYPE REF TO zst_mapping.

go_mapping = NEW #( ).

DATA(gv_gender) = go_mapping->map_gender( p_gender ). "Returning der Parameter werden gleich in eine neue Variable geschrieben
DATA(gv_language) = go_mapping->map_language( p_lang ). "geht nur bei einem Importingparameter / sonst in der Klammer iv_language = p_lang

WRITE: 'Das Geschlecht ist', gv_gender.
WRITE: /, 'Die Sprache ist', gv_language.
