CLASS ZEM_CLASS_Getraenk DEFINITION
PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.


    METHODS constructor.

    METHODS reduzierte_menge IMPORTING iv_reduzierte_menge TYPE int1.

    METHODS erhoehte_menge IMPORTING iv_erhoehte_menge TYPE int1.

    METHODS get_menge RETURNING VALUE(rv_menge) TYPE int1.

    CLASS-METHODS beschreibung.

  PROTECTED SECTION.
    DATA: mv_menge     TYPE int1,
          art_getraenk TYPE string.

  PRIVATE SECTION.



ENDCLASS.


CLASS zem_class_getraenk IMPLEMENTATION.

  METHOD constructor.
    mv_menge = 1.
  ENDMETHOD.

  METHOD erhoehte_menge.
    mv_menge = mv_menge + iv_erhoehte_menge.
  ENDMETHOD.

  METHOD get_menge.
    rv_menge = mv_menge.
  ENDMETHOD.

  METHOD reduzierte_menge.
    mv_menge = mv_menge - iv_reduzierte_menge.
  ENDMETHOD.

  METHOD beschreibung.

    WRITE: 'Die Füllmenge wird pauschal um 1 dl erhöht.'. ULINE. SKIP.

  ENDMETHOD.

ENDCLASS.
