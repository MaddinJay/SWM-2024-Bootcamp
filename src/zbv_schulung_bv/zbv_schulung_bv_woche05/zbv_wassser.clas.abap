CLASS zbv_wassser DEFINITION
  PUBLIC
  INHERITING FROM zbv_getraenk
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zbv_wassser IMPLEMENTATION.


  METHOD constructor.

    super->constructor( ). "wenn diese Zeile da ist muss für eine Redifinition der Befehl in der Public Section nicht verwendet werden
    mv_menge = 2.
  ENDMETHOD.

ENDCLASS.
