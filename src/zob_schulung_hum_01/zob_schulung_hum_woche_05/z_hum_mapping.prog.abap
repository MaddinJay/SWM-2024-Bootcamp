*&---------------------------------------------------------------------*
*& Report z_hum_mapping
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_hum_mapping.

DATA go_Mapping TYPE REF TO zcl_hum_mapping.
DATA lv_language TYPE string.
DATA lv_gender TYPE string.

PARAMETERS: p_gender TYPE int1,
            p_langu  TYPE char1.

START-OF-SELECTION.

  go_mapping = NEW #( ).

  CALL METHOD go_mapping->map_gender
    EXPORTING
      iv_gender = p_gender
    RECEIVING
      rv_gender = lv_gender.

  CALL METHOD go_mapping->map_lanuage
    EXPORTING
      iv_language = p_langu
    RECEIVING
      rv_language = lv_language.

  WRITE |Das Geschlecht ist { lv_gender } |.
  WRITE / |Die Sprache ist { lv_language }|.
