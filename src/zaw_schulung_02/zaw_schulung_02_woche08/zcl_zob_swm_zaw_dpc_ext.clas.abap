CLASS zcl_zob_swm_zaw_dpc_ext DEFINITION
  PUBLIC
  INHERITING FROM zcl_zob_swm_zaw_dpc
  CREATE PUBLIC .

  PUBLIC SECTION.
  PROTECTED SECTION.

    METHODS loggedinuserset_get_entity REDEFINITION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_zob_swm_zaw_dpc_ext IMPLEMENTATION.


  METHOD loggedinuserset_get_entity.

    DATA ls_entity TYPE zob_st_test.

    ls_entity-logged_in_user = sy-uname.

    er_entity               = ls_entity.

  ENDMETHOD.
ENDCLASS.
