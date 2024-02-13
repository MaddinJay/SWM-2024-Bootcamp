class ZCL_ZEM_TEST_ODATA_DPC_EXT definition
  public
  inheriting from ZCL_ZEM_TEST_ODATA_DPC
  create public .

public section.
protected section.

  methods USERSET_GET_ENTITY
    redefinition .
  methods USERSET_GET_ENTITYSET
    redefinition .
private section.
ENDCLASS.



CLASS ZCL_ZEM_TEST_ODATA_DPC_EXT IMPLEMENTATION.


  method USERSET_GET_ENTITY.

Data ls_entity type zob_st_test.

ls_entity-logged_in_user = sy-uname.

er_entity = ls_entity.

**TRY.
*CALL METHOD SUPER->USERSET_GET_ENTITY
*  EXPORTING
*    IV_ENTITY_NAME          =
*    IV_ENTITY_SET_NAME      =
*    IV_SOURCE_NAME          =
*    IT_KEY_TAB              =
**    io_request_object       =
**    io_tech_request_context =
*    IT_NAVIGATION_PATH      =
**  IMPORTING
**    er_entity               =
**    es_response_context     =
*    .
**  CATCH /iwbep/cx_mgw_busi_exception.
**  CATCH /iwbep/cx_mgw_tech_exception.
**ENDTRY.
  endmethod.


  method USERSET_GET_ENTITYSET.
**TRY.
*CALL METHOD SUPER->USERSET_GET_ENTITYSET
*  EXPORTING
*    IV_ENTITY_NAME           =
*    IV_ENTITY_SET_NAME       =
*    IV_SOURCE_NAME           =
*    IT_FILTER_SELECT_OPTIONS =
*    IS_PAGING                =
*    IT_KEY_TAB               =
*    IT_NAVIGATION_PATH       =
*    IT_ORDER                 =
*    IV_FILTER_STRING         =
*    IV_SEARCH_STRING         =
**    io_tech_request_context  =
**  IMPORTING
**    et_entityset             =
**    es_response_context      =
*    .
**  CATCH /iwbep/cx_mgw_busi_exception.
**  CATCH /iwbep/cx_mgw_tech_exception.
**ENDTRY.
  endmethod.
ENDCLASS.
