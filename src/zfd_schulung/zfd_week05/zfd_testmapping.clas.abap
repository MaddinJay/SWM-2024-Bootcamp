CLASS zfd_testmapping DEFINITION
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

CLASS zfd_testmapping IMPLEMENTATION.

  METHOD map_gender.

*    rv_gender = COND #( WHEN iv_gender = 1 THEN 'F'
*                        WHEN iv_gender = 2 THEN 'M'
*                        ELSE 'D').

    rv_gender = SWITCH #( iv_gender
                          WHEN 1 THEN 'F'
                          WHEN 2 THEN 'M'
                          ELSE 'D').

  ENDMETHOD.

  METHOD map_language.
        CASE iv_language.
      WHEN 'D'.
        rv_language = 'de'.
      WHEN 'E'.
        rv_language = 'en'.
      WHEN OTHERS.
        rv_language = 'fr'.
    ENDCASE.
  ENDMETHOD.

ENDCLASS.
