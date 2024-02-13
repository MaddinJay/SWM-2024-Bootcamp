*&---------------------------------------------------------------------*
*& Report zst_schulung_uebung_2711
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_schulung_uebung_2711.

*SELECT
*FROM
*sbook
*FIELDS
* *
* WHERE passname = 'Christa Delon'
* INTO TABLE @DATA(lt_buchung).
*"Wenn die Tabelle vorher deklariert wird (Data lt_buchung Type Table of sbook)
*"und bestimmte Felder überführt werden sollen => Field befüllen und INTO CORRESPONDING FIELDS
*
*cl_demo_output=>display( lt_buchung ).
*
*SELECT SINGLE
*FROM sbook
*FIELDS
* *
* WHERE passname = 'Christa Delon'
* INTO @DATA(ls_buchung).
*
*cl_demo_output=>display( ls_buchung ).

*SELECT
*FROM
*spfli
*FIELDS
* *
* WHERE Distance > 5000
* INTO TABLE @DATA(lt_strecke).
*
* cl_demo_output=>display( lt_strecke ).

* SELECT
*FROM
*spfli
*FIELDS
* *
* WHERE airpfrom = 'FRA'
* INTO TABLE @DATA(lt_ffm).
*
* cl_demo_output=>display( lt_ffm ).

* SELECT
*FROM
*SCUSTOM
*FIELDS
* *
* WHERE
* custtype Not LIKE 'B'
* and
* name like 'S%'
*
*
* INTO TABLE @DATA(lt_kunden).
*
* cl_demo_output=>display( lt_kunden ).

* SELECT
*FROM
*Scarr
*FIELDS
* *
* WHERE
*Currcode = 'EUR'
*
*
* INTO TABLE @DATA(lt_waehrung).
*
* cl_demo_output=>display( lt_waehrung ).


* SELECT
* FROM
*sflight
*fields
**
*MAX( price )
*
* INTO @DATA(lv_preis).
* Write: / |'Teuerster Tarif: { lv_preis } Euro.|.

*SELECT
*FROM
*sflight
*FIELDS
*carrid,
*connid,
*COUNT(*) AS amount,
*AVG( seatsmax AS DEC( 10,0 ) ) as avg_besetzt_eco,
*AVG( seatsmax_b as Dec( 10,0 ) ) as avg_besetzt_b,
*AVG( seatsmax_f as Dec( 10,0 ) ) as avg_besetzt_f
*
*Group by carrid, connid
*
*INTO TABLE @DATA(lt_plaetze).
*
*
*cl_demo_output=>display( lt_plaetze ).

*Select
*from
*sairport
*fields
* *
* order by time_zone descending
*
* INTO TABLE @DATA(lt_zeitzone).
* cl_demo_output=>display( lt_zeitzone ).


*SELECT AVG( price as dec( 10,2 ) ) as avg_price
*FROM
*sflight
*where carrid = 'AA'
*
*INTO TABLE @DATA(lt_durchsch).
*
*cl_demo_output=>display( lt_durchsch ).

SELECT single
FROM
sflight
fields
SUM( seatsmax ) as sum_eco,
SUM( seatsocc ) as sum_eco2,
SUM( seatsmax_b ) as sum_b,
SUM( seatsocc_b ) as sum_b2,
SUM( seatsmax_f ) as sum_f,
SUM( seatsocc_f ) as sum_f2

INTO @Data(ls_platz).

DAta(lv_platz) = ls_platz-sum_eco - ls_platz-sum_eco2
                      + ls_platz-sum_b - ls_platz-sum_b2
                      + ls_platz-sum_f - ls_platz-sum_f2 .
WRITE lv_platz.
