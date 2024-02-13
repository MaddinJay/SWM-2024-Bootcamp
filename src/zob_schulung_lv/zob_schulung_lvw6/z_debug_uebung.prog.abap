*&---------------------------------------------------------------------*
*& Report z_debug_uebung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_debug_uebung.

SELECT * from ZOBLV_T_OWNER into table @DATA(lt_tabelle).
cl_demo_output=>display( lt_tabelle ).

**DATA lv_test TYPE string.
**lv_test = 'Dies ist ein Test'.
**WRITE: / lv_test.
*
*DATA: lv_add_three          TYPE i VALUE 3,
*      lv_amount             TYPE i,
*      lv_bigger_than_thrity TYPE i value 30.
*WHILE lv_amount <> lv_bigger_than_thrity.
*  lv_amount += lv_add_three.
*  WRITE: 'The amount is ' , lv_amount.
*ENDWHILE.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"falscher code:

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"richtiger code:
*CLASS lcl_local DEFINITION.
* PUBLIC SECTION.
* types: ty_mara type table of mara.
* METHODS process_data IMPORTING it_data type ty_mara.
*ENDCLASS.
*CLASS lcl_local IMPLEMENTATION.
* METHOD process_data.
* LOOP AT it_data INTO DATA(ls_data).
* WRITE: / ls_data-matnr.
* ENDLOOP.
* ENDMETHOD.
*ENDCLASS.
*START-OF-SELECTION.
*data lt_number type standard table of mara.
*data(lo_cl) = new lcl_local( ).
*lo_cl->process_data( lt_number ).
** NEW lcl_local=>process_data( lt_number ).
*END-OF-SELECTION.

"ich schreibe einene unsinn. ich bin ein taubes nüsschen yeah du bist ein taubes nüsschen yeah, wir alle sind taube nüsschen yeah taube taube taube nüsschen yeaahhhh
