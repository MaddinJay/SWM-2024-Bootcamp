*&---------------------------------------------------------------------*
*& Report zextra_aufgaben5_und_6 und 7
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zextra_aufgaben5_6_und_7.
************************************************************************
"Extra 5: Teuerster Tarif"
*Finde den teuersten Tarif in der Tabelle SFLIGHT
*Tabelle: SFLIGHT
************************************************************************
"Variation 1
SELECT MAX( price )
FROM
sflight
INTO TABLE @DATA(lt_maxpreis).
cl_demo_output=>display( lt_maxpreis ).

"Variation 2 = Gleiche Ergebnis wie oben
*SELECT SINGLE
*  FROM sflight
*  FIELDS
*    MAX( price ) AS max_price
*  INTO @DATA(ls_expensive_price).
*
*cl_demo_output=>display( ls_expensive_price ).

************************************************************************
"Extra 6: Durchscnitts Preis"
*Verwenden Sie ABAP SQL, um den durchschnittlichen Preis aller Flüge einer bestimmten
*Fluggesellschaft in der Tabelle SFLIGHT zu berechnen.
*Tabelle: SFLIGHT
************************************************************************
SELECT
  FROM sflight
  FIELDS
    carrid,
    COUNT(*) AS amount,
    AVG( price AS DEC( 10,0 ) ) AS avg_price "DEC ist umwandlung in Dezimalstellen rundet auf sonst ist es: 12.9834848488 stattdessen: 13.0
  GROUP BY carrid
INTO TABLE @DATA(lt_price_flights).
cl_demo_output=>display( lt_price_flights ).

"ZB nur LH(Lufthansa soll ausgegeben werden)
SELECT SINGLE
FROM
sflight
FIELDS *
WHERE carrid = 'LH'
INTO @DATA(ls_slufthansa).
Cl_demo_output=>display( ls_slufthansa ).

************************************************************************
"Extra 7: Verfügbare Plätze"
*Berechnen Sie die Gesamtzahl der verfügbaren Sitze aller Flüge.
*Tabelle: SFLIGHT
************************************************************************
SELECT SINGLE "Hier sind freie Sitze von economy aufgelistet
  FROM sflight
  FIELDS
   SUM( seatsmax ) AS max_seats, "Maximale Anzahl an Sitzplätzen
   SUM( seatsocc ) AS occupied_seats "
  INTO  @DATA(ls_free_seats_ec).

DATA(lv_free_seats_ec) = ls_free_seats_ec-max_seats - ls_free_seats_ec-occupied_seats.
WRITE: 'Economy Freie Plätze: ', lv_free_seats_ec.

"Freie Sitze von allen Sitzen: economy/business und first class:
SELECT SINGLE
  FROM sflight
  FIELDS
    SUM( seatsmax ) AS max_seats_economy,         "summe von maximalen economy sitzen
    SUM( seatsocc ) AS occupied_seats_economy,    "summe von belegten economy sitzen
    SUM( seatsmax_b ) AS max_seats_business,      "summe von maximalen business sitzen
    SUM( seatsocc_b ) AS occupied_seats_business, "summe von belegten business sitzen
    SUM( seatsmax_f ) AS max_seats_firstclass,      "summe von maximalen first class sitzen
    SUM( seatsocc_f ) AS occupied_seats_firstclass  "summe von belegten first class sitzen
  INTO  @DATA(ls_free_seats).             "freie sitze variable deklariert
**
DATA(lv_free_seats) = ls_free_seats-max_seats_economy - ls_free_seats-occupied_seats_economy            "maximale economy sitze minus belegte economy sitze
                      + ls_free_seats-max_seats_business - ls_free_seats-occupied_seats_business        "maximale business sitze minus belegte business sitze
                      + ls_free_seats-max_seats_firstclass - ls_free_seats-occupied_seats_firstclass .  "maximale first class sitze minus belegte first class sitze
WRITE: 'Alle Freie Plätze: ',  lv_free_seats.
