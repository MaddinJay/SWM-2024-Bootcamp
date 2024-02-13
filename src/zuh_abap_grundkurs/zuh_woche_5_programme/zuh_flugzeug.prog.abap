*&---------------------------------------------------------------------*
*& Report zuh_flugzeug
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_flugzeug.

TABLES saplane.

CLASS lcl_flugzeug DEFINITION.

  PUBLIC SECTION.

    METHODS constructor .

    METHODS anzeige_attribut.

  PRIVATE SECTION.

    DATA mv_weight TYPE saplane-weight.
    DATA mv_tankcap TYPE saplane-tankcap.

ENDCLASS.

CLASS lcl_flugzeug IMPLEMENTATION.

  METHOD constructor.

    SELECT SINGLE
FROM saplane
FIELDS weight, tankcap
WHERE planetype = 'FOKKER 70'
INTO @DATA(ls_flugzeug).

    mv_weight = ls_flugzeug-weight.
    mv_tankcap = ls_flugzeug-tankcap.

  ENDMETHOD.

  METHOD anzeige_attribut.

    WRITE: 'Gewicht:', mv_weight,/ , 'Tankfüllung:', mv_tankcap.

  ENDMETHOD.

ENDCLASS.

DATA go_flugzeug TYPE REF TO lcl_flugzeug.

START-OF-SELECTION.

  go_flugzeug = NEW #( ).

  go_flugzeug->anzeige_attribut( ).
