*&---------------------------------------------------------------------*
*& Report zuh_oo_video_8
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_oo_video_8.

CLASS lcl_ober DEFINITION.
  PUBLIC SECTION.
    METHODS emma.
    METHODS hugo.
ENDCLASS.

CLASS lcl_ober IMPLEMENTATION.
  METHOD emma.
    WRITE / 'Ich bin Emma() von LCL_OBER. Ich rufe Hugo() auf'.
    hugo( ).
  ENDMETHOD.
  METHOD hugo.
    WRITE / 'Ich bin Hugo() von LCL_OBER'.
  ENDMETHOD.
ENDCLASS.

CLASS lcl_unter DEFINITION INHERITING FROM lcl_ober.
  PUBLIC SECTION.
    METHODS hugo REDEFINITION.
    METHODS do.
ENDCLASS.

CLASS lcl_unter IMPLEMENTATION.
  METHOD hugo.
    WRITE / 'Ich bin Hugo() von LCL_UNTER'.
  ENDMETHOD.
  METHOD do.
    emma( ).
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  DATA gr_unter TYPE REF TO lcl_unter.
  CREATE OBJECT gr_unter.
  gr_unter->do( ).
