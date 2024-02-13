CLASS z_fb_modular_gin DEFINITION

  PUBLIC
  INHERITING FROM z_fb_modular_getraenk
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS erhoehe_menge REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z_fb_modular_gin IMPLEMENTATION.

  METHOD erhoehe_menge.
    mv_menge = mv_menge + ( iv_getraenk_menge / 2 ).
  ENDMETHOD.

ENDCLASS.
