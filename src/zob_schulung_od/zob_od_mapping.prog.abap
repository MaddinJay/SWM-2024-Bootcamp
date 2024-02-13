*&---------------------------------------------------------------------*
*& Report zob_od_mapping
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_od_mapping.

PARAMETERS: p_gender TYPE int1,
            p_lang TYPE char1 .

START-OF-SELECTION.

 DATA go_gender TYPE REF TO ZOB_DCL_MAPPING.
 go_gender = NEW #(  ).

 go_gender->map_gender(
   EXPORTING
     iv_gender = p_gender
   RECEIVING
     rv_gender = p_gender
 ).


 DATA go_lang TYPE REF TO ZOB_DCL_MAPPING.
 go_lang = NEW #(  ).

 go_lang->map_language(
   EXPORTING
     iv_language = p_lang
   RECEIVING
     rv_language = p_lang
 ).
