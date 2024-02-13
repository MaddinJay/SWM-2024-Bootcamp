*&---------------------------------------------------------------------*
*& Report zaw_uebung_debugging
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_uebung_debugging.

**********************************************************************

DATA(lv_test) = |Test|.
lv_test = 'Dies ist ein Test'.
WRITE lv_test.

**********************************************************************

DATA: lv_add_three          TYPE i VALUE 3,
      lv_amount             TYPE i,
      lv_bigger_than_thirty TYPE abap_bool.

WHILE lv_bigger_than_thirty <> abap_true.
  lv_amount += lv_add_three.
  WRITE: 'The amount is ' , lv_amount.
  lv_bigger_than_thirty = abap_true.
ENDWHILE.

**********************************************************************

DATA lv_value TYPE string.
lv_value = 'ABC'.
WRITE lv_value.

**********************************************************************

DATA: lt_table TYPE STANDARD TABLE OF i.
*      lv_index TYPE i.

DO 10 TIMES.
  APPEND sy-index TO lt_table.
  WRITE: / sy-index.
ENDDO.
*LOOP AT lt_table INTO lv_index.
*  WRITE: / lv_index.
*ENDLOOP.

***********************************************************************

PARAMETERS p_date TYPE dats.
WRITE: / 'Das gewählte Datum ist', p_date.

**********************************************************************

CLASS lcl_local DEFINITION.
  PUBLIC SECTION.
    TYPES: ty_mara TYPE TABLE OF mara.
    CLASS-METHODS process_data IMPORTING it_data TYPE ty_mara.
ENDCLASS.

CLASS lcl_local IMPLEMENTATION.
  METHOD process_data.
    LOOP AT it_data INTO DATA(ls_data).
      WRITE: / ls_data-matnr.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.

  DATA lt_number TYPE STANDARD TABLE OF mara.
*  DATA(lo_cl) = NEW lcl_local( ).
*  lo_cl->process_data( lt_number ).
  lcl_local=>process_data( lt_number ).

END-OF-SELECTION.

**********************************************************************

  DATA: lv_string TYPE string.
  lv_string = '100'.
  IF lv_string > 200.
    WRITE: / 'String is greater than 200'.
  ELSE.
    WRITE: / 'String is not greater than 200'.
  ENDIF.

**********************************************************************

  TYPES: BEGIN OF ty_material,
           matnr TYPE matnr,
           maktx TYPE maktx,
         END OF ty_material.
  DATA: lt_materials TYPE TABLE OF ty_material,
        ls_material  TYPE ty_material.
  SELECT matnr, maktx
   FROM makt
   INTO TABLE @lt_materials
   UP TO 10 ROWS.
  LOOP AT lt_materials into ls_material.
    WRITE: / ls_material-matnr, ls_material-maktx.
  ENDLOOP.
