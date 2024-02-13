CLASS zaw_klasse_wiederholung DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA: ls_land TYPE scustom.

    METHODS: get_flugdaten IMPORTING iv_land TYPE scustom-country.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.


CLASS zaw_klasse_wiederholung IMPLEMENTATION.

  METHOD get_flugdaten.

    IF iv_land IS INITIAL.

      SELECT
      FROM scustom
      LEFT JOIN sbook ON scustom~id = sbook~customid
      FIELDS scustom~country, scustom~name, scustom~city, scustom~street, sbook~bookid, sbook~loccuram
      INTO TABLE @DATA(lt_buch).

    ELSE.

      SELECT
      FROM scustom
      LEFT JOIN sbook ON scustom~id = sbook~customid
      FIELDS scustom~country, scustom~name, scustom~city, scustom~street, sbook~bookid, sbook~loccuram
      WHERE scustom~country = @iv_land
      INTO TABLE @lt_buch.

    ENDIF.

    cl_demo_output=>display( lt_buch ).

  ENDMETHOD.

ENDCLASS.
