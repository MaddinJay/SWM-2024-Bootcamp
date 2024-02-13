CLASS zcl_mj_mapping DEFINITION
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

CLASS zcl_mj_mapping IMPLEMENTATION.

  METHOD map_gender.
    rv_gender = SWITCH #( iv_gender
                          WHEN 1 THEN 'F'
                          WHEN 2 THEN 'M'
                          ELSE 'D' ).
  ENDMETHOD.

  METHOD map_language.
    " Mappe
    " D -> de
    " E -> en
    " F -> fr
  ENDMETHOD.

ENDCLASS.
