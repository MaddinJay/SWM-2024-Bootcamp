CLASS zcl_mdc_adapter_bp_dummy_std DEFINITION
  PUBLIC
  INHERITING FROM cl_mdc_adapter_bp_base
  CREATE PROTECTED
  GLOBAL FRIENDS if_mdc_adapter.

  PUBLIC SECTION.
    METHODS if_mdc_adapter~setup REDEFINITION.
    METHODS if_mdc_adapter~get_info REDEFINITION.
    METHODS if_mdc_adapter~delete REDEFINITION.
  PROTECTED SECTION.
    METHODS execute_service REDEFINITION.
    METHODS kpis_for_standardization REDEFINITION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_MDC_ADAPTER_BP_DUMMY_STD IMPLEMENTATION.


  METHOD execute_service.
    SELECT COUNT( * ) FROM but000 INTO @DATA(dummy) WHERE bu_sort2 = 'MDCCAL'.
    CHECK dummy >= 1.
    DATA(lr_adrc_prc) = CAST mdc_tt_but_adrc_prc( me->model( )->object( 'ADRC' )->read( ) ).
    TRY.
        lr_adrc_prc->*[ source_id = '4714' ]-street = 'c Mar'.
        lr_adrc_prc->*[ source_id = '4714' ]-house_num1 = '64'.
        lr_adrc_prc->*[ source_id = '4714' ]-region = '46'.
        lr_adrc_prc->*[ source_id = '4714' ]-chckstatus = 'C'.
      CATCH cx_sy_itab_line_not_found.
    ENDTRY.
    TRY.
        lr_adrc_prc->*[ source_id = '4715' ]-region = '46'.
        lr_adrc_prc->*[ source_id = '4715' ]-chckstatus = 'C'.
      CATCH cx_sy_itab_line_not_found.
    ENDTRY.
    TRY.
        lr_adrc_prc->*[ source_id = '4716' ]-post_code1 = '74074'.
        lr_adrc_prc->*[ source_id = '4716' ]-street = 'Lerchenstr'.
        lr_adrc_prc->*[ source_id = '4716' ]-house_num1 = '117'.
        lr_adrc_prc->*[ source_id = '4716' ]-region = '08'.
        lr_adrc_prc->*[ source_id = '4716' ]-chckstatus = 'C'.
      CATCH cx_sy_itab_line_not_found.
    ENDTRY.
    TRY.
        lr_adrc_prc->*[ source_id = '4721' ]-region = '30'.
        lr_adrc_prc->*[ source_id = '4721' ]-chckstatus = 'C'.
      CATCH cx_sy_itab_line_not_found.
    ENDTRY.
    TRY.
        lr_adrc_prc->*[ source_id = '4731' ]-region = '02'.
        lr_adrc_prc->*[ source_id = '4731' ]-chckstatus = 'C'.
      CATCH cx_sy_itab_line_not_found.
    ENDTRY.
    TRY.
        lr_adrc_prc->*[ source_id = '4728' ]-post_code1 = '76698'.
        lr_adrc_prc->*[ source_id = '4728' ]-street = 'Hauptstr'.
        lr_adrc_prc->*[ source_id = '4728' ]-house_num1 = '6'.
        lr_adrc_prc->*[ source_id = '4728' ]-region = '08'.
        lr_adrc_prc->*[ source_id = '4728' ]-chckstatus = 'C'.
      CATCH cx_sy_itab_line_not_found.
    ENDTRY.

    MESSAGE w001(zmdc_bp_adapter) INTO sy-ucomm.
    me->log->add_message( ).
  ENDMETHOD.


  METHOD if_mdc_adapter~delete.
    DELETE FROM but_adrc_imout
      WHERE process_id      = me->process_id
        AND process_step_no = me->step_number.
    COMMIT WORK.

    super->if_mdc_adapter~delete( iv_delete_source_data = iv_delete_source_data iv_for_finalize = iv_for_finalize iv_for_rollback = iv_for_rollback ).
  ENDMETHOD.


  METHOD if_mdc_adapter~get_info.
    rs_info = super->if_mdc_adapter~get_info( ).
    rs_info-configurable = abap_false.
  ENDMETHOD.


  METHOD if_mdc_adapter~setup.
    super->if_mdc_adapter~setup( ).
    me->number_of_packages = 1.
  ENDMETHOD.


  METHOD kpis_for_standardization.

    DATA:
      lt_dd07t TYPE STANDARD TABLE OF dd07t.

    FIELD-SYMBOLS:
      <ls_kpis>      TYPE mdc_adapter_kpi_std,
      <ls_info_code> LIKE LINE OF <ls_kpis>-info_codes,
      <ls_dd07t>     LIKE LINE OF lt_dd07t.

*   get generic KPIs
    CALL METHOD super->kpis_for_standardization
      EXPORTING
        is_base_kpis = is_base_kpis
      RECEIVING
        rr_kpis      = rr_kpis.

*   get specific KPIs
    ASSIGN rr_kpis->* TO <ls_kpis>.
    IF sy-subrc IS NOT INITIAL.
      RETURN.
    ENDIF.

    SELECT chckstatus AS addr_info_code, COUNT( * ) AS records
      FROM but_adrc_prc
     WHERE process_id      = @me->process_id
       AND process_step_no = @me->step_number
     GROUP BY chckstatus
      INTO CORRESPONDING FIELDS OF TABLE @<ls_kpis>-info_codes.

    IF <ls_kpis>-info_codes IS INITIAL.
      RETURN.
    ENDIF.

    SELECT * FROM dd07t INTO TABLE lt_dd07t
     WHERE domname    = 'AD_CHECKST'
       AND ddlanguage = sy-langu
       AND as4local   = 'A'.

*     Map info codes
*       SPACE -> N          Not checked
*       C     -> SPACE      checked against city index
*       D     -> D          differs from city index

    LOOP AT <ls_kpis>-info_codes ASSIGNING <ls_info_code>.
*       get description with original info codes
      READ TABLE lt_dd07t
        WITH KEY domvalue_l = <ls_info_code>-addr_info_code
       ASSIGNING <ls_dd07t>.
      IF sy-subrc IS INITIAL.
        <ls_info_code>-info_code_text = <ls_dd07t>-ddtext.
      ELSE.
        <ls_info_code>-info_code_text = <ls_info_code>-addr_info_code.
      ENDIF.

      CASE <ls_info_code>-addr_info_code.
        WHEN space.
          <ls_info_code>-addr_info_code = 'N'.
        WHEN 'C'.
          <ls_info_code>-addr_info_code = space.
        WHEN OTHERS.
*           keep info code
      ENDCASE.
    ENDLOOP.

    TRY.
        DATA(sql_bridge) = cl_mdc_sql_bridge=>get( model = me->model( ) ).
        <ls_kpis>-accurate_records = me->kpi_count( CAST cl_mdc_sql_complement_bp( sql_bridge->complement )->kpi_bas_std_accurate_select( ) ).
        <ls_kpis>-defective_records = me->kpi_count( CAST cl_mdc_sql_complement_bp( sql_bridge->complement )->kpi_bas_std_defective_select( ) ).
        <ls_kpis>-modified_records = me->kpi_count( CAST cl_mdc_sql_complement_bp( sql_bridge->complement )->kpi_bas_std_modified_select( ) ).
      CATCH cx_mdc_model cx_sql_exception cx_parameter_invalid INTO DATA(exception).
        me->log->add_exception( exception ).
    ENDTRY.

  ENDMETHOD.
ENDCLASS.
