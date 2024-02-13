class ZCL_ZOBLV_ODATA_DPC_EXT definition
  public
  inheriting from ZCL_ZOBLV_ODATA_DPC
  create public .

public section.
protected section.
  methods bookingsset_get_entityset REDEFINITION.

  methods BOOKINGSSET_GET_ENTITY
    redefinition .
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_ZOBLV_ODATA_DPC_EXT IMPLEMENTATION.


  METHOD bookingsset_get_entity.
    DATA(lv_id) = it_key_tab[  name = 'Bookid' ]-value.

    SELECT SINGLE
      FROM sbook
      FIELDS
      *
      WHERE bookid = @lv_id "ls_keytab-value
      INTO CORRESPONDING FIELDS OF @er_entity.

  ENDMETHOD.

  METHOD BOOKINGSSET_GET_ENTITYSET.

  ENDMETHOD.

ENDCLASS.
