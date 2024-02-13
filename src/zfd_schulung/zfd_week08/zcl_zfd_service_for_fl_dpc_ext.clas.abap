CLASS zcl_zfd_service_for_fl_dpc_ext DEFINITION
  PUBLIC
  INHERITING FROM zcl_zfd_service_for_fl_dpc
  CREATE PUBLIC .

  PUBLIC SECTION.

  PROTECTED SECTION.
    METHODS bookingsset_get_entityset REDEFINITION. "neue Methode
    METHODS bookingsset_get_entity REDEFINITION. "neue Methode
    METHODS Fluggesellschaft_get_entityset REDEFINITION. "neue Methode
    METHODS Fluggesellschaft_get_entity REDEFINITION. "neue Methode

  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_zfd_service_for_fl_dpc_ext IMPLEMENTATION.
  METHOD bookingsset_get_entityset. "Implementierung der neuen Methode
    SELECT
    FROM sbook
    FIELDS
    *
    WHERE bookid < 100
    INTO CORRESPONDING FIELDS OF TABLE @et_entityset.
  ENDMETHOD.

  METHOD bookingsset_get_entity. "Implementierung der neuen Methode
    DATA(lv_id) = it_key_tab[ name = 'Bookid' ]-value.
    SELECT SINGLE
    FROM sbook
    FIELDS
    *
    WHERE bookid = @lv_id "ls_keytab-value
    INTO CORRESPONDING FIELDS OF @er_entity.
  ENDMETHOD.

  METHOD fluggesellschaft_get_entity.
    Data(lv_id2) = it_key_tab[ name = 'Carrid' ]-value.
    SELECT SINGLE
    FROM scarr
    FIELDS
    *
    WHERE Carrid = @lv_id2 "ls_keytab-value
    INTO CORRESPONDING FIELDS OF @er_entity.
  ENDMETHOD.

  METHOD fluggesellschaft_get_entityset.
        SELECT
    FROM scarr
    FIELDS
    *
    INTO CORRESPONDING FIELDS OF TABLE @et_entityset.
  ENDMETHOD.

ENDCLASS.
