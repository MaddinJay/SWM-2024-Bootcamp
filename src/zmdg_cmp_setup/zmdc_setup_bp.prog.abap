*&---------------------------------------------------------------------*
*& Report ZMDC_SETUP_BP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmdc_setup_bp.


*PARAMETERS:
*  p_tdcnam TYPE etobj_name DEFAULT 'ZMDC_SETUP_BP',
*  p_grnum  TYPE i DEFAULT 1,
*  p_grname TYPE string DEFAULT 'MDCCAL',
*  p_setup  TYPE string DEFAULT 'MARKETING',
*  pv_sys   TYPE mdg_business_system DEFAULT 'S4H_100'.

CONSTANTS:
  lc_process_id TYPE mdc_process_id VALUE 999999999999,

  p_tdcnam TYPE etobj_name VALUE 'ZMDC_SETUP_BP',
*  p_grnum  TYPE i DEFAULT 1,
  p_grname TYPE string VALUE 'MDCCAL',
  p_setup  TYPE string VALUE 'MARKETING',
  pv_sys   TYPE mdg_business_system VALUE 'S4H_100'.

DATA:
  lo_data_container           TYPE REF TO cl_apl_ecatt_tdc_api,
  lt_partner_range            TYPE STANDARD TABLE OF bus0range,
  ls_partner_range            LIKE LINE OF lt_partner_range,

  lt_but000_prc               TYPE mdc_tt_but000_prc,
  lt_but020_prc               TYPE mdc_tt_but020_prc,
  lt_but021_fs_prc            TYPE mdc_tt_but021_fs_prc,
  lt_but0id_prc               TYPE mdc_tt_but0id_prc,
  lt_but_adrc_prc             TYPE mdc_tt_but_adrc_prc,
  lt_but000                   TYPE bup_but000_t,
  lt_but000_src_stat          TYPE mdc_tt_but000_src_stat,
  lt_but020                   TYPE tty_but020,
  lt_but021_fs                TYPE tty_but021,
  lt_but0id                   TYPE tty_but0id,
  lt_but_adrc                 TYPE STANDARD TABLE OF adrc,

  lv_group                    TYPE i,
  lv_groupstring              TYPE string,
  lv_tdcvariant               TYPE etvar_id,
  lv_partner                  TYPE bu_partner,
  lt_partner_guids            TYPE bu_partner_guid_t,
  lv_partner_guid             TYPE bu_partner_guid,
  lt_objects_to_delete        TYPE mdg_t_del_id_data_bs,  "mdg_t_delete_id_matching_bs,
  ls_object_to_delete         LIKE LINE OF lt_objects_to_delete,
  lx_mdg_km_exception         TYPE REF TO cx_mdg_km_exception,
  lt_business_system_id_range TYPE 	mdg_t_business_system_id_range,
  ls_business_system_id_range LIKE LINE OF lt_business_system_id_range,
  lt_single_km_object         TYPE mdg_t_matching_obj_data_bs,
  ls_km_object                LIKE LINE OF lt_single_km_object,
  lt_mapping_groups           TYPE mdg_t_get_matching_easy_bs,
  ls_mapping_groups           LIKE LINE OF lt_mapping_groups,
  lt_matches_to_delete        TYPE mdg_t_delete_id_matching_bs,
  ls_identifier               TYPE mdg_s_identifier_data_bs,
  lv_groupname                TYPE string.

************************************************************************************
* Delete data before creating new data
************************************************************************************
************************************************************************************

* Delete data from source tables and prc tables


DELETE FROM but000_src WHERE source_system = p_setup.
DELETE FROM but020_src WHERE source_system = p_setup.
DELETE FROM but021_fs_src WHERE source_system = p_setup.
DELETE FROM but_adrc_src WHERE source_system = p_setup.
DELETE FROM but0id_src WHERE source_system = p_setup.

DELETE FROM but000_prc WHERE source_system = p_setup.
DELETE FROM but020_prc WHERE source_system = p_setup.
DELETE FROM but021_fs_prc WHERE source_system = p_setup.
DELETE FROM but_adrc_prc WHERE source_system = p_setup.
DELETE FROM but0id_prc WHERE source_system = p_setup.



* Delete data from source stat tables

DELETE FROM but000_src_stat WHERE source_system = p_setup.


* Delete active BP's and key mapping from system

* Determine active BP's

SELECT partner FROM  but000 INTO TABLE @DATA(lt_partners)
    WHERE bu_sort2 LIKE @p_grname.
ls_partner_range-tname  = 'BUT000'.
ls_partner_range-fname  = 'PARTNER'.
ls_partner_range-option = 'EQ'.
ls_partner_range-sign   = 'I'.

LOOP AT lt_partners INTO lv_partner.
  CALL FUNCTION 'BUPA_NUMBERS_GET'
    EXPORTING
      iv_partner      = lv_partner
    IMPORTING
      ev_partner_guid = lv_partner_guid.
  IF  lv_partner_guid IS NOT INITIAL
  AND lv_partner_guid NE '00000000000000000000000000000000'.
    COLLECT lv_partner_guid INTO lt_partner_guids.
  ENDIF.
  ls_partner_range-low = lv_partner.
  APPEND ls_partner_range TO lt_partner_range.
ENDLOOP.


* Delete active BP's

IF lt_partner_range IS NOT INITIAL.
  CALL FUNCTION 'BUP_BUPA_MASS_DELETE'
    EXPORTING
      iv_testrun    = abap_false
      iv_xdele      = abap_false
      iv_with_check = abap_false
    TABLES
      it_partners   = lt_partner_range
    EXCEPTIONS
      OTHERS        = 1.
ENDIF.

* DELETE KEY MAPPING

TRY.
    " Get instance of Key Mapping API.
    cl_mdg_id_matching_api_bs=>get_instance( IMPORTING er_if_mdg_id_matching_api = DATA(lo_mdg_id_matching_api) ).
  CATCH cx_mdg_km_exception INTO lx_mdg_km_exception .
    " Key Mapping cannot be accessed, so just leave the method;
    " nevertheless, an instance of Key Mapping API should always be returned.
    RETURN.
ENDTRY.

CLEAR lt_business_system_id_range.
ls_business_system_id_range-business_system_id = p_setup.
APPEND ls_business_system_id_range TO lt_business_system_id_range.
*ls_business_system_id_range-business_system_id = pv_sys.
*APPEND ls_business_system_id_range TO lt_business_system_id_range.


lo_mdg_id_matching_api->query_objects(
    EXPORTING iv_object_type_code = if_mdg_otc_const=>bpartner it_business_system_id_range = lt_business_system_id_range
    IMPORTING et_objects_without_mappings = lt_single_km_object et_mapping_groups = lt_mapping_groups ).

" Build Delete Keys for Key Mapping
ls_object_to_delete-delete_complete_object = abap_true.
ls_object_to_delete-object_type_code = if_mdg_otc_const=>bpartner.
"ls_object_to_delete-identifier_key-ident_defining_scheme_code = '888'.

LOOP AT lt_single_km_object INTO ls_km_object.
  CLEAR: ls_object_to_delete-identifier_key-id_value,
         ls_object_to_delete-identifier_key-business_system_id.


  READ TABLE ls_km_object-object_identifier INDEX 1 INTO ls_identifier.
  IF sy-subrc = 0.
    ls_object_to_delete-identifier_key-ident_defining_scheme_code = ls_identifier-ident_defining_scheme_code.
    ls_object_to_delete-identifier_key-business_system_id = ls_identifier-business_system_id.
    ls_object_to_delete-identifier_key-id_value = ls_identifier-id_value.
    APPEND ls_object_to_delete TO lt_objects_to_delete.
  ENDIF.
ENDLOOP.

LOOP AT lt_mapping_groups INTO ls_mapping_groups.

  LOOP AT ls_mapping_groups-matching_objects INTO ls_km_object.
    CLEAR: ls_object_to_delete-identifier_key-id_value,
           ls_object_to_delete-identifier_key-business_system_id.

    READ TABLE ls_km_object-object_identifier INDEX 1 INTO ls_identifier.
    IF sy-subrc = 0.
      ls_object_to_delete-identifier_key-ident_defining_scheme_code = ls_identifier-ident_defining_scheme_code.
      ls_object_to_delete-identifier_key-business_system_id = ls_identifier-business_system_id.
      ls_object_to_delete-identifier_key-id_value = ls_identifier-id_value.
      APPEND ls_object_to_delete TO lt_objects_to_delete.
    ENDIF.

  ENDLOOP.
ENDLOOP.



LOOP AT lt_partners INTO lv_partner.
  CLEAR: ls_object_to_delete-identifier_key-id_value.

  ls_object_to_delete-identifier_key-business_system_id = pv_sys.

  WRITE lv_partner TO ls_object_to_delete-identifier_key-id_value.

  APPEND ls_object_to_delete TO lt_objects_to_delete.
ENDLOOP.




IF lt_objects_to_delete IS NOT INITIAL.
  TRY.
      " Delete Key Mapping information.
      lo_mdg_id_matching_api->delete_object_data( EXPORTING it_del_ident_data = lt_objects_to_delete ).
      lo_mdg_id_matching_api->save( ).

      COMMIT WORK AND WAIT.
    CATCH cx_mdg_km_exception INTO lx_mdg_km_exception.
      RETURN.
  ENDTRY.
ENDIF.

COMMIT WORK AND WAIT.

**************************************************************************************
* Load new BP data using TDC
**************************************************************************************

lv_tdcvariant = 'SETUP'.

TRY.
    lo_data_container = cl_apl_ecatt_tdc_api=>get_instance( p_tdcnam ).

    lo_data_container->get_value(
      EXPORTING i_param_name   = 'BUT000_PRC' i_variant_name = lv_tdcvariant
      CHANGING e_param_value   = lt_but000
    ).

    lo_data_container->get_value(
      EXPORTING i_param_name   = 'BUT020_PRC' i_variant_name = lv_tdcvariant
      CHANGING e_param_value   = lt_but020
    ).

    lo_data_container->get_value(
      EXPORTING i_param_name   = 'BUT021_FS_PRC' i_variant_name = lv_tdcvariant
      CHANGING e_param_value   = lt_but021_fs
    ).

    lo_data_container->get_value(
      EXPORTING i_param_name   = 'BUT_ADRC_PRC' i_variant_name = lv_tdcvariant
      CHANGING e_param_value   = lt_but_adrc
    ).

    lo_data_container->get_value(
      EXPORTING i_param_name   = 'BUT0ID_PRC' i_variant_name = lv_tdcvariant
      CHANGING e_param_value   = lt_but0id
    ).

    LOOP AT lt_but000 ASSIGNING FIELD-SYMBOL(<ls_but000>).
      APPEND INITIAL LINE TO lt_but000_prc ASSIGNING FIELD-SYMBOL(<ls_but000_prc>).
      MOVE-CORRESPONDING <ls_but000> TO <ls_but000_prc>.
      <ls_but000_prc>-process_id = lc_process_id.
      <ls_but000_prc>-source_system = p_setup.
      <ls_but000_prc>-source_id = <ls_but000>-partner.


      LOOP AT lt_but020 ASSIGNING FIELD-SYMBOL(<ls_but020>) WHERE partner = <ls_but000>-partner.
        APPEND INITIAL LINE TO lt_but020_prc ASSIGNING FIELD-SYMBOL(<ls_but020_prc>).
        MOVE-CORRESPONDING <ls_but020> TO <ls_but020_prc>.
        <ls_but020_prc>-process_id = lc_process_id.
        <ls_but020_prc>-source_system = p_setup.
        <ls_but020_prc>-source_id = <ls_but020>-partner.
        <ls_but020_prc>-source_addrnumber = <ls_but020>-addrnumber.
        LOOP AT lt_but_adrc ASSIGNING FIELD-SYMBOL(<ls_adrc>)
             WHERE addrnumber = <ls_but020>-addrnumber.
          APPEND INITIAL LINE TO lt_but_adrc_prc ASSIGNING FIELD-SYMBOL(<ls_adrc_prc>).
          MOVE-CORRESPONDING <ls_adrc> TO <ls_adrc_prc>.
          <ls_adrc_prc>-process_id = lc_process_id.
          <ls_adrc_prc>-source_system = p_setup.
          <ls_adrc_prc>-source_id = <ls_but020>-partner.
          <ls_adrc_prc>-source_addrnumber = <ls_adrc>-addrnumber.
        ENDLOOP.
      ENDLOOP.
    ENDLOOP.

    LOOP AT lt_but021_fs ASSIGNING FIELD-SYMBOL(<ls_but021_fs>).
      APPEND INITIAL LINE TO lt_but021_fs_prc ASSIGNING FIELD-SYMBOL(<ls_but021_fs_prc>).
      MOVE-CORRESPONDING <ls_but021_fs> TO <ls_but021_fs_prc>.
      <ls_but021_fs_prc>-process_id = lc_process_id.
      <ls_but021_fs_prc>-source_system = p_setup.
      <ls_but021_fs_prc>-source_id = <ls_but021_fs>-partner.
      <ls_but021_fs_prc>-source_addrnumber = <ls_but021_fs>-addrnumber.
    ENDLOOP.

    LOOP AT lt_but0id ASSIGNING FIELD-SYMBOL(<ls_but0id>).
      APPEND INITIAL LINE TO lt_but0id_prc ASSIGNING FIELD-SYMBOL(<ls_but0id_prc>).
      MOVE-CORRESPONDING <ls_but0id> TO <ls_but0id_prc>.
      <ls_but0id_prc>-process_id = lc_process_id.
      <ls_but0id_prc>-source_system = p_setup.
      <ls_but0id_prc>-source_id = <ls_but0id>-partner.
    ENDLOOP.


    INSERT but000_prc FROM TABLE @lt_but000_prc.
    INSERT but020_prc FROM TABLE @lt_but020_prc.
    INSERT but021_fs_prc FROM TABLE @lt_but021_fs_prc.
    INSERT but_adrc_prc FROM TABLE @lt_but_adrc_prc.
    INSERT but0id_prc FROM TABLE @lt_but0id_prc.

    MOVE-CORRESPONDING lt_but000_prc TO lt_but000_src_stat.
    INSERT but000_src_stat FROM TABLE @lt_but000_src_stat.

    COMMIT WORK AND WAIT.

  CATCH cx_ecatt_tdc_access INTO DATA(lx_exception).

ENDTRY.

DATA(adapter) = cl_mdc_adapter_base=>get_instance(
                          iv_process_type = ''
                          iv_process_id = lc_process_id
                          iv_step_number = 1
                          iv_step_type = 'ACT'
                          iv_process_goal = 'C'
                          iv_bo_type = '147'
                          iv_root_bo_type = '147'
                          iv_class_name = 'CL_MDC_ADAPTER_BP_ACT'
                        ).
adapter->start( iv_synchronous = abap_true ).
CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
  EXPORTING
    wait = abap_true.

DELETE but000_prc FROM TABLE @lt_but000_prc.
DELETE but020_prc FROM TABLE @lt_but020_prc.
DELETE but021_fs_prc FROM TABLE @lt_but021_fs_prc.
DELETE but_adrc_prc FROM TABLE @lt_but_adrc_prc.
DELETE but0id_prc FROM TABLE @lt_but0id_prc.

COMMIT WORK.

write: '17 records created'.
