CLASS zst_mapping DEFINITION
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

CLASS zst_mapping IMPLEMENTATION.

  METHOD map_gender.
    " Mappe
    CASE iv_gender.
      WHEN 1.
        rv_gender = 'F'.
      WHEN 2.
        rv_gender = 'M'.
      WHEN 3.
        rv_gender = 'D'.
    ENDCASE.

  ENDMETHOD.

  METHOD map_language.
    " Mappe
    " D -> de
    " E -> en
    " F -> fr

     CASE iv_language.
      WHEN 'D'.
        rv_language = 'de'.
      WHEN 'E'.
        rv_language = 'en'.
      WHEN 'F'.
        rv_language = 'fr'.
    ENDCASE.

  ENDMETHOD.

ENDCLASS.
