*&---------------------------------------------------------------------*
*& Report ztw_mapping_report
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztw_mapping_report.

PARAMETERS: p_gender type int1,
            p_lang type char1.

Data go_gender type ref to ztm_gender.
DATA go_language type ref to ztm_gender.

Start-of-selection.

go_gender = NEW #(  ).


Data(gv_gender) = go_gender->map_gender( iv_gender = p_gender ).


Create OBJECT go_gender.

go_language = NEW #(  ).

Data(gv_language) = go_language->map_language( iv_language = p_lang ).


Write: /'Geschlecht: ',gv_gender, /,'Sprache: ', gv_language.
