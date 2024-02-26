class ZCL_ZOBAS_011_DPC_EXT definition
  public
  inheriting from ZCL_ZOBAS_011_DPC
  create public .

public section.
protected section.
METHODS bookingsset_get_entityset REDEFINITION. "neue Methode
 METHODS bookingsset_get_entity REDEFINITION. "neue Methode
private section.
ENDCLASS.



CLASS ZCL_ZOBAS_011_DPC_EXT IMPLEMENTATION.


 METHOD bookingsset_get_entity. "Implementierung der neuen Methode
 DATA(lv_id) = it_key_tab[ name = 'Bookid' ]-value.
 SELECT SINGLE
 FROM sbook
   FIELDS
 *
 WHERE bookid = @lv_id "ls_keytab-value
 INTO CORRESPONDING FIELDS OF @er_entity.
 ENDMETHOD.


  METHOD bookingsset_get_entityset. "Implementierung der neuen Methode
 SELECT
 FROM sbook
 FIELDS
 *
 WHERE bookid < 100
 INTO CORRESPONDING FIELDS OF TABLE @et_entityset.
 ENDMETHOD.
ENDCLASS.
