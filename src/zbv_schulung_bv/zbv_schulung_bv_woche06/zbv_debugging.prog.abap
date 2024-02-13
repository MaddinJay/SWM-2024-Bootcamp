*&---------------------------------------------------------------------*
*& Report zbv_debugging
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbv_debugging.

**ABAP Debugging Übung 1
*DATA lv_test TYPE string VALUE 'Test'. "Option 1
DATA(lv_test) = |Tets|. "Option 2: Pipes-Symbol erzeugt einen String. Mit Abostroph ist es dann der TYPE C.
lv_test = 'Dies ist ein Test'.
WRITE lv_test.

**ABAP Debugging Übung 2
DATA: lv_add_three          TYPE i VALUE 3,
      lv_amount             TYPE i,
      lv_bigger_than_thrity TYPE abap_bool.
WHILE lv_bigger_than_thrity <> abap_true.
  lv_amount += lv_add_three.
  lv_bigger_than_thrity = ABAP_true.
  WRITE: 'The amount is ' , lv_amount.
ENDWHILE.

**Extra Debugging Übung 1
DATA lv_value TYPE string.
lv_value = 'ABC'.
WRITE lv_value.

**Extra Debugging Übung 2
DATA: lt_table TYPE STANDARD TABLE OF i,
      lv_index TYPE i.
DO 10 TIMES.
  APPEND sy-index TO lt_table.
  WRITE: / sy-index.
ENDDO.

*LOOP AT lt_table INTO lv_index.
* WRITE: / lv_index.
*ENDLOOP.

**Extra Debugging Übung 3

*PARAMETERS: p_date TYPE dats.
*
*WRITE: / 'Das gewählte Datum ist', p_date.



**Extra Debugging Übung 3

CLASS lcl_local DEFINITION.
  PUBLIC SECTION.
    TYPES: ty_mara TYPE TABLE OF mara.
    METHODS process_data IMPORTING it_data TYPE ty_mara.
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

DATA(lo_cl) = NEW lcl_local( ).
  lo_cl->process_data( lt_number ).

END-OF-SELECTION.
