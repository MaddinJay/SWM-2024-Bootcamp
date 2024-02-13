CLASS zcl_zbv_gatewaytest_dpc_ext DEFINITION
  PUBLIC
  INHERITING FROM zcl_zbv_gatewaytest_dpc
  CREATE PUBLIC .

  PUBLIC SECTION.
  PROTECTED SECTION.
    METHODS bookingsset_get_entityset REDEFINITION. "neue Methode
    METHODS bookingsset_get_entity REDEFINITION. "neue Methode
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_zbv_gatewaytest_dpc_ext IMPLEMENTATION.
  METHOD bookingsset_get_entityset.

    SELECT
    FROM sbook
    FIELDS *
    WHERE bookid < 100
    INTO CORRESPONDING FIELDS OF TABLE @et_entityset.

  ENDMETHOD.

  METHOD bookingsset_get_entity.

    DATA(lv_id) = it_Key_tab[  name = 'Bookid' ]-value.

    SELECT SINGLE
    FROM sbook
    FIELDS *
    WHERE bookid = @lv_id "ls_keytab-value
    INTO CORRESPONDING FIELDS OF @er_entity.

  ENDMETHOD.


ENDCLASS.
