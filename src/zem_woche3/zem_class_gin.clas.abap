CLASS zem_class_gin DEFINITION
  PUBLIC
  INHERITING FROM zem_class_getraenk

  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS erhoehte_menge REDEFINITION. "Redefiniert eine Methode

    METHODS constructor.

    CLASS-METHODS gin.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zem_class_gin IMPLEMENTATION.

  METHOD erhoehte_menge.

    SKIP. WRITE: 'Gin:'. ULINE.
    mv_menge = mv_menge + iv_erhoehte_menge.

  ENDMETHOD.


  METHOD constructor.

    super->constructor( ).

    mv_menge = mv_menge + 1.

  ENDMETHOD.

  METHOD gin.

    WRITE: /'Gin: Die Füllmenge erhöht sich um weitere 1 dl', /.

  ENDMETHOD.

ENDCLASS.
