CLASS zcl_lv_mapping DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS map_gender IMPORTING iv_gender        TYPE int1
                       RETURNING VALUE(rv_gender) TYPE char1.

    METHODS map_language IMPORTING iv_language        TYPE char1
                         RETURNING VALUE(rv_language) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_lv_mapping IMPLEMENTATION.

  METHOD map_gender.

  ENDMETHOD.

  METHOD map_language.

  ENDMETHOD.

ENDCLASS.
