*&---------------------------------------------------------------------*
*& Report zcl_lv_testmapping
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcl_lv_testmapping2.

DATA lv_gender TYPE char1.
DATA lv_language TYPE string.
DATA go_map TYPE REF TO zcl_lv_mapping.

START-OF-SELECTION.

  go_map = NEW #(  ).

  lv_gender = go_map->map_gender( 1 ).
  WRITE :/ lv_gender.

  lv_gender = go_map->map_gender( iv_gender = 2 ).
  WRITE :/ lv_gender.

  lv_gender = go_map->map_gender( iv_gender = 3 ).
  WRITE :/ lv_gender.

  ULINE.

  lv_language = go_map->map_language( 'D' ).
  WRITE :/ lv_language.

  lv_language = go_map->map_language( iv_language = 'E' ).
  WRITE :/ lv_language.

  lv_language = go_map->map_language( iv_language = 'F' ).
  WRITE :/ lv_language.
