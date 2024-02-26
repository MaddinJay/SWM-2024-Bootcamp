*&---------------------------------------------------------------------*
*& Include zfd_cl_auto
*&---------------------------------------------------------------------*

CLASS lcl_auto DEFINITION INHERITING FROM lcl_fahrzeug.

  PUBLIC SECTION.
    METHODS: constructor IMPORTING iv_ahersteller TYPE string
                                   iv_amodell     TYPE string
                                   iv_atueren     TYPE i.
    METHODS: set_tueren IMPORTING iv_tueren TYPE i.
    METHODS: display_details REDEFINITION. " Vorsicht: in der Unterklasse darf sich die Signatur nicht ändern!

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA mv_tueren TYPE i.


ENDCLASS.

CLASS lcl_auto IMPLEMENTATION.

  METHOD display_details.
    super->display_details(  ).  " über Pseudoreferenz  SUPER->  kann man die methode der vererbenden Klasse aufrufen
    WRITE / |Türen: { mv_tueren }|.

  ENDMETHOD.

  METHOD set_tueren.
    mv_tueren = iv_tueren.
  ENDMETHOD.

  METHOD constructor.
    Super->constructor(
    exporting iv_hersteller = iv_ahersteller
    iv_modell = iv_amodell ).
    mv_tueren = iv_atueren.
  ENDMETHOD.

ENDCLASS.
