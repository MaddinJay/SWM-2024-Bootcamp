*&---------------------------------------------------------------------*
*& Report zuh_exception
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_exception.

TABLES saplane.

CLASS lcl_flugzeug DEFINITION.

  PUBLIC SECTION.

    METHODS constructor EXCEPTIONS falscher_name.

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
WHERE planetype = 'FOKKER 71'    "FOKKER 71 gibt es nicht
INTO @DATA(ls_flugzeug).

    IF sy-subrc <> 0.
      RAISE falscher_name.
    ELSE.
      mv_weight = ls_flugzeug-weight.
      mv_tankcap = ls_flugzeug-tankcap.
    ENDIF.

  ENDMETHOD.

  METHOD anzeige_attribut.

    WRITE: 'Gewicht:', mv_weight,/ , 'Tankfüllung:', mv_tankcap.

  ENDMETHOD.

ENDCLASS.

DATA go_flugzeug TYPE REF TO lcl_flugzeug.

START-OF-SELECTION.

  CREATE OBJECT go_flugzeug EXCEPTIONS falscher_name = 1.
  IF sy-subrc <> 0.
    WRITE: /, 'Es gibt kein Flugzeug von diesem Typen'.
    EXIT.

  ENDIF.

  go_flugzeug->anzeige_attribut( ).
