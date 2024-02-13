*&---------------------------------------------------------------------*
*& Report ZMB_DATENREFERENZEN_GENERISCH
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMB_DATENREFERENZEN_GENERISCH.

DATA lv_zahl TYPE i VALUE 10.

Data lr_ref TYPE REF TO data.

FIELD-SYMBOLS <feldsymbol> TYPE i.

get REFERENCE OF lv_zahl into lr_ref.

ASSIGN lr_ref->* to <feldsymbol>.

<feldsymbol> = 20.

write lv_zahl.
