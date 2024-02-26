*&---------------------------------------------------------------------*
*& Report zfd_binding_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_binding_01.

CLASS lcl_ober DEFINITION.
  PUBLIC SECTION.
    METHODS emma.
    METHODS hugo.
ENDCLASS.

CLASS lcl_ober IMPLEMENTATION.
  METHOD emma.
    WRITE /'Ich bin emma() von lcl_ober Ich rufe me-hugo() auf.'.
    me->hugo(  ).
  ENDMETHOD.

  METHOD hugo.
    WRITE /'Ich bin hugo() von lcl_ober.'.
  ENDMETHOD.

ENDCLASS.


CLASS lcl_unter DEFINITION INHERITING FROM lcl_ober.
  PUBLIC SECTION.
    METHODS hugo REDEFINITION.
    METHODS do.
ENDCLASS.


CLASS lcl_unter IMPLEMENTATION.
  METHOD do.
    me->emma( ).
  ENDMETHOD.

  METHOD hugo.
    WRITE /'Ich bin hugo() von lcl_unter.'.
  ENDMETHOD.

ENDCLASS.


START-OF-SELECTION.

data(gr_unter) = NEW lcl_unter(  ).
gr_unter->do(  ).
data lv_x type c LENGTH 8.
data lv_date type d.
write  lv_date.
write 'ende'.
