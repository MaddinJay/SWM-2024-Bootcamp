*&---------------------------------------------------------------------*
*& Report ztw_wiederholung_uebung_02
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztw_wiederholung_uebung_02.
*
*DATA lv_test TYPE string.
*lv_test = 'Test'.
*lv_test = 'Dies ist ein Test'.
*WRITE lv_test.
*
***********************************************************************
*
*DATA: lv_add_three TYPE i VALUE 3,
*      lv_amount    TYPE i.
*
*lv_amount = lv_amount + lv_add_three.
*
*DO.
*  lv_amount = lv_amount + lv_add_three.
*  WRITE: /, |Der Betrag ist { lv_amount }|.
*  IF
*  lv_amount > 30.
*    EXIT.
*  ENDIF.
*ENDDO.

**********************************************************************

*DATA lv_value TYPE string.
*lv_value = 'ABC'.
*WRITE lv_value.

**********************************************************************

*DATA: lt_table TYPE STANDARD TABLE OF i,
*      lv_index TYPE i.
*DO 10 TIMES.
*  APPEND sy-index to lt_table.
*ENDDO.
*LOOP AT lt_table INTO lv_index.
*  WRITE: / lv_index.
*ENDLOOP.

**********************************************************************
*
*PARAMETERs: p_date TYPE string.
*WRITE: / 'Das gewählte Datum ist', p_date.

**********************************************************************
*
*DATA: lv_string TYPE STRING.
*lv_string = 100.
*IF lv_string > 200.
* WRITE: / 'String is greater than 200'.
*ELSE.
* WRITE: / 'String is not greater than 200'.
*ENDIF.

**********************************************************************

*TYPES: BEGIN OF ty_material,
*         matnr TYPE matnr,
*         maktx TYPE maktx,
*       END OF ty_material.
*DATA: lt_materials TYPE TABLE OF ty_material,
*      ls_material  TYPE ty_material.
*SELECT matnr, maktx
* FROM makt
* INTO TABLE @lt_materials
* UP TO 10 ROWS.
*LOOP AT lt_materials INTO ls_material.
*  WRITE: / ls_material-matnr, ls_material-maktx.
*ENDLOOP.

**********************************************************************

DATA lv_status TYPE c LENGTH 1.
lv_status = 'Z'.
CASE lv_status.
 WHEN 'A' OR 'B'.
 WRITE: / 'Status A oder B'.
 WHEN 'C'.
 WRITE: / 'Status C'.
 WHEN OTHERS.
 WRITE: / 'Unbekannter Status'.
ENDCASE.
