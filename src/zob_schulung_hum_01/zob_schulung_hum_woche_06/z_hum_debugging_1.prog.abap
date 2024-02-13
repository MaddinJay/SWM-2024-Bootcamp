*&---------------------------------------------------------------------*
*& Report z_hum_debugging_1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_hum_debugging_1.

**********************************************************************
*Übung 1
**********************************************************************

*DATA lv_test TYPE string. "Data, ohne Klammer, und Type string, ansonsten kommt nur Dies, da c LENGTH 4 definiert wird.
*lv_test = 'Dies ist ein Test'.
*WRITE lv_test.
*
*ULINE.

**********************************************************************
*Übung 2
**********************************************************************

*DATA: lv_add_three          TYPE i VALUE 3,
*      lv_amount             TYPE i,
*      lv_bigger_than_thrity TYPE abap_bool.
*WHILE lv_bigger_than_thrity <> abap_true.
*  lv_amount += lv_add_three.
*  WRITE: /'The amount is ' , lv_amount.
*  IF lv_amount >= 30.                              "If-Schleife beendet die WHILE-Schleife
*    lv_bigger_than_thrity = abap_true.
*  ENDIF.
*ENDWHILE.
*
*ULINE.

**********************************************************************
*Übung EXTRA 1
**********************************************************************

*DATA lv_value TYPE c LENGTH 3. "alternativ Type string
*lv_value = 'ABC'.
*WRITE lv_value.
*
*ULINE.

**********************************************************************
* Übung EXTRA 2
**********************************************************************

*DATA: lt_table TYPE STANDARD TABLE OF i,
*      lv_index TYPE i.
*DO 10 TIMES.
*  APPEND sy-index TO lt_table.             "TO statt INTO
*ENDDO.
*LOOP AT lt_table INTO lv_index.           "doppelte Deklaration, daher DATA( ) gelöscht
*  WRITE: / lv_index.
*ENDLOOP.
*
*ULINE.

**********************************************************************
* Übung Extra 3
**********************************************************************

*PARAMETERS: p_date TYPE sy-datum.            "PARAMETERS statt PARAMETER; sy-datum statt dafault für Datums-Auswahl
*WRITE: / 'Das gewählte Datum ist', p_date, '(mm/dd/yyyy)'.  "Satz ergänzt, da amerikanisches Datumsformat ausgegeben wird.
*
*ULINE.

**********************************************************************
*Übung EXTRA 4
**********************************************************************

*CLASS lcl_local DEFINITION.
*  PUBLIC SECTION.
*    TYPES: ty_mara TYPE TABLE OF mara.
*    METHODS process_data IMPORTING it_data TYPE ty_mara.
*ENDCLASS.
*
*CLASS lcl_local IMPLEMENTATION.
*  METHOD process_data.
*    LOOP AT it_data INTO DATA(ls_data).
*      WRITE: / ls_data-matnr.
*    ENDLOOP.
*  ENDMETHOD.
*ENDCLASS.
*
*START-OF-SELECTION.
*  DATA lt_number TYPE STANDARD TABLE OF mara.
*  DATA(lo_cl) = NEW lcl_local( ).
*  lo_cl->process_data( lt_number ).
*
*END-OF-SELECTION.
*
*  ULINE.

**********************************************************************
* Übung EXTRA 5
**********************************************************************
  PARAMETERS p_string TYPE i.  "Parameter statt lv und i statt string
  IF p_string > 200.
    WRITE: / 'String is greater than 200'.
  ELSE.
    WRITE: /  'String is not greater than 200'.
  ENDIF.

  ULINE.

**********************************************************************
* Übung EXTRA 6
**********************************************************************
TYPES: BEGIN OF ty_material,
 matnr TYPE matnr,
 maktx TYPE maktx,
 END OF ty_material.
DATA: lt_materials TYPE TABLE OF ty_material,
 ls_material TYPE ty_material.
SELECT matnr, maktx
 FROM makt
 INTO TABLE @lt_materials
 UP TO 10 ROWS.
LOOP AT lt_materials INTO ls_material.
 WRITE: / ls_material-matnr, ls_material-maktx.
ENDLOOP.

ULINE.

**********************************************************************
* Übung EXTRA 7
**********************************************************************
DATA lv_status TYPE c LENGTH 1.
parameters p_status.
lv_status = p_status.
CASE lv_status.
 WHEN 'A' OR 'B'.
 WRITE: / 'Status A oder B'.
 WHEN 'C'.
 WRITE: / 'Status C'.
 WHEN OTHERS.
 WRITE: / 'Unbekannter Status'.
ENDCASE.

ULINE.
