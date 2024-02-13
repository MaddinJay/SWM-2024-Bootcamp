*&---------------------------------------------------------------------*
*& Report ztw_kaffevollautomat
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztw_kaffevollautomat.


**********************************************************************
* Klasse Wasserbehälter
**********************************************************************
* Definition
CLASS lcl_wasserbehaelter DEFINITION.

  PUBLIC SECTION.

    CONSTANTS gc_wasser_haerte_grenze TYPE f VALUE '14.0'.

    METHODS get_wasserstand
      RETURNING VALUE(rd_wasserstand) TYPE i.

    METHODS set_wasserstand.
    METHODS check_wasser_haerte.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA gd_wasserstand TYPE i.
    DATA gd_wasser_haerte TYPE f.

ENDCLASS.

**********************************************************************
* Implementation
CLASS lcl_wasserbehaelter IMPLEMENTATION.
  METHOD get_wasserstand.

    rd_wasserstand = me->gd_wasserstand. "Methode 'get_wasserstand' codet, dass Wert von 'gd_wasserstand' an 'rd_wasserstand' (RETURNING) zurückgegeben wird.

  ENDMETHOD.

  METHOD set_wasserstand.

  ENDMETHOD.

  METHOD check_wasser_haerte.
    IF me->gd_wasser_haerte > gc_wasser_haerte_grenze.
      MESSAGE 'Wasser ist zu hart!' TYPE 'I'.
    ENDIF.
  ENDMETHOD.

ENDCLASS.






**********************************************************************
* Klasse Kaffevollautomat
**********************************************************************
* Definition
CLASS lcl_kaffeevollautomat DEFINITION.

  PUBLIC SECTION.
    CLASS-DATA anzahl_kva TYPE i. "Anzahl der Objekte (KVA)

    METHODS ein_kaffe_bitte
      IMPORTING id_espresso      TYPE string OPTIONAL
                id_verlaengerter TYPE string OPTIONAL.
    METHODS constructor.

    CLASS-METHODS add_1_to_anzahl_kva.




  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA gd_wasserstand TYPE i.
    DATA gr_wasserbehaelter TYPE i.

ENDCLASS.


**********************************************************************
* Implementation
CLASS lcl_kaffeevollautomat IMPLEMENTATION.

  METHOD ein_kaffe_bitte.

  ENDMETHOD.

  METHOD add_1_to_anzahl_kva.

  ENDMETHOD.

  METHOD constructor.
    CALL METHOD add_1_to_anzahl_kva. "add_1_to_anzahl_kva() <- das gleiche wie 'CALL METHOD'
  ENDMETHOD.

ENDCLASS.


* Kaffee Zubereitungsart
DATA gd_zubereitungsart TYPE char40 VALUE 'ESPRESSO'.


* Datendeklaration der Objektreferenz
DATA gr_rolands_kva TYPE REF TO lcl_kaffeevollautomat. "Referenz auf Rolands Kaffeevollautomat
DATA gr_mein_kva TYPE REF TO lcl_kaffeevollautomat. "Referenz auf meinen Kaffeevollautomat
DATA gr_wasserbehaelter TYPE REF TO lcl_wasserbehaelter.

START-OF-SELECTION.
* Objektinstanziierung
  CREATE OBJECT gr_rolands_kva. "Rolands KVA anlegen
  CREATE OBJECT gr_mein_kva. "Mein KVA anlegen
