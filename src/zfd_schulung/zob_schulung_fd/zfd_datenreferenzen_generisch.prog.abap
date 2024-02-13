*&---------------------------------------------------------------------*
*& Report ZFD_DATENREFERENZEN_GENERISCH
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZFD_DATENREFERENZEN_GENERISCH.

Data lv_zahl TYPE i Value 10.
Data lr_ref TYPE REF TO data.

FIELD-SYMBOLS <feldsymbol> TYPE i.

GET REFERENCE OF lv_zahl into lr_ref.

ASSIGN lr_ref->* to <feldsymbol>.

<feldsymbol> = 20.

write lv_zahl.
