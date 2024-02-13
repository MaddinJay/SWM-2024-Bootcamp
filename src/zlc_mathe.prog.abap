*&---------------------------------------------------------------------*
*& Report ZLC_MATHE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZLC_MATHE.

DATA: gv_zahl1 TYPE i,
      gv_dezimalzahl TYPE p DECIMALS 2 VALUE '4.20', "variabledeklaration mit nachkommastelle und vorderfiniertem wert
      gv_adresse TYPE string,
      gv_dezimalzahl2 LIKE gv_dezimalzahl.

WRITE: gv_dezimalzahl.
WRITE: gv_dezimalzahl2.
