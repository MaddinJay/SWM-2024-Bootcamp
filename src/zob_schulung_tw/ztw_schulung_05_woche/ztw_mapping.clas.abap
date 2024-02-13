CLASS ztw_mapping DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS map_gender IMPORTING iv_gender        TYPE int1
                       RETURNING VALUE(rv_gender) TYPE char1.

    METHODS map_language IMPORTING iv_language        TYPE char1
                         RETURNING VALUE(rv_language) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA: mo_gender   TYPE string,
          mo_language TYPE string.


ENDCLASS.

CLASS ztw_mapping IMPLEMENTATION.

  METHOD map_gender.
    IF
    iv_gender = 1.
      rv_gender = 'F'.
    ELSEIF iv_gender = 2.
      rv_gender = 'M'.
    ELSE.
      rv_gender = 3.
      rv_gender = 'D'.
    ENDIF.


  ENDMETHOD.



  METHOD map_language.



  ENDMETHOD.

ENDCLASS.
