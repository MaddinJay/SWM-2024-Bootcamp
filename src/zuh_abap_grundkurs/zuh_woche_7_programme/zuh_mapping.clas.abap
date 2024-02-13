CLASS zuh_mapping DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS map_gender IMPORTING iv_gender        TYPE int1
                       RETURNING VALUE(rv_gender) TYPE char1.

    METHODS map_lanuage IMPORTING iv_language        TYPE char1
                        RETURNING VALUE(rv_language) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: lv_gender   TYPE char1,
          lv_language TYPE string.
ENDCLASS.

CLASS zuh_mapping IMPLEMENTATION.

  METHOD map_gender.
    CASE iv_gender.
      WHEN 1.
        rv_gender = 'F'.
      WHEN 2.
        rv_gender ='M'.
      WHEN OTHERS.
        rv_gender = 'D'.
    ENDCASE.

  ENDMETHOD.

  METHOD map_lanuage.

    rv_language = SWITCH #(  iv_language
      WHEN 'D' THEN 'de'
      WHEN 'E' THEN 'en'
    ELSE 'fr').

  ENDMETHOD.

ENDCLASS.
