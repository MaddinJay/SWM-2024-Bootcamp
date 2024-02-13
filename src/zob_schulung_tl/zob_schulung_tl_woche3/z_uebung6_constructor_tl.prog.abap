*&---------------------------------------------------------------------*
*& Report z_uebung6_constructor_tl
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_uebung6_constructor_tl.
"Übung 6.1 mit SELECT Befehl zum Tabelle saplane

CLASS lcl_airplane DEFINITION.

  PUBLIC SECTION.
    METHODS constructor IMPORTING  iv_name TYPE string
                        EXCEPTIONS wrong_planetype. "Aufgabe 6.2 Klassische Exception


    METHODS display_attributes.

  PRIVATE SECTION.
    DATA: mv_name      TYPE string,
          mv_planetype TYPE saplane-planetype,
          mv_weight    TYPE saplane-weight,
          mv_tankcap   TYPE saplane-tankcap.

    CLASS-DATA: gv_n_o_airplanes TYPE i.

ENDCLASS.

CLASS lcl_airplane IMPLEMENTATION.

  METHOD constructor.
    mv_name = iv_name.


    SELECT SINGLE
    FROM
    saplane
    FIELDS
    planetype, weight, tankcap
    WHERE planetype = 'TEA'
    INTO @DATA(ls_airplane).
    mv_planetype = ls_airplane-planetype.
    mv_weight = ls_airplane-weight.
    mv_tankcap = ls_airplane-tankcap.
    ADD 1 TO gv_n_o_airplanes.

    "Aufgabe 6.2 --> Wenn man kein Eintrag in der Tabelle findet --> Exception werfen.
    RAISE wrong_planetype. "Raus aus Methode

  ENDMETHOD.

  METHOD display_attributes.
    WRITE: / 'Airplane Name: ', mv_name.
    WRITE: / 'Planeype: ', mv_planetype.
    WRITE: / 'Number of airplanes: ', gv_n_o_airplanes.
    WRITE: / 'Weight: ', mv_weight.
    WRITE: / 'Tankcap: ', mv_tankcap.
  ENDMETHOD.

ENDCLASS.

DATA: go_airplane TYPE REF TO lcl_airplane.

START-OF-SELECTION.
  CREATE OBJECT go_airplane
    EXPORTING
      iv_name = 'Airbus'
    EXCEPTIONS wrong_planetype = 1.
  IF sy-subrc <> 0. "wenn es nicht stimmt also wenn kein flugzeugtyp gefunden wird dann zeigt es untere an:
  WRITE: / 'Es ist ein Fehler aufgetreten.'.
  EXIT.
  ENDIF.
  go_airplane->display_attributes(  ).
