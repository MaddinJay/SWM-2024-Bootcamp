*&---------------------------------------------------------------------*
*& Report zhum_uebung_extra_2711
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zhum_uebung_extra_2711.

**Langstreckenflüge
*SELECT
*FROM spfli
*FIELDS *
*WHERE distance > 5000
*INTO TABLE @DATA(lt_strecke).
*
*cl_demo_output=>display(
*  data = lt_strecke ).
*
**Flüge von Frankfurt
*SELECT
*FROM spfli
*FIELDS *
*WHERE cityfrom = 'FRANKFURT'
*INTO TABLE @DATA(lt_Strecke1).
*
*cl_demo_output=>display(
*  data = lt_strecke1 ).
*
**Nachname S*
*SELECT
*FROM scustom
*FIELDS *
*WHERE name LIKE 'S%' "WHERE name = 'S%' sollte auch gehen
*INTO TABLE @DATA(lt_name).
*
*cl_demo_output=>display(
*  data = lt_name ).
*
**EURO
*SELECT
*FROM scarr
*FIELDS *
*WHERE currcode ='EUR'
*INTO TABLE @DATA(lt_curr).
*
*cl_demo_output=>display(
*  data = lt_curr ).

*ÜBUNG AGGREGATION
*SELECT
*FROM sflight
*FIELDS
*carrid,
*connid,
*COUNT(*) AS amount, "Wie viele Zeilen in der Gruppe wurden gezählt
*AVG( seatsocc AS DEC( 10,0 ) ) AS avg_occ_eco,
*AVG( seatsocc_b AS DEC( 10,0 ) ) AS avg_occ_b,
*AVG( seatsocc_f AS DEC(  10,0 ) ) AS avg_occ_f
*GROUP BY carrid, Connid
*INTO TABLE @DATA(lt_sflight).
*
*cl_demo_output=>display(
*  data = lt_sflight ).
*
**Übung Order by
*SELECT
*FROM sairport
*FIELDS *
*ORDER BY time_zone DESCENDING
*INTO TABLE @DATA(lt_zeitzone).
*
*cl_demo_output=>display(
*  data = lt_zeitzone ).
*
**EXTRA: Durchschnittspreis
*SELECT AVG( price AS CURR( 5,0 ) ) AS avg_price
*FROM Sflight
*WHERE carrid = 'LH'
*ORDER BY avg_price ASCENDING
*INTO TABLE @DATA(lt_avg_price).
*
*cl_demo_output=>display(
*  data = lt_avg_price ).
*
**EXTRA: teuerster Tarif
*SELECT
*FROM sflight
*FIELDS
*carrid,
*connid,
*MAX( price ) AS max_price
*GROUP BY carrid, connid
*ORDER BY max_price ASCENDING
*INTO TABLE @DATA(lt_max_price).
*cl_demo_output=>display(
*  data = lt_max_price ).
*
**Alternative teuerster Tarif:
*SELECT MAX( price )
*FROM sflight
*INTO @DATA(lv_price1).
*WRITE: / |teuerter Tarif: { lv_price1 } Euro.|.
*
**EXTRA: Verfügbare Plätze
*SELECT
*FROM sflight
*FIELDS
*carrid,
*connid,
*fldate,
*COUNT(*) AS amount,
*SUM( seatsmax - seatsocc ) AS seat_free ,
*SUM( seatsmax_b - seatsocc_b ) AS seat_free_b,
*SUM( seatsmax_f - seatsocc_f ) AS seat_free_f
*GROUP BY carrid, connid, fldate
*INTO TABLE @DATA(lt_seat_free).
*cl_demo_output=>display(
*  data = lt_seat_free ).
*
**EXTRA: Geben Sie die ältesten 10 Flüge der Flug-Tabelle aus. Tabelle sflight.
*SELECT
*  FROM
*  sflight
*  FIELDS
*  *
*  ORDER BY fldate ASCENDING "vor der Tabelle
*  INTO TABLE @DATA(lt_flights)
*  up to 10 rows. "nach der Tabelle
*  cl_demo_output=>display(
*  data = lt_flights ).

*EXTRA: Geben Sie alle Kunden mit einer 100-er ID aus. Tabelle SCUSTOM.

*SELECT
*From
*scustom
*fields
*  *
*  WHERE ID BETWEEN 100 AND 199 "BETWEEN ist inklusiv
** WHERE ID >= 100 AND <= 200 Alternative
*  INTO TAble @DATA(lt_id).
*  cl_demo_output=>display(
*  data = lt_id ).

*EXTRA:Geben Sie die Namen aller Fluggesellschaften aus, dessen Währung nicht Dollar oder Euro ist. Tabelle : SCARR
SELECT
FROM scarr
FIELDS
currcode,
 carrname
WHERE currcode NOT LIKE 'EUR' AND currcode NOT LIKE 'USD'
*WHERE currcode <> 'USD' AND currcode <> 'EUR' Alternative
INTO TABLE @DATA(lt_curr).
cl_demo_output=>display(
  data = lt_curr ).
