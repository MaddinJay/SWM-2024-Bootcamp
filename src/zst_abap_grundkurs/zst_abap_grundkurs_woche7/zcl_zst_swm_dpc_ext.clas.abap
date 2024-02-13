class ZCL_ZST_SWM_DPC_EXT definition
  public
  inheriting from ZCL_ZST_SWM_DPC
  create public .

public section.
protected section.

  methods LOGGEDINUSERSET_GET_ENTITY
    redefinition .
private section.
ENDCLASS.



CLASS ZCL_ZST_SWM_DPC_EXT IMPLEMENTATION.


  method LOGGEDINUSERSET_GET_ENTITY.
DATA ls_entity TYPE zob_st_test.

    ls_entity-logged_in_user = sy-uname.

    er_entity = ls_entity.
  endmethod.
ENDCLASS.
