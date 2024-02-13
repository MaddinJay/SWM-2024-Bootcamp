CLASS zcl_hum_mapping DEFINITION
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



CLASS zcl_hum_mapping IMPLEMENTATION.
  METHOD map_gender.
    "Mappe
    rv_gender = SWITCH #( iv_gender                  "Switch, ebenfalls neuere Schreibweise
                          WHEN 1 THEN 'F'
                          WHEN 2 THEN 'M'
                          ELSE 'D' ).

*    rv_gender = COND #( WHEN iv_gender = 1 THEN 'F'  "Condition Befehl, neuere Schreibweise zu IF oder CASE
*                        WHEN iv_gender = 2 THEN'M'
*                        ELSE 'D').

  ENDMETHOD.

  METHOD map_lanuage.
    "Mappe
    rv_language = SWITCH #(  iv_language
                          WHEN 'D' THEN 'de'
                          WHEN 'E' THEN 'en'
                          WHEN 'F' THEN 'fr').
  ENDMETHOD.

ENDCLASS.
