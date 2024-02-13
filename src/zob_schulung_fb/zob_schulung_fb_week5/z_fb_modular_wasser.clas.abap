CLASS z_fb_modular_wasser DEFINITION

  PUBLIC
  INHERITING FROM z_fb_modular_getraenk
  CREATE PUBLIC .

  PUBLIC SECTION.

   METHODS erhoehe_menge REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z_fb_modular_wasser IMPLEMENTATION.

  METHOD erhoehe_menge.
    mv_menge = mv_menge + ( iv_getraenk_menge * 5 ).
  ENDMETHOD.

ENDCLASS.
