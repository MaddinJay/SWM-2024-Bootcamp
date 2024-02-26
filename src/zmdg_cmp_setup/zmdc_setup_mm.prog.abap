*&---------------------------------------------------------------------*
*& Report ZMDC_SETUP_MM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMDC_SETUP_MM.


PARAMETERS:
  p_tdcnam TYPE etobj_name DEFAULT 'ZMDC_SETUP_MM',
  p_grnum  TYPE i DEFAULT 1,
  p_grname TYPE string DEFAULT 'MDCCAL'.

DATA:
  lo_data_container TYPE REF TO cl_apl_ecatt_tdc_api,
  lt_mara_src       TYPE mdc_tt_mara_src,
  lt_mara_src_grp   TYPE mdc_tt_mara_src,
  ls_mara_src       TYPE LINE OF mdc_tt_mara_src,
  lt_marc_src       TYPE mdc_tt_marc_src,
  lt_marc_src_grp   TYPE mdc_tt_marc_src,
  ls_marc_src       TYPE LINE OF mdc_tt_marc_src,
  lt_marm_src       TYPE mdc_tt_marm_src,
  lt_marm_src_grp   TYPE mdc_tt_marm_src,
  ls_marm_src       TYPE LINE OF mdc_tt_marm_src,
  lt_mean_src       TYPE mdc_tt_mean_src,
  lt_mean_src_grp   TYPE mdc_tt_mean_src,
  ls_mean_src       TYPE LINE OF mdc_tt_mean_src,
  lt_makt_src       TYPE mdc_tt_makt_src,
  lt_makt_src_grp   TYPE mdc_tt_makt_src,
  ls_makt_src       TYPE LINE OF mdc_tt_makt_src,
  lt_mvke_src       TYPE mdc_tt_mvke_src,
  lt_mvke_src_grp   TYPE mdc_tt_mvke_src,
  ls_mvke_src       TYPE LINE OF mdc_tt_mvke_src,
  lt_mlan_src       TYPE mdc_tt_mlan_src,
  lt_mlan_src_grp   TYPE mdc_tt_mlan_src,
  ls_mlan_src       TYPE LINE OF mdc_tt_mlan_src,
  lt_mard_src       TYPE mdc_tt_mard_src,
  lt_mard_src_grp   TYPE mdc_tt_mard_src,
  ls_mard_src       TYPE LINE OF mdc_tt_mard_src,
  lv_group          TYPE i,
  lv_groupstring    TYPE string,
  lv_tdcvariant     TYPE etvar_id.


DELETE FROM mara_src WHERE source_system = 'SETUP-AIN263'.
DELETE FROM marc_src WHERE source_system = 'SETUP-AIN263'.
DELETE FROM marm_src WHERE source_system = 'SETUP-AIN263'.
DELETE FROM mean_src WHERE source_system = 'SETUP-AIN263'.
DELETE FROM makt_src WHERE source_system = 'SETUP-AIN263'.
DELETE FROM mvke_src WHERE source_system = 'SETUP-AIN263'.
DELETE FROM mlan_src WHERE source_system = 'SETUP-AIN263'.
DELETE FROM mard_src WHERE source_system = 'SETUP-AIN263'.

lv_tdcvariant = 'SETUP'.

TRY.
    lo_data_container = cl_apl_ecatt_tdc_api=>get_instance( p_tdcnam ).

    lo_data_container->get_value(
      EXPORTING i_param_name   = 'MARA_SRC' i_variant_name = lv_tdcvariant
      CHANGING e_param_value   = lt_mara_src
    ).

    lo_data_container->get_value(
      EXPORTING i_param_name   = 'MARC_SRC' i_variant_name = lv_tdcvariant
      CHANGING e_param_value   = lt_marc_src
    ).

    lo_data_container->get_value(
      EXPORTING i_param_name   = 'MARM_SRC' i_variant_name = lv_tdcvariant
      CHANGING e_param_value   = lt_marm_src
    ).

    lo_data_container->get_value(
      EXPORTING i_param_name   = 'MEAN_SRC' i_variant_name = lv_tdcvariant
      CHANGING e_param_value   = lt_mean_src
    ).

    lo_data_container->get_value(
      EXPORTING i_param_name   = 'MAKT_SRC' i_variant_name = lv_tdcvariant
      CHANGING e_param_value   = lt_makt_src
    ).

    lo_data_container->get_value(
      EXPORTING i_param_name   = 'MLAN_SRC' i_variant_name = lv_tdcvariant
      CHANGING e_param_value   = lt_mlan_src
    ).
    lo_data_container->get_value(
      EXPORTING i_param_name   = 'MVKE_SRC' i_variant_name = lv_tdcvariant
      CHANGING e_param_value   = lt_mvke_src
    ).
    lo_data_container->get_value(
      EXPORTING i_param_name   = 'MARD_SRC' i_variant_name = lv_tdcvariant
      CHANGING e_param_value   = lt_mard_src
    ).

*    DO p_grnum TIMES.

      CLEAR lt_mara_src_grp.
      CLEAR lt_marc_src_grp.
      CLEAR lt_marm_src_grp.
      CLEAR lt_mean_src_grp.
      CLEAR lt_makt_src_grp.
      CLEAR lt_mvke_src_grp.
      CLEAR lt_mlan_src_grp.
      CLEAR lt_mard_src_grp.

*     lv_group = sy-index.

*      if lv_group < 100.
*        lv_groupstring = |-{ lv_group WIDTH = 2 ALIGN = RIGHT PAD = '0' }|.
*      ELSE.
*        lv_groupstring = |-{ lv_group WIDTH = 3 ALIGN = RIGHT PAD = '0' }|.
*      endif.

      LOOP AT lt_mara_src INTO ls_mara_src.
        ls_mara_src-source_system = 'SETUP-AIN263'.
        ls_mara_src-source_id = ls_mara_src-source_id && lv_groupstring.
        ls_mara_src-extwg = p_grname.
        ls_mara_src-bismt = p_grname && 'MASS'.
        APPEND ls_mara_src TO lt_mara_src_grp.
      ENDLOOP.

      LOOP AT lt_marc_src INTO ls_marc_src.
        ls_marc_src-source_system = 'SETUP-AIN263'.
        ls_marc_src-source_id = ls_marc_src-source_id && lv_groupstring.
        APPEND ls_marc_src TO lt_marc_src_grp.
      ENDLOOP.

      LOOP AT lt_marm_src INTO ls_marm_src.
        ls_marm_src-source_system = 'SETUP-AIN263'.
        ls_marm_src-source_id = ls_marm_src-source_id && lv_groupstring.
        APPEND ls_marm_src TO lt_marm_src_grp.
      ENDLOOP.

      LOOP AT lt_mean_src INTO ls_mean_src.
        ls_mean_src-source_system = 'SETUP-AIN263'.
        ls_mean_src-source_id = ls_mean_src-source_id && lv_groupstring.
        APPEND ls_mean_src TO lt_mean_src_grp.
      ENDLOOP.

      LOOP AT lt_makt_src INTO ls_makt_src.
        ls_makt_src-source_system = 'SETUP-AIN263'.
        ls_makt_src-source_id = ls_makt_src-source_id && lv_groupstring.
        APPEND ls_makt_src TO lt_makt_src_grp.
      ENDLOOP.

      LOOP AT lt_mvke_src INTO ls_mvke_src.
        ls_mvke_src-source_system = 'SETUP-AIN263'.
        ls_mvke_src-source_id = ls_mvke_src-source_id && lv_groupstring.
        APPEND ls_mvke_src TO lt_mvke_src_grp.
      ENDLOOP.

      LOOP AT lt_mlan_src INTO ls_mlan_src.
        ls_mlan_src-source_system = 'SETUP-AIN263'.
        ls_mlan_src-source_id = ls_mlan_src-source_id && lv_groupstring.
        APPEND ls_mlan_src TO lt_mlan_src_grp.
      ENDLOOP.

      LOOP AT lt_mard_src INTO ls_mard_src.
        ls_mard_src-source_system = 'SETUP-AIN263'.
        ls_mard_src-source_id = ls_mard_src-source_id && lv_groupstring.
        APPEND ls_mard_src TO lt_mard_src_grp.
      ENDLOOP.

      INSERT mara_src FROM TABLE @lt_mara_src_grp.
      INSERT marc_src FROM TABLE @lt_marc_src_grp.
      INSERT marm_src FROM TABLE @lt_marm_src_grp.
      INSERT mean_src FROM TABLE @lt_mean_src_grp.
      INSERT makt_src FROM TABLE @lt_makt_src_grp.
      INSERT mvke_src FROM TABLE @lt_mvke_src_grp.
      INSERT mlan_src FROM TABLE @lt_mlan_src_grp.
      INSERT mard_src FROM TABLE @lt_mard_src_grp.


*    ENDDO.


  CATCH cx_ecatt_tdc_access INTO DATA(lx_exception).

ENDTRY.
