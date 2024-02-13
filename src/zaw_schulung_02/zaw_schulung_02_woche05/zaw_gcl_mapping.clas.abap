CLASS zaw_gcl_mapping DEFINITION        " + Testklasse
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS map_gender IMPORTING iv_gender        TYPE int1
                       RETURNING VALUE(rv_gender) TYPE char1.

    METHODS map_language IMPORTING iv_language        TYPE char1
                         RETURNING VALUE(rv_language) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zaw_gcl_mapping IMPLEMENTATION.

  METHOD map_gender.

*    IF iv_gender = 1.
*      rv_gender = 'F'.
*    ELSEIF iv_gender = 2.
*      rv_gender = 'M'.
*    ELSEIF iv_gender = 3.
*      rv_gender = 'D'.
*    ENDIF.

*    rv_gender = COND #( WHEN iv_gender = 1 THEN 'F'
*                        WHEN iv_gender = 2 THEN 'M'
*                        WHEN iv_gender = 3 THEN 'D' ).

    rv_gender = SWITCH #( iv_gender
                          WHEN 1 THEN 'F'
                          WHEN 2 THEN 'M'
                          WHEN 3 THEN 'D'
                         ).

  ENDMETHOD.

  METHOD map_language.

    rv_language = SWITCH #( iv_language
                            WHEN 'D' THEN 'de'
                            WHEN 'E' THEN 'en'
                            WHEN 'F' THEN 'fr' ).

*    CASE iv_language.
*      WHEN 'D'.
*        rv_language = 'de'.
*      WHEN 'E'.
*        rv_language = 'en'.
*      WHEN 'F'.
*        rv_language = 'fr'.
*    ENDCASE.

  ENDMETHOD.

ENDCLASS.
