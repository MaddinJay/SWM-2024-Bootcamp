CLASS ztm_gender DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS map_gender IMPORTING iv_gender        TYPE int1
                       RETURNING VALUE(rv_gender) TYPE char1. "Interface

    METHODS map_language IMPORTING iv_language        TYPE char1
                         RETURNING VALUE(rv_language) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA: mo_gender   TYPE string,
          mo_language TYPE string.


ENDCLASS.

CLASS ztm_gender IMPLEMENTATION.

  METHOD map_gender.


*mo_gender = iv_gender.

*    IF mo_gender = 1.
*      rv_gender = 'F'.
*
*    ELSEIF mo_gender = 2.
*      rv_gender = 'M'.
*
*    ELSEIF mo_gender = 3.
*      rv_gender = 'D'. "Message
*
*    ELSE.
*      MESSAGE 'Für die Eingabe "{ iv_gender }" erfolgt keine Ausgabe' TYPE 'I'.
*
*    ENDIF.

*    CASE iv_gender.
*      WHEN '1'.
*        rv_gender = 'F'.
*      WHEN '2'.
*        rv_gender = 'M'.
*      WHEN '3'.
*        rv_gender = 'D'.
*      WHEN OTHERS.
*        MESSAGE 'Für die Eingabe "{ iv_gender }" erfolgt keine Ausgabe' TYPE 'I'.
*
*    ENDCASE.


*    rv_gender = Cond #( When iv_gender = 1 then 'F'
*                        When iv_gender = 2 then 'M'
*                        When iv_gender = 3 then 'D').


*    rv_gender = SWITCH #( iv_gender
*                          mod 15 then ''
*                          when 2 then 'M'
*                          when 3 then 'D').


  ENDMETHOD.



  METHOD map_language.


 mo_languAGE = iv_language.

    IF mo_language = 'D'.
     rv_language = 'DE'.

     Elseif mo_language = 'E'.
     rv_language = 'EN'.

     Elseif mo_language = 'F'.
     rv_language = 'FR'.

     Else.
     DATA(lv_message) = |Für die Eingabe "{ iv_language }" erfolgt keine Ausgabe|.
     MESSAGE lv_message TYPE 'I'.

   Endif.


  ENDMETHOD.

ENDCLASS.
