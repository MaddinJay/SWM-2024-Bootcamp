class ZCL_ZEM_TEST2_ODATA_DPC_EXT definition
  public
  inheriting from ZCL_ZEM_TEST2_ODATA_DPC
  create public .

public section.
protected section.


Methods bookingsset_get_entityset REDEFINITION.

Methods bookingsset_get_entity REDEFINITION.



private section.
ENDCLASS.



CLASS ZCL_ZEM_TEST2_ODATA_DPC_EXT IMPLEMENTATION.
  METHOD BOOKINGSSET_GET_ENTITY.

  DATA(lv_id) = it_key_tab[ name = 'Bookid' ]-value.


 SELECT SINGLE
 FROM sbook
 FIELDS *
 WHERE bookid = @lv_id "ls_keytab-value
 INTO CORRESPONDING FIELDS OF @er_entity.




  ENDMETHOD.

  METHOD BOOKINGSSET_GET_ENTITYSET.

  SELECT
 FROM sbook
 FIELDS
 *
 WHERE bookid < 100
 INTO CORRESPONDING FIELDS OF TABLE @et_entityset.




  ENDMETHOD.

ENDCLASS.
