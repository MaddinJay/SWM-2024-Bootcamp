CLASS zcl_tl_wasser DEFINITION
  PUBLIC
  INHERITING FROM zcl_tl_getraenk

  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor. "Aufgabe:Zusätzlich zur Befüllung durch den “Super-Konstruktor” sollen hier 2 dl “hinzugefüllt” werden


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_tl_wasser IMPLEMENTATION.
  METHOD constructor.

    super->constructor( ). "muss keine REDEFINITION oben bei Methods constructor stehen, da hier super constructor steht!!!!
    mv_menge = 2.

  ENDMETHOD.

ENDCLASS.
