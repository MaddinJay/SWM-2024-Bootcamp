*&---------------------------------------------------------------------*
*& Report ZEM_CLASSINSTANZ
*&---------------------------------------------------------------------*
*&Verwendung Daten/Methosen aus Privat und Öffentliche KLassen
*&---------------------------------------------------------------------*
REPORT zem_classinstanz.

CLASS lcl_musiker DEFINITION.

  PUBLIC SECTION.
  DATA mv_name     TYPE string.

  METHODS display_attributes.


  PRIVATE SECTION.
 Data mv_nachname TYPE string.
 METHODS hello_world. "zugriff über Implementierung der Methode aus Public Section ,display_attributes,

          endclass.


    CLASS lcl_musiker IMPLEMENTATION.
    METHOD hello_world.
      WRITE: /, 'Grüß Gott'. "Methode aus privater Section .... Ausgabe über Methode aus public Section
    ENDMETHOD.

    METHOD display_attributes.
          hello_world( ). "mit( ) Zugriff auf Methode (in privater Section) = WRITE: /, 'Grüß Gott'.
      WRITE:  mv_name, /. ULINE.
    ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  DATA grt_v TYPE TABLE OF REF TO lcl_musiker.
  DATA gr_v TYPE REF TO lcl_musiker.
  CREATE OBJECT gr_v.
  gr_v->mv_name = 'John'.
*gr_v->mv_nachname = 'Coltrane'.
  APPEND gr_v TO grt_v.

  CREATE OBJECT gr_v.
  gr_v->mv_name = 'Miles'.
*gr_v->mv_nachname = 'Davis'.
  APPEND gr_v TO grt_v.

  gr_v->display_attributes( ).

Loop at grt_v INTO gr_v.
WRITE: gr_v->mv_name,  /.
Endloop.

*gr_v->hello_world( ). " ( ) = Zugriff auf Methode, .....auf Attribute ohne ( ).
