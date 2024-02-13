CLASS zfb_mapping_tdd DEFINITION
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

CLASS zfb_mapping_tdd IMPLEMENTATION.

  METHOD map_gender.
    rv_gender = SWITCH #( iv_gender
                          WHEN 1 THEN 'F'
                          WHEN 2 THEN 'M'
                          ELSE 'D' ).
  ENDMETHOD.

  METHOD map_language.

    IF iv_language = 'D'.
    rv_language = 'de'.
    ELSEIF iv_language = 'E'.
    rv_language = 'en'.
    ELSEIF iv_language = 'F'.
    rv_language = 'fr'.
    ENDIF.

    " Mappe
    " D -> de
    " E -> en
    " F -> fr
  ENDMETHOD.

ENDCLASS.
