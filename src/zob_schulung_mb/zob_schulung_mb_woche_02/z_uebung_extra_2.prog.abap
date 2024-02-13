*&---------------------------------------------------------------------*
*& Report z_uebung_extra_2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_uebung_extra_2.

*Berechnen Sie die Gesamtzahl der verfügbaren Sitze aller Flüge.
*Tabelle: SFLIGHT

SELECT SINGLE
  FROM sflight
  FIELDS
    SUM( seatsmax ) AS max_seats_economy,
    SUM( seatsocc ) AS occupied_seats_economy,
    SUM( seatsmax_b ) AS max_seats_business,
    SUM( seatsocc_b ) AS occupied_seats_business,
    SUM( seatsmax_f ) AS max_seats_first,
    SUM( seatsocc_f ) AS occupied_seats_first
  INTO  @DATA(ls_seats).
**
DATA(lv_free_seats) = ( ls_seats-max_seats_economy - ls_seats-occupied_seats_economy )
                      + ( ls_seats-max_seats_business - ls_seats-occupied_seats_business )
                      + ( ls_seats-max_seats_first - ls_seats-occupied_seats_first ) .
WRITE lv_free_seats.
