CLASS zcl_lv_mapping3 DEFINITION
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




CLASS zcl_lv_mapping3 IMPLEMENTATION.
  METHOD map_gender.

    rv_gender = SWITCH #(  iv_gender "besser, da man iv_gender nicht so oft schreiben muss. andere syntax. andere schreibweise.
                            WHEN 1 THEN 'F'
                            WHEN 2 THEN 'M'
                            ELSE 'D').
*
*
*    rv_gender = COND #( WHEN iv_gender = 1 THEN 'F' "schreibweise variation 1
*                        WHEN iv_gender = 2 THEN 'M'
*                        ELSE 'D' ).

* IF iv_gender = 1. "schreibweise variation 2
*      rv_gender = 'F'.
*    ELSEIF iv_gender = 2.
*      rv_gender = 'M'.
*    ELSE.
*      rv_gender = 'D'.
*    ENDIF.


*    CASE iv_gender. "schreibweise variation 3
*      WHEN 1.
*        rv_gender = 'F'.
*      WHEN 2.
*        rv_gender = 'M'.
*      WHEN OTHERS.
*        rv_gender = 'D'.
*    ENDCASE.
  ENDMETHOD.

  METHOD map_language.

    rv_language = SWITCH #( iv_language
                            when 'D' then 'de'
                            when 'E' then 'en'
                            else 'fr' ).

*    CASE iv_language.
*      WHEN 'D'.
*        rv_language = 'de'.
*      WHEN 'E'.
*        rv_language = 'en'.
*      WHEN 'F '.
*        rv_language = 'fr'.
*    ENDCASE.
  ENDMETHOD.

ENDCLASS.
