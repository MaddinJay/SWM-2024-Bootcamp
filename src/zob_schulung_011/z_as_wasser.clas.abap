CLASS z_as_wasser DEFINITION INHERITING FROM z_as_getraenk
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor IMPORTING iv_name TYPE string.
    METHODS erhoehemenge REDEFINITION.

    DATA wasserMenge TYPE REF TO z_as_getraenk.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_as_wasser IMPLEMENTATION.

  METHOD erhoehemenge.
    menge = menge + ( iv_getraenk_menge2 * 5 ).
  ENDMETHOD.

  METHOD constructor.
    super->constructor( iv_name = iv_name ).
    menge = menge + 2.
  ENDMETHOD.

ENDCLASS.
