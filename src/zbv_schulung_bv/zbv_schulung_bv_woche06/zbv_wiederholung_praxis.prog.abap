*&---------------------------------------------------------------------*
*& Report zbv_wiederholung_praxis
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbv_wiederholung_praxis.
TABLES: scustom.

SELECTION-SCREEN BEGIN OF BLOCK abc WITH FRAME TITLE TEXT-001.
  PARAMETERS p_code TYPE scustom-country.
SELECTION-SCREEN END OF BLOCK abc.

DATA go_praxis type ref to zbv_praxis_klasse.

go_praxis = NEW #( iv_code = p_code ).


*cl_demo_output=>display( lt_Tabelle ).


*cl_demo_output=>display( lt_Tabelle2 ).

*IF p_code IS not INITIAL.
*  SELECT
*  FROM scustom
*  FIELDS
*  name,
*  country,
*  city,
*  street,
*  postcode
*  WHERE country = @p_code
*  ORDER BY country, city, street ASCENDING
*  INTO TABLE @DATA(lt_tabelle).
**  cl_demo_output=>display( lt_Tabelle ).
*ELSEIF p_code IS INITIAL.
*  SELECT
*  FROM scustom
*  FIELDS
*  name,
*  country,
*  city,
*  street,
*  postcode
*  ORDER BY country, city, street ASCENDING
*  INTO TABLE @DATA(lt_tabelle2).
**  cl_demo_output=>display( lt_Tabelle2 ).
*ENDIF.
*
*LOOP AT lt_tabelle into DATA(ls_struktur).
*WRITE: / |Der Kunde { ls_struktur-name } wohnt in { ls_struktur-street } { ls_struktur-city } { ls_struktur-country }|.
*ENDLOOP.
