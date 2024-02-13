*&---------------------------------------------------------------------*
*& Report ztm_gender_prog
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztm_gender_prog.

PARAMETERS: p_gender TYPE int1,
            p_lang   TYPE char1.


DATA go_map  TYPE REF TO ztm_gender.

START-OF-SELECTION.

  go_map = NEW #(  ).
  DATA(gv_gender) = go_map->map_gender( iv_gender = p_gender ).
  DATA(gv_language) = go_map->map_language( iv_language = p_lang ).

   WRITE: /'Geschlecht: ',gv_gender, /,'Sprache: ', gv_language.






*DATA go_gender   TYPE REF TO ztm_gender.
*DATA go_language TYPE REF TO ztm_gender.
*
*START-OF-SELECTION.
*
*  go_gender = NEW #(  ).
*  DATA(gv_gender) = go_gender->map_gender( iv_gender = p_gender ).
*
*
*  go_language = NEW #(  ).
*  DATA(gv_language) = go_language->map_language( iv_language = p_lang ).
*
*
*  WRITE: /'Geschlecht: ',gv_gender, /,'Sprache: ', gv_language.
