*&---------------------------------------------------------------------*
*& Report ztw_wiederholung_woche_2_1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztw_wiederholung_woche_2_1.

*SELECT SINGLE
*FROM
*scarr
*FIELDS *
*INTO @DATA(ls_1).
*cl_demo_output=>display( ls_1 ).
*
*SELECT
*FROM scarr
*FIELDS *
*INTO TABLE @DATA(lt_2).
*cl_demo_output=>display( lt_2 ).


*SELECT
*sflight~mandt,
*sflight~carrid,
*sflight~connid,
*SUM( sflight~price ) AS price_sum
*FROM sflight
*GROUP BY mandt, carrid, connid.

"Einfache eingabe
PARAMETERS p_test TYPE string.

"Checkbox
PARAMETERS p_check AS CHECKBOX.

"Radiobutton
PARAMETERS: p_r1 RADIOBUTTON GROUP g_1 DEFAULT 'X',
            p_r2 RADIOBUTTON GROUP g_1,
            p_r3 RADIOBUTTON GROUP g_1  .

"Komplexe Eingabe
TABLES scarr.
SELECT-OPTIONS s_opt1 FOR scarr-carrid.

"Blöcke
SELECTION-SCREEN BEGIN OF BLOCK block1 WITH FRAME TITLE text-001.
SELECTION-SCREEN END OF BLOCK block1.

"
AT SELECTION-SCREEN ON RADIOBUTTON GROUP g_1.
WRITE 'TEst'.
