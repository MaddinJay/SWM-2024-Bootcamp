CLASS z_as_land DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS: abrufen IMPORTING iv_parameter TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_as_land IMPLEMENTATION.
  METHOD abrufen.


    IF iv_parameter IS NOT INITIAL.
      SELECT
      FROM scustom LEFT JOIN sbook ON scustom~id = sbook~customid
      FIELDS
      scustom~id,
      scustom~name,
      sbook~fldate,
      sbook~bookid,
      sbook~loccuram,
      scustom~country
*      scustom~city,
*      scustom~street,
*      sum( sbook~loccuram ) as summe
      WHERE country = @iv_parameter
*      group by scustom~id, scustom~name, sbook~fldate, sbook~bookid, sbook~loccuram, scustom~country, scustom~city, scustom~street
      ORDER BY country, city, street DESCENDING
      INTO TABLE @DATA(lt_scustom).
    ELSE.
      SELECT
      FROM scustom LEFT JOIN sbook ON scustom~id = sbook~customid
      FIELDS scustom~id, scustom~name, sbook~fldate, sbook~bookid, sbook~loccuram, scustom~country
      ORDER BY country, city, street DESCENDING
      INTO TABLE @lt_scustom.
    ENDIF.


    LOOP AT lt_scustom INTO DATA(ls_scustom).
      WRITE: ls_scustom-id, ls_scustom-name, ls_scustom-fldate, ls_scustom-bookid, ls_scustom-country, /.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
