CLASS zuh_phonenummer DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

      METHODS clean
      IMPORTING
        !number       TYPE string
      RETURNING
        VALUE(result) TYPE string
      RAISING
        cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zuh_phonenummer IMPLEMENTATION.
  METHOD clean.
Data(lv_number) = !number.
* replace alle OCCurrences of REGEX '[^\d]' in lv_number with '' into result.

*replace all OCCURRENCES OF lv_number '[^\d]' in lv_number with '' into lv_clean.
Replace all OCCURRENCES OF '-' in lv_number with ''.
Replace all OCCURRENCES OF ' ' in lv_number with ''.
Replace all OCCURRENCES OF '(' in lv_number with ''.
Replace all OCCURRENCES OF ')' in lv_number with ''.
result = lv_number.

  ENDMETHOD.

ENDCLASS.
