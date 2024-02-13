*&---------------------------------------------------------------------*
*& Report zem_wiederholung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_wiederholung.

*PARAMETERS p_eing TYPE c LENGTH 3.
**
**zem_class_wiederholung=>abruf( iv_eingabe = p_eing ).
*
*zem_class_wiederholung=>kosten( iv_land = p_eing ).

*Select
*From scustom
*fields *
*Where COUNTRY = @p_eing
*order by CITY, country, STREET
*into table @Data(lt_tabelle).
*
**cl_demo_output=>display( lt_tabelle ).
*
*Loop at lt_tabelle into Data(ls_struktur).
*Write: ls_struktur-country, ls_struktur-city, ls_struktur-street.
*Endloop.

*IF p_eing IS INITIAL.
*
*  SELECT
*  FROM sbook
*  LEFT JOIN scustom ON sbook~customid = scustom~id
*  FIELDS
*  sbook~customid,
*  scustom~id,
*  scustom~name,
*  sbook~loccuram,
*  sbook~connid,
*  scustom~country
*  WHERE country = 'DE'
**Order by scustom~id DESCENDING
*  INTO TABLE @DATA(lt_2tabelle)
*  UP TO 10 ROWS.
*
*ELSE.
*
*SELECT
*  FROM sbook
*  LEFT JOIN scustom ON sbook~customid = scustom~id
*  FIELDS
*  sbook~customid,
*  scustom~id,
*  scustom~name,
*  sbook~loccuram,
*  sbook~connid,
*  scustom~country
*  WHERE country = @p_eing
**Order by scustom~id DESCENDING
*  INTO TABLE @lt_2tabelle
*  UP TO 10 ROWS.
*
*ENDIF.
*
**Cl_demo_output=>display( lt_2Tabelle ).
*
*
*LOOP AT lt_2tabelle INTO DATA(ls_2struktur).
*  WRITE: '|', 'KundenId:', ls_2struktur-id, 'Name:', ls_2struktur-name, 'Flugnummer:', ls_2struktur-connid, 'Kosten:', ls_2struktur-loccuram, 'Euro', '|'.
*  ULINE.
*ENDLOOP.



*DATA lv_status TYPE c LENGTH 1.
*lv_status = 'A'.
*
*CASE lv_status.
* WHEN 'A' OR 'B'.
* WRITE: / 'Status A oder B'.
* WHEN 'C'.
* WRITE: / 'Status C'.
* WHEN OTHERS.
* WRITE: / 'Unbekannter Status'.
*ENDCASE.


*DATA: lv_string TYPE i.         "Datentyp string war nicht korrekt
*lv_string = '100'.
*IF lv_string > 200.
* WRITE: / 'String is greater than 200'.
*ELSE.
* WRITE: / 'String is not greater than 200'.
*ENDIF.


TYPES: BEGIN OF ty_material,
 matnr TYPE matnr,
 maktx TYPE maktx,
 END OF ty_material.


DATA: lt_materials TYPE TABLE OF ty_material,
 ls_material TYPE ty_material.

SELECT
 FROM mara
 Fields
  matnr
 INTO TABLE @lt_materials
 UP TO 10 ROWS.
LOOP AT lt_materials INTO ls_material.
 WRITE: / ls_material-matnr, ls_material-maktx.
ENDLOOP.
