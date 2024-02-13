CLASS zcl_bv_mapping DEFINITION
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



CLASS zcl_bv_mapping IMPLEMENTATION.
  METHOD map_gender.
    rv_gender = SWITCH #( iv_gender                       "Macht das Gleiche wie IF und Case
                          WHEN 1 THEN 'F'
                          WHEN 2 THEN 'M'
                          ELSE 'D' ).
*
*      rv_gender = COND #(  WHEN iv_Gender = 1 THEN 'F'     "Macht das Gleiche wie IF und Case
*                           WHEN iv_gender = 2 THEN 'M'
*                           ELSE 'D' ).

*     CASE iv_gender.
*     WHEN 1.
*      rv_gender = 'F'.
*     WHEN 2.
*      rv_gender = 'M'.
*     WHEN 3.
*      rv_gender = 'D'.
*     ENDCASE.

*    IF iv_gender = 1.
*      rv_gender = 'F'.
*    ELSEIF iv_gender = 2.
*      rv_gender = 'M'.
*    ELSEIF iv_gender = 3.
*      rv_gender = 'D'.
*    ENDIF.
  ENDMETHOD.

  METHOD map_language.
    " Mappe
    " D -> de
    " E -> en
    " F -> fr
    rv_language = SWITCH #( iv_language
                            WHEN 'D' THEN 'de'
                            WHEN 'E' THEN 'en'
                            ELSE 'fr' ).
  ENDMETHOD.

ENDCLASS.
