*&---------------------------------------------------------------------*
*& Report zem_debuggen
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_debuggen.

**DATa(lv_test) = 'Test'.                  "Dat(a) hat gefehlt
*Data lv_test type string.
*lv_test = 'Dies ist ein Test'.            "wenn "dies ist ein test" keine  Inlinedeklaration
*WRITE lv_test.


*DATA: lv_add_three TYPE i VALUE 3,
*      lv_amount TYPE i,
*      lv_bigger_than_thrity TYPE abap_bool.
*
*
*WHILE lv_amount < 30.
* lv_amount += lv_add_three.
* WRITE: '|', 'The amount is:', lv_amount, '|'.
* uline.
*ENDWHILE.

*DATA lv_value(3) TYPE c.               "Name variable war abweichend. Datentyp I nicht kompatibel mit 'ABC'.
*lv_value = 'ABC'.
*WRITE lv_value.
*
*
*DATA: lt_table TYPE STANDARD TABLE OF i,
* lv_index TYPE i.
*DO 10 TIMES.
* APPEND sy-index to lt_table.
*ENDDO.
*LOOP AT lt_table INTO lv_index.
* WRITE: / lv_index.
*ENDLOOP.
*
*PARAMETERs: p_date TYPE string.               " Parameter(s) ... alte Schreibweise: ohne 'S'.
*WRITE: / 'Das gewählte Datum ist', p_date.


*select
*From VBAK
*left join vbap on vbAK~VBELN = VBAP~vbeln
*left join kna1 on vbak~kunnr = kna1~kunnr
*fields
*VBAK~vbeln,
*VBAK~NETWR,
*vbap~posnr,
*vbap~matnr,
**makt~maktx,
**makt~maktg,
*vbap~ARKTX,
*kna1~name1
**count( matnr ) as summe
*into table @data(lt_tabelle).
*
*cl_demo_output=>display( lt_tabelle ).

DATA lv_count TYPE i VALUE 0.
DATA lv_toggle TYPE abap_bool VALUE abap_true.

WHILE lv_count <> 11.
  IF lv_toggle = abap_true.
    lv_count = lv_count + 3.
    lv_toggle = abap_false.
  ELSE.
    lv_count = lv_count + 2.
    lv_toggle = abap_true.
  ENDIF.
  WRITE lv_count.
ENDWHILE.
