*&---------------------------------------------------------------------*
*& Report zuh_uebung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_uebung.

*SELECT FROM scarr FIELDS * INTO TABLE @DATA(lt_tabelle).
*
*cl_demo_output=>display( lt_tabelle ).


SELECT
  FROM lfa1
  LEFT OUTER JOIN T077Y ON lfa1~KTOKK = T077Y~ktokk AND T077Y~spras = @sy-langu
  FIELDS
    lfa1~name1,
    T077Y~txt30
  WHERE land1 = 'DE'
  INTO TABLE @DATA(lt_de_lieferanten_mit_extra).

cl_demo_output=>display( lt_de_lieferanten_mit_extra ).
