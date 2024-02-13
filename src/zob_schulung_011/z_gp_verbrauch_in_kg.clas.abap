CLASS z_gp_verbrauch_in_kg DEFINITION
PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS get_verbrauch
      IMPORTING iv_flugzeit     TYPE spfli-fltime     " -> Flugzeit (Tabellenwert)
                iv_verbrauch_kg TYPE saplane-consum   " -> Durchschnittsverbrauch des Flugzeugs (Tabellenwert)
                iv_totalSumOcc  TYPE i                " -> Gesamtanzahl der Passagiere (Aggregation aus sflight)
      EXPORTING ev_verbrauch    TYPE p.               " -> Berechnung des Ausgabewertes in der Implementation

  PRIVATE SECTION.
    CONSTANTS    mc_passagierverbrauch TYPE p DECIMALS 4 VALUE '0.0288'. " -> Kerosinverbrauch in kg pro Passagier und zurückgelegtem km

ENDCLASS.



CLASS z_gp_verbrauch_in_kg IMPLEMENTATION.

  METHOD get_verbrauch.
    ev_verbrauch = ( iv_flugzeit DIV 60 ) * iv_verbrauch_kg + ( iv_totalsumocc * mc_passagierverbrauch ). " -> Flugzeit aus Tabelle von min in h umgerechnet
  ENDMETHOD.

ENDCLASS.
