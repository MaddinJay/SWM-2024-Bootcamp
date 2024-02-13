CLASS zbv_frachtflugzeug_klasse DEFINITION
  PUBLIC
  INHERITING FROM zbv_flugzeug_klasse
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA: Frachtplaetze TYPE i,
          Schnallband   TYPE i.

    METHODS: gewicht_messen, fracht_beladen, fracht_entladen.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zbv_frachtflugzeug_klasse IMPLEMENTATION.
  METHOD fracht_beladen.
    WRITE 'Fracht beladen'.
  ENDMETHOD.

  METHOD fracht_entladen.
    WRITE 'Fracht entladen'.
  ENDMETHOD.

  METHOD gewicht_messen.
    WRITE 'Gewicht messen'.
  ENDMETHOD.

ENDCLASS.
