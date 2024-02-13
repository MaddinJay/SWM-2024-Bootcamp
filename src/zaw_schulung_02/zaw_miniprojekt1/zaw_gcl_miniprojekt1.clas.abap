CLASS zaw_gcl_miniprojekt1 DEFINITION   "Bei einer globalen Klasse sollte mindestens ein Attribut oder eine Methode public sein (bzw. protected bei Vererbung)
 PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS get_verbrauch
      IMPORTING               "Benötigte Parameter, die in die Klasse aus dem Programm reingeholt werden
        iv_flugzeit     TYPE spfli-fltime     " -> Tabellenwert
        iv_verbrauch_kg TYPE saplane-consum   " -> Tabellenwert
        iv_totalSumOcc  TYPE i                " -> berechneter Wert
      EXPORTING               "Parameter, der nach der Berechnung (in der Implementation vorgegebene Funktionalität) ans Programm zurückgegeben wird
        ev_verbrauch    TYPE p.

  PRIVATE SECTION.
    CONSTANTS    mc_passagierverbrauch TYPE p DECIMALS 4 VALUE '0.0288'. " -> Kerosinverbrauch in kg pro Passagier und zurückgelegtem km

*Den Wert für die Konstante haben wir wie folgt berechnet:
*Wir haben im Internet recherchiert und für 2018 einen Verbrauchswert von 0,036 l pro Passagier und zurückgelegten km gefunden.
*Diesen Liter-Verbrauchswert haben wir mit einer Formel aus ChatGPT in kg umgerechnet:
* ? kg (Masse - Passagierverbrauch) = 0,036 l (Volumen - Passagierverbrauch) x 0,8 kg/l (Durchschnittsdichte für Kerosin)

ENDCLASS.


CLASS zaw_gcl_miniprojekt1  IMPLEMENTATION.
  METHOD get_verbrauch.
    ev_verbrauch = ( iv_flugzeit DIV 60 ) * iv_verbrauch_kg + ( iv_totalsumocc * mc_passagierverbrauch ). " -> Flugzeit aus Tabelle von min in h umgerechnet
*Flugzeit in h x Durchschnittverbrauch in kg/h + (Gesamtanzahl der Passagiere x Verbrauch pro Passagier in kg/km)
  ENDMETHOD.
ENDCLASS.


