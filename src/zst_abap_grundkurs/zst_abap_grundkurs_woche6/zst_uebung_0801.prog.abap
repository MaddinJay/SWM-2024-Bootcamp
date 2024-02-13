*&---------------------------------------------------------------------*
*& Report zst_uebung_0801
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_uebung_0801.

*SELECTION-SCREEN BEGIN OF BLOCK eingabe.
*
*  PARAMETERS: p_land TYPE scustom-country.
*
*SELECTION-SCREEN END OF BLOCK eingabe.
*
*DATA: lt_land TYPE TABLE OF scustom,
*      ls_land TYPE scustom,
*      lo_land TYPE REF TO zst_cl_custom.
*
*CREATE OBJECT lo_land.
*
*CALL METHOD lo_land->get_flugdaten
*  EXPORTING
*    iv_land = p_land.


*IF p_land IS INITIAL.
*  SELECT * FROM scustom INTO TABLE @lt_land ORDER BY country, city, street.
*ELSE.
*  SELECT * FROM scustom INTO TABLE @lt_land WHERE country = @p_land ORDER BY country, city, street.
*ENDIF.
*
*cl_demo_output=>display( lt_land ).
*
*LOOP AT lt_land INTO ls_land.
*  WRITE: ls_land.
*ENDLOOP.

*DATA: lt_owner TYPE TABLE OF zobst_t_owner,
*      ls_owner TYPE zobst_t_owner.
*
*SELECT * FROM zobst_t_owner INTO TABLE lt_owner WHERE name not like ''.
*
*cl_demo_output=>display( lt_owner ).
PARAMETERS: p_ein TYPE i.

IF p_ein > 200.
  WRITE: / 'String is greater than 200'.
ELSE.
  WRITE: / 'String is not greater than 200'.
ENDIF.

ULINE.

TYPES: BEGIN OF ty_material,
         matnr TYPE matnr,
         maktx TYPE maktx,
       END OF ty_material.

DATA: lt_materials TYPE TABLE OF ty_material,
      ls_material  TYPE ty_material.

SELECT
 FROM makt
 FIELDS
makt~matnr, makt~maktx
 INTO TABLE @lt_materials
 UP TO 10 ROWS.

LOOP AT lt_materials INTO ls_material.
  WRITE: / ls_material-matnr, ls_material-maktx.
ENDLOOP.


Uline.

PARAMETERS: p_ein2 TYPE c length 1.
CASE p_ein2.
 WHEN 'A' OR 'B'.
 WRITE: / 'Status A oder B'.
 WHEN 'C'.
 WRITE: / 'Status C'.
 WHEN OTHERS.
 WRITE: / 'Unbekannter Status'.
ENDCASE.
