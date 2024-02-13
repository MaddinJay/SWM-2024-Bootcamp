*&---------------------------------------------------------------------*
*& Report zuh_verfuegbare_plaetze
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_verfuegbare_plaetze.

*Aufgabenstellung
*Berechnen Sie die Gesamtzahl der verfügbaren Sitze aller Flüge.
*Tabelle: SFLIGHT

SELECT SINGLE
  FROM sflight
  FIELDS
    SUM( seatsmax ) AS max_seats,
    SUM( seatsocc ) AS occupied_seats,
    SUM( seatsmax_b ) AS max_seats2,
    SUM( seatsocc_b ) AS occupied_seats2,
    SUM( seatsmax_f ) AS max_seats3,
    SUM( seatsocc_f ) AS occupied_seats3
  INTO  @DATA(ls_seats).           "Daten werden in eine neue Struktur gelesen


DATA(lv_free_seats) = ls_seats-max_seats - ls_seats-occupied_seats
                      + ls_seats-max_seats2 - ls_seats-occupied_seats2
                      + ls_seats-max_seats3 - ls_seats-occupied_seats3.

WRITE: 'Die verfügbare Plätze sind:', lv_free_seats.
