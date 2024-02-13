*&---------------------------------------------------------------------*
*& Report ztl_mapping_report
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztl_mapping_report.

PARAMETERS: p_gender TYPE int1,
            p_lang TYPE char1 .

START-OF-SELECTION.

 DATA go_gender TYPE REF TO ztl_mapping.
 go_gender = NEW #(  ).

 go_gender->map_gender(
   EXPORTING
     iv_gender = p_gender
   RECEIVING
     rv_gender = p_gender
 ).


 DATA go_lang TYPE REF TO ztl_mapping.
 go_lang = NEW #(  ).

 go_lang->map_language(
   EXPORTING
     iv_language = p_lang
   RECEIVING
     rv_language = p_lang
 ).
