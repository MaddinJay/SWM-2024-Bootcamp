CLASS ztl_mapping DEFINITION
  PUBLIC
  CREATE PUBLIC.

    PUBLIC SECTION.
      METHODS map_gender IMPORTING iv_gender        TYPE int1
                         RETURNING VALUE(rv_gender) TYPE char1.

      METHODS map_language IMPORTING iv_language        TYPE char1
                           RETURNING VALUE(rv_language) TYPE string.
    PROTECTED SECTION.
    PRIVATE SECTION.
  ENDCLASS.

  CLASS ztl_mapping IMPLEMENTATION.

    METHOD map_gender.
      " Mappe
      " 1 -> F
      " 2 -> M
      " 3 -> D

      IF iv_gender = 1.
        WRITE: / 'F'.
      ELSEIF iv_gender = 2.
        WRITE: / 'M'.
      ELSEIF iv_gender = 3.
        WRITE: / 'D'.
        ELSE.

      ENDIF.

    ENDMETHOD.

    METHOD map_language.
      " Mappe
      " D -> de
      " E -> en
      " F -> fr
      IF iv_language = 'D'.
        WRITE: / 'de'.
      ELSEIF iv_language = 'E'.
        WRITE: / 'en'.
      ELSEIF iv_language = 'F'.
        WRITE: / 'fr'.
      ENDIF.


    ENDMETHOD.

  ENDCLASS.

