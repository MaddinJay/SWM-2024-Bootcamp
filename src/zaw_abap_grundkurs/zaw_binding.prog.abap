*&---------------------------------------------------------------------*
*& Report ZAW_BINDING
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_binding.

* Definition der Klassen

CLASS lcl_ober DEFINITION.
  PUBLIC SECTION.
    METHODS emma.
    METHODS hugo.

ENDCLASS.

CLASS lcl_unter DEFINITION INHERITING FROM lcl_ober.
  PUBLIC SECTION.
    METHODS hugo REDEFINITION.
    METHODS do.
ENDCLASS.

* Implementierung der Klassen

CLASS lcl_ober IMPLEMENTATION.
  METHOD emma.
    WRITE / 'Ich bin emma() von lcl_ober. Ich rufe me-hugo auf.'.
    me->hugo( ).
  ENDMETHOD.
  METHOD hugo.
    WRITE / 'Ich bin hugo() von lcl_ober.'.
  ENDMETHOD.
ENDCLASS.

CLASS lcl_unter IMPLEMENTATION.
  METHOD hugo.
    WRITE / 'Ich bin hugo() von lcl_unter.'.
  ENDMETHOD.
  METHOD do.
    me->emma( ).
  ENDMETHOD.

ENDCLASS.

* Abruf, Verarbeitung und Anzeige der Daten aus den Klassen

START-OF-SELECTION.
  DATA gr_unter TYPE REF TO lcl_unter.
  CREATE OBJECT gr_unter.

  gr_unter->do( ).
