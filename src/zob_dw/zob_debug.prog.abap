**&---------------------------------------------------------------------*
**& Report zob_debug
**&---------------------------------------------------------------------*
**&
**&---------------------------------------------------------------------*
REPORT zob_debug.
*
***********************************************************************
*"Der Code enthält einen Syntaxfehler und einen Logikfehler.
*DATA lv_test TYPE string VALUE 'Test'. "Option 1
*DATA(lv_test) = |Test|. "Option 2
*lv_test = 'Dies ist ein Test'.
*WRITE lv_test.
*
***********************************************************************
*DATA: lv_add_three           TYPE i VALUE 3,
*      lv_amount                      TYPE i,
*      lv_bigger_than_thrity  TYPE abap_bool.
*
*WHILE lv_bigger_than_thrity <> abap_true.
*   lv_amount += lv_add_three.
*   WRITE: 'The amount is ' , lv_amount.
*   lv_bigger_than_thrity = abap_true.
*ENDWHILE.
***********************************************************************
*"Der Code enthält einen Logikfehler und einen Syntaxfehler.
*DATA lv_value TYPE string.
*lv_value = 'ABC'.
*
*WRITE lv_value.
***********************************************************************
*"Der Code enthält zwei Syntaxfehler und ein Logikfehler.
*DATA: lt_table TYPE STANDARD TABLE OF i.
**      lv_index TYPE i.
*
*DO 10 TIMES.
*  APPEND sy-index TO lt_table.
*  WRITE: / sy-index. "zwei Loops hinterienander xx
*ENDDO.

*"LOOP AT lt_table INTO DATA(lv_index).
*"  WRITE: / lv_index.
*"ENDLOOP.
*
***********************************************************************
*"Der Code enthält einen Syntaxfehler.
*PARAMETERS: p_date TYPE dats.
*
*WRITE: / 'Das gewählte Datum ist', p_date.
**
***********************************************************************
*"Der Code enthält einen Logikfehler.
*CLASS lcl_local DEFINITION.
*  PUBLIC SECTION.
*    TYPES: ty_mara TYPE TABLE OF mara.
*    CLASS-METHODS process_data IMPORTING it_data TYPE ty_mara.
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
*
*  lcl_local=>process_data( lt_number ).
*
*END-OF-SELECTION.



*
***********************************************************************
*"Der Code enthält einen Syntaxfehler.
*DATA: lv_string TYPE i. "Typ war unpassend
*
*lv_string = '100'.
*
*IF lv_string > 200.
*  WRITE: / 'String is greater than 200'.
*ELSE.
*  WRITE: / 'String is not greater than 200'.
*ENDIF.
*
*
***********************************************************************
*"Der Code enthält zwei Logikfehler und ein Synthaxfehler
*TYPES: BEGIN OF ty_material,
*         matnr TYPE matnr,
*         maktx TYPE maktx,
*       END OF ty_material.
*
*DATA: lt_materials TYPE TABLE OF ty_material,
*      ls_material  TYPE ty_material.
*
*SELECT matnr ", maktx  nicht Teil der Mara Tabelle
*   FROM mara
*   INTO TABLE @lt_materials "@ fehlte
*   UP TO 10 ROWS.
*
*LOOP AT lt_materials INto ls_material.  "INTO Struktur fehlte
*  WRITE: / ls_material-matnr, ls_material-maktx.
*ENDLOOP.
*
***********************************************************************
*"Der Code enthält keinen Fehler.
*DATA lv_status TYPE c LENGTH 1.
*lv_status = 'A'.
*
*CASE lv_status.
*  WHEN 'A' OR 'B'.
*    WRITE: / 'Status A oder B'.
*  WHEN 'C'.
*    WRITE: / 'Status C'.
*  WHEN OTHERS.
*    WRITE: / 'Unbekannter Status'.
*ENDCASE.
