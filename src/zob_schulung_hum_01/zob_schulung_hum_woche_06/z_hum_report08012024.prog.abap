*&---------------------------------------------------------------------*
*& Report z_hum_report08012024
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_hum_report08012024.

PARAMETERS p_land LIKE scustom-country.
DATA: lt_custom   TYPE TABLE OF scustom,
      ls_custom   TYPE scustom,
      lo_customer TYPE REF TO zcl_hum_uebung08012024.


CREATE OBJECT lo_customer.

CALL METHOD lo_customer->auslesen_kunden
  EXPORTING
    iv_land = p_land.
CALL METHOD lo_customer->flugbuchungen_und_kosten
  EXPORTING
    iv_land = p_land.
CALL METHOD lo_customer->display_kunden.
CALL METHOD lo_customer->display_flugbuchungen.


*IF p_land IS INITIAL.
*  SELECT *
*  FROM
*  scustom
*  INTO TABLE @lt_custom
*  ORDER BY country, city, street.
*ELSE.
*  SELECT *
* FROM
* scustom
* INTO TABLE @lt_custom
* WHERE country = @p_land
* Order by country, city, street.
*
*ENDIF.
*
*Loop at lt_custom into ls_custom.
*WRITE: ls_custom.
*Endloop.
*
*cl_demo_output=>display( lt_custom ).
