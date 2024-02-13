*&---------------------------------------------------------------------*
*& Report zem_prog_assesesment
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_prog_assesesment.

**Oberklasse
*Data(lo_1) = NEW zem_class1_assesment(  ).  " Constructor          +       2
**Unterklasse                                "
*Data(lo_2) = NEW zem_class2_assesment(  ).  " SuperConstructor     +  10.000
*                                            " Redefinition Import  +   1.000
*                                            " Redefinition Export  +     100
*                                            "--------------------------------
*                                            " Gesamt Export:       +  11.102
*
*Data lv_import1 type i.
*Data lv_import2 type i.
*
*lo_1->twoimport( exporting iv_import1 = 1 ).          "mit Constructor + 2
*lo_1->twoexport( importing ev_export1 = lv_import1 ). "Ausgabe: Import + 2
*
*lo_2->twoimport( iv_import1 = 1 ).                    "Redefinition Import + 1.000 UND SuperConstructor + 10.000
*lo_2->twoexport( importing ev_export1 = lv_import2 ). "Redifinition Export + 100 = 11.100  (+ 3 aus Oberklasse = 11.103.)
*
*Write: lv_import1, lv_import2.


* lo_1: Import: 1 + Constructor: 2 = Ausgabe: 3

* lo_2: Import: 1 + Constructor: 2 + Redefinition Import: 1.000 + SuperConstrucor: 10.000 + Redefinition Export: 100
* = Ausgabe: 11.103.


*DATA lv_count TYPE i VALUE 0.
*DATA lv_toggle TYPE abap_bool VALUE abap_true.
*
*WHILE lv_count <> 11.
*  IF lv_toggle = abap_true.
*    lv_count = lv_count + 3.
*    lv_toggle = abap_false.
*  ELSE.
*    lv_count = lv_count + 2.
*    lv_toggle = abap_true.
*  ENDIF.
*  WRITE lv_count.
*ENDWHILE.


*DATA lo_1 TYPE REF TO zcl_em_hello_abap.
*
*DATA lv_1 TYPE string.
*
*lo_1 = NEW #(  ).
*
*lv_1 = lo_1->get_information(  ).
*
*WRITE lv_1.

*Data iv_1 type string.
*
*Call FUNCTION 'Z_READ_FORTUNE'
*Exporting iv_name = 'kasdlf'
*iv_age = 4
*iv_sex = 'F'
*Importing
*ev_fortune = iv_1.


Select
from zem_cds_ueben
Fields *
Into table @Data(lt_tabelle).

cl_demo_output=>display( lt_tabelle ).
