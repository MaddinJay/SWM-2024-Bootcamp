*&---------------------------------------------------------------------*
*& Report zfd_abap_debugging1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_abap_debugging1.
*******************************
* 1. Debugging Aufgabe
*******************************
*DAT(lv_test) = 'Test'.
*lv_test = 'Dies ist ein Test'.
*WRITE lv_test.

*DATA lv_test TYPE string VALUE 'Test'. " Option1
*lv_test = 'Dies ist ein Test'.
*WRITE lv_test.

DATA(lv_test) = |Test|.    " Option 2
lv_test = 'Dies ist ein Test'.
WRITE lv_test.

Uline.

*******************************
* 2. Debugging Aufgabe
*******************************
*Fehlerhafter Code

*DATA: lv_add_three TYPE i VALUE 3,
* lv_amount TYPE i,
* lv_bigger_than_thrity TYPE abap_bool.
*WHILE lv_bigger_than_thrity <> abap_true.
* lv_amount += lv_add_three.
* WRITE: 'The amount is ' , lv_amount.
*ENDWHILE.


DATA: lv_add_three TYPE i VALUE 3,
      lv_amount    TYPE i.

WHILE lv_amount < 30.
  lv_amount += lv_add_three.
  WRITE: 'The amount is ' , lv_amount.
ENDWHILE.

ULINE.
*******************************
* Extra: Abap Debugging
*******************************
*DATA lv_value TYPE I.
*lv_vlaue = 'ABC'.
*WRITE lv_value.


DATA lv_value(3) TYPE c. " Falsche Deklaration muss String oder c sein
lv_value = 'ABC'.  " Schreibfehler !
WRITE lv_value.

ULINE.

*******************************
*  Extra: Abap Debugging 2
*******************************
*DATA: lt_table TYPE STANDARD TABLE OF i,
* lv_index TYPE i.
*DO 10 TIMES.
* APPEND sy-index INTO lt_table.
*ENDDO.
*LOOP AT lt_table INTO DATA(lv_index).
* WRITE: / lv_index.
*ENDLOOP.

DATA: lt_table TYPE STANDARD TABLE OF i,
      lv_index TYPE i.
DO 10 TIMES.
  APPEND sy-index TO lt_table. " TO statt INTO,
ENDDO.
LOOP AT lt_table INTO lv_index. " Doppelte Deklarierung
  WRITE: / lv_index.
ENDLOOP.

ULINE.

*******************************
* Extra: ABAP Debugging 3
*******************************
*PARAMETER: p_date TYPE dafault.
*WRITE: / 'Das gewählte Datum ist', p_date.

PARAMETERS: p_date TYPE dats.  " Parameters falsch geschrieben, Date !
WRITE: / 'Das gewählte Datum ist', p_date.

ULINE.
*******************************
* Extra: ABAP Debugging IV
*******************************
*CLASS lcl_local DEFINITION.
* PUBLIC SECTION.
* METHODS process_data IMPORTING it_data TYPE STANDARD TABLE.
*ENDCLASS.
*CLASS lcl_local IMPLEMENTATION.
* METHOD process_data.
* LOOP AT it_data INTO DATA(ls_data).
* WRITE: / ls_data.
* ENDLOOP.
* ENDMETHOD.
*ENDCLASS.
*START-OF-SELECTION.
* NEW lcl_local=>process_data( lt_number ).
*END-OF-SELECTION.

CLASS lcl_local DEFINITION.
  PUBLIC SECTION.
    types: ty_mara type table of mara.
    METHODS: process_data IMPORTING it_data TYPE ty_mara .
ENDCLASS.

CLASS lcl_local IMPLEMENTATION.
  METHOD process_data.
    LOOP AT it_data INTO DATA(ls_data).
      WRITE: / ls_data-matnr.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.

  Data lt_number type STANDARD TABLE OF mara.
  Data(lo_cl) = NEW lcl_local(  ).

*  lcl_local=>process_data( lt_number ).
lo_cl->process_data( lt_number ).

END-OF-SELECTION.

*******************************
* Extra: ABAP Debugging V
*******************************

*DATA: lv_string TYPE STRING.
*lv_string = '100'.
*IF lv_string > 200.
* WRITE: / 'String is greater than 200'.
*ELSE.
* WRITE: / 'String is not greater than 200'.
*ENDIF.

DATA: lv_string TYPE i. " falsche Typendeklaration
lv_string = '100'.
IF lv_string > 200.
 WRITE: / 'String is greater than 200'.
ELSE.
 WRITE: / 'String is not greater than 200'.
ENDIF.

Uline.

*******************************
* Extra: ABAP Debugging VI
*******************************
*TYPES: BEGIN OF ty_material,
* matnr TYPE matnr,
* maktx TYPE maktx,
* END OF ty_material.
*DATA: lt_materials TYPE TABLE OF ty_material,
* ls_material TYPE ty_material.
*SELECT matnr, maktx
* FROM mara
* INTO TABLE lt_materials
* UP TO 10 ROWS.
*LOOP AT lt_materials.
* WRITE: / ls_material-matnr, ls_material-maktx.
*ENDLOOP.

TYPES: BEGIN OF ty_material,
 matnr TYPE matnr,
 matkl TYPE matkl,   " alle maktx umbenennen in z.B. matkl
 END OF ty_material.
DATA: lt_materials TYPE TABLE OF ty_material,
 ls_material TYPE ty_material.
SELECT matnr, matkl
 FROM mara
 INTO CORRESPONDING FIELDS OF TABLE @lt_materials  " corresponding Fields einfügen?
 UP TO 10 ROWS.
LOOP AT lt_materials into ls_material.  " loop ....  into ls_...
 WRITE: / ls_material-matnr, ls_material-matkl.
ENDLOOP.

Uline.

*******************************
* Extra: ABAP Debugging VII
*******************************

*DATA lv_status TYPE c LENGTH 1.
*lv_status = 'A'.
*CASE lv_status.
* WHEN 'A' OR 'B'.
* WRITE: / 'Status A oder B'.
* WHEN 'C'.
* WRITE: / 'Status C'.
* WHEN OTHERS.
* WRITE: / 'Unbekannter Status'.
*ENDCASE.

DATA lv_status TYPE c LENGTH 1.
lv_status = 'A'.
CASE lv_status.
 WHEN 'A' OR 'B'.
 WRITE: / 'Status A oder B'.
 WHEN 'C'.
 WRITE: / 'Status C'.
 WHEN OTHERS.
 WRITE: / 'Unbekannter Status'.
ENDCASE.
