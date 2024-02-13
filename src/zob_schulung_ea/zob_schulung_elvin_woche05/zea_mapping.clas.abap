CLASS zea_mapping DEFINITION
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

CLASS zea_mapping IMPLEMENTATION.

  METHOD map_gender.

rv_gender = COND #( WHEN iv_gender = 1  THEN 'F' "Neue Schreibweise, zb. statt CASE oder IF, statt COND kann auch SWITCH gemacht werden, schreibweise jedoch dann anders.
                    WHEN iv_gender = 2  THEN 'M'
                    WHEN iv_gender = 3  THEN 'D' ).


*CASE iv_gender.
*    WHEN '1'.
*    rv_gender = 'F'.
*    WHEN '2'.
*    rv_gender = 'M'.
*    WHEN '3'.
*    rv_gender = 'D'.
*ENDCASE.


*     rv_gender = 'F'.
*     IF
*        iv_gender = 1.
*        rv_gender = 'F'.
*     ELSEIF
*        iv_gender = 2.
*        rv_gender = 'M'.
*     ELSEIF
*        iv_gender = 3.
*        rv_gender = 'D'.
*     ENDIF.


  ENDMETHOD.

  METHOD map_language.

  rv_language = COND #( WHEN iv_language = 'D' THEN 'de'
                        WHEN iv_language = 'E' THEN 'en'
                        WHEN iv_language = 'F' THEN 'fr').






  ENDMETHOD.

ENDCLASS.




