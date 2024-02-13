CLASS zas_mapping DEFINITION
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



CLASS zas_mapping IMPLEMENTATION.
  METHOD map_gender.
    rv_gender = SWITCH #( iv_gender
    WHEN 1 THEN 'F'
    WHEN 2 THEN 'M'
    ELSE 'D' ).

*    rv_gender = COND #(
*    WHEN iv_gender = 1 THEN 'F'
*    WHEN iv_gender = 2 THEN 'M'
*    ELSE 'D' ).

*    CASE iv_gender.
*      WHEN 1.
*        rv_gender = 'F'.
*      WHEN 2.
*        rv_gender = 'M'.
*      WHEN 3.
*        rv_gender = 'D'.
*    ENDCASE.

  ENDMETHOD.

  METHOD map_language.

  ENDMETHOD.



ENDCLASS.
