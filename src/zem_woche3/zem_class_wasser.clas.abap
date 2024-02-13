CLASS zem_class_wasser DEFINITION
  PUBLIC
  INHERITING FROM zem_class_getraenk

  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS erhoehte_menge REDEFINITION. "Redefiniert eine Methode

    CLASS-METHODS wasser.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zem_class_wasser IMPLEMENTATION.

  METHOD erhoehte_menge.

    SKIP. WRITE: 'Wasser:'. ULINE.

    mv_menge = mv_menge + 2.

    mv_menge = mv_menge + iv_erhoehte_menge.

  ENDMETHOD.


  METHOD wasser.

    WRITE: / 'Wasser: Die Füllmenge erhöht sich um weitere 2 dl', /.

  ENDMETHOD.

ENDCLASS.
