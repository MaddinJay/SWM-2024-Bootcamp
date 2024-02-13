CLASS z_as_gpt DEFINITION
PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: get_customers IMPORTING iv_land TYPE string.
    DATA: gt_customers TYPE TABLE OF scustom.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS z_as_gpt IMPLEMENTATION.
  METHOD get_customers.
    CLEAR gt_customers.
    IF iv_land IS NOT INITIAL.
      SELECT * FROM scustom INTO TABLE @gt_customers WHERE country = @iv_land ORDER BY country.
    ELSE.
      SELECT * FROM scustom INTO TABLE gt_customers ORDER BY country.
    ENDIF.
  ENDMETHOD.


ENDCLASS.

