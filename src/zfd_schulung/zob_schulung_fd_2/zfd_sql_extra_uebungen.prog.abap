*&---------------------------------------------------------------------*
*& Report zfd_sql_extra_uebungen
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_sql_extra_uebungen.

*******************************
*EXTRA Übungen 1 bis 4
*******************************

*SELECT FROM spfli FIELDS * WHERE distance > 5000 INTO TABLE @DATA(lt_fluege_ueber_5000).
*cl_demo_output=>display( lt_fluege_ueber_5000 ).
*
*SELECT FROM spfli FIELDS * WHERE cityfrom = 'FRANKFURT' INTO TABLE @DATA(lt_fluege_ab_FRA).
*cl_demo_output=>display( lt_fluege_ab_FRA ).
*
*SELECT FROM scustom FIELDS * WHERE name LIKE 'S%' INTO TABLE @DATA(lt_kunden_mit_S).
*cl_demo_output=>display( lt_kunden_mit_S ).
*
*SELECT FROM scarr FIELDS carrname, currcode  WHERE currcode = 'EUR' INTO TABLE @DATA(lt_fgesellschaft_mit_EUR).
*cl_demo_output=>display( lt_fgesellschaft_mit_EUR ).

*******************************
*EXTRA Übungen 5 bis 7
*******************************
*ULINE.
*SELECT
*  FROM sflight
*  FIELDS
*    MAX( price )
*  INTO @DATA(lv_max_price).
*WRITE: /, 'der teuereste Preis ist:', lv_max_price .
*
*SELECT SINGLE
*  FROM sflight
*  FIELDS
*    MAX( price ) AS max_price
*  INTO @DATA(ls_expensive_price).
*
*cl_demo_output=>display( ls_expensive_price ).
*
*ULINE.
*SELECT
*  FROM sflight
*  FIELDS
*    AVG( price AS DEC( 10,0 ) )
*  WHERE Carrid = 'LH'
*  INTO @DATA(lv_avg_price).
*WRITE: /, 'der durchschnittliche Preis ist:', lv_avg_price.
*WRITE: / |der durchschnittliche Preis ist: { lv_avg_price }|.
*
*ULINE.
*SELECT SINGLE
*  FROM sflight
*  FIELDS
*    SUM( seatsmax ) AS seatsmax,
*    SUM( seatsocc ) AS seatsocc,
*    SUM( seatsmax_B ) AS seatsmax_b,
*    SUM( seatsocc_B ) AS seatsocc_b,
*    SUM( seatsmax_F ) AS seatsmax_f,
*    SUM( seatsocc_F ) AS seatsocc_f
*  INTO @DATA(ls_free_seats).
*
*DATA(lv_free_seats) = ( ls_free_seats-seatsmax - ls_free_seats-seatsocc )
*                      + ( ls_free_seats-seatsmax_b - ls_free_seats-seatsocc_b )
*                      + ( ls_free_seats-seatsmax_f - ls_free_seats-seatsocc_f ).
*
*WRITE lv_free_seats.
*******************************
* EXTRA Übung 8
*Extra: Flüge und Fluggesellschaften
*Verwenden Sie einen Join, um die Details aller Flüge und deren
*entsprechenden Fluggesellschaften aus den Tabellen SFLIGHT und SCARR zu holen.
*******************************
*SELECT
*FROM sflight AS a
*LEFT OUTER JOIN scarr AS b
*ON a~carrid = b~carrid
*FIELDS *
*INTO TABLE @DATA(lt_result_FF).
*
**cl_demo_output=>display( lt_result_FF ).

*******************************
*EXTRA Übung 9 Lufthansa Flüge
*Wählen Sie alle Linienflüge der Fluggesellschaft "Lufthansa" aus.
*Tabelle: SPFLI, SCARR
*Wählen Sie nicht alle Spalten beider Tabellen aus, da die
*Anzeigeausgabemethode nicht alle Spalten anzeigen kann.
*******************************
*SELECT
*FROM spfli AS a
*LEFT OUTER JOIN scarr AS b
*ON a~carrid = b~carrid
*FIELDS
*  b~carrid AS Fluggesellschaft,
*  b~carrname AS Kurzbezeichnung,
*  a~connid AS Einzelflugverbindung,
*  a~cityfrom AS Abflugsstadt,
*  a~cityto AS Ankunftsstadt,
*  b~url AS url
*  WHERE carrname EQ 'Lufthansa' AND a~fltype <> 'X'
*  ORDER BY connid ASCENDING
*INTO TABLE @DATA(lt_result_LF).

*cl_demo_output=>display( lt_result_lf ).

*******************************
*Extra: Linienflüge
*Wählen Sie alle Linienflüge aus. Erweitern Sie Ihren Select Befehl so, dass der
*vollständige Name der Fluggesellschaft anstatt der ID der Airline angezeigt wird.
*Tabelle: SPFLI, SCARR
*******************************
*SELECT
*FROM spfli AS a
*LEFT JOIN scarr AS b
*ON a~carrid = b~carrid
*FIELDS
*  b~carrname,
*  a~connid,
*  a~cityfrom,
*  a~cityto,
*  b~url
*  WHERE a~fltype <> 'X'
*  ORDER BY connid ASCENDING
*INTO TABLE @DATA(lt_result_LiF).

*cl_demo_output=>display( lt_result_lif ).

*******************************
* Extra: Maximale Kapazität
* Finden Sie die maximale Kapazität jeder Fluggesellschaft. Geben Sie den
* Namen der Fluggesellschaft mit aus.
* Tabelle: SCARR, SFLIGHT
*******************************
*SELECT
*FROM scarr AS a
*RIGHT OUTER JOIN sflight AS b
*ON a~carrid = b~carrid
*FIELDS
*  a~carrname AS Fluggesellschaft,
*  SUM( b~seatsmax ) AS Max_Beleg_Eco,
*  SUM( b~seatsmax_B ) AS Max_Beleg_Bus,
*  SUM( b~seatsmax_F ) AS Max_Beleg_Fir
*  GROUP BY a~carrname " Wenn agreggieren (Sum, AVG) dann muss auch gruppiert werden!
*INTO TABLE @DATA(lt_mk).
*
**cl_demo_output=>display( lt_mk ).
*
*DATA lv_mk TYPE i VALUE 0.
*LOOP AT lt_mk INTO DATA(ls_mk).
*  lv_mk = ls_mk-Max_Beleg_Eco + ls_mk-Max_Beleg_Bus + ls_mk-Max_Beleg_Fir.
*  WRITE: /, | Die maximale Kapazität von { ls_mk-Fluggesellschaft } ist { lv_mk } |.
*ENDLOOP.


*cl_demo_output=>display(  ).



*******************************
* EXtra Extra Übungen
* Gebt alle Materialien mit ihrem  Kurztexten aus
* MARA, MAKT
*Geben Sie zus. den Stanardpreis der Materialien aus.
*******************************
*SELECT
*  FROM mara
*  LEFT OUTER JOIN makt
*  ON mara~matnr = makt~matnr
*  FIELDS
*  mara~matnr,
*  makt~maktx
*INTO TABLE @DATA(lt_mm).

*cl_demo_output=>display(  ).

*******************************
* zusätzlich den STD preis der Materialien
* mara, mbew, makt
*******************************
*SELECT
*  FROM mara
*  LEFT JOIN makt ON mara~matnr = makt~matnr
*  LEFT JOIN mbew ON mbew~matnr = mbew~matnr
*
*  FIELDS
*  mara~matnr,
*  makt~maktx,
*  mbew~stprs
*INTO TABLE @DATA(lt_mm2).
*
*DATA(lv_anzahl) = lines( lt_mm2 ).
*WRITE: /, lv_anzahl.
*
*cl_demo_output=>display( lt_mm2 ).

*******************************
* Alle Namen der Materialen die Dokupflichtig sind.
*Tabellen * mara marc
*******************************
*SELECT
* FROM mara
*  LEFT OUTER JOIN marc
*  ON mara~matnr = marc~matnr
*FIELDS
*  mara~matnr
*  WHERE marc~kzdkz = @abap_true
*  INTO TABLE @DATA(lt_mm3).
*
**cl_demo_output=>display( lt_mm3 ).
*
*DATA(lv_anzahl3) = lines( lt_mm3 ).
*WRITE: /, lv_anzahl3.

*******************************
* Ermitteln sie pro Material die LAgerorte und die Mengen der 'frei verwendtbaren Materialien'
* Tabellen: mara, mard
*******************************
*SELECT
* FROM mara
*  INNER JOIN mard
*  ON mara~matnr = mard~matnr
*FIELDS
*  mara~matnr AS Material,
*  mard~lgort AS Lagerort,
*  mard~labst AS freie_Menge_im_Lager
*WHERE mard~labst > 0
*  INTO TABLE @DATA(lt_mm4).

*cl_demo_output=>display( lt_mm4 ).

*******************************
*Geben Sie Materialnamen mit ihren Komponenten aus
*Ermitteln Sie hierfür die Stücklisten der Materialien (mast)
*Selektieren Sie daraufhin die Positionen der Stückliste (stpo)
*Tabellen Mara, makt, mast, stpo
******************************
*TABLES: Mara, makt, mast, stpo.
*
*SELECT
* FROM mara
*  INNER JOIN makt ON mara~matnr = makt~matnr
*  INNER JOIN mast ON makt~matnr = mast~matnr
*  INNER JOIN stpo ON stpo~stlnr = mast~stlnr
*FIELDS
*  mara~matnr, " Materialnummer
*  makt~maktx, " Materialkurztext
*  stpo~idnrk
*
*  INTO TABLE @DATA(lt_mm5).
*
*cl_demo_output=>display( lt_mm5 ).

*******************************
* Tabelle STRAVELAG und SCOUNTER
*
*******************************
DATA ls_stravelag1 TYPE Stravelag.
ls_stravelag1 = VALUE #( mandt = 100 agencynum =  777 name = 'NEVERCOMEBACK_REISEN' city = 'Muenchen' region = 'BAY'  ).

INSERT stravelag FROM ls_stravelag1.
WRITE: / 'Anlegen (insert) Datensatz 1'.
IF Sy-subrc = 0.
  WRITE 'Hat geklappt SUPER Basst scho'.
ELSE.
  WRITE 'Nicht geklappt'.
ENDIF.

ls_stravelag1 = VALUE #( mandt = 100 agencynum =  778 name = 'NEVERCOMEBACK_REISEN' city = 'Muenchen' region = 'BAY'  ).
INSERT stravelag FROM ls_stravelag1.
WRITE: / 'Anlegen (insert) Datensatz 1'.
IF Sy-subrc = 0.
  WRITE 'Hat geklappt SUPER Basst scho'.
ELSE.
  WRITE 'Nicht geklappt'.
ENDIF.

UPDATE stravelag SET city = 'Nuernberg' WHERE agencynum = 777.
WRITE: / 'update Datensatz 1'.
IF Sy-subrc = 0.
  WRITE 'Hat geklappt SUPER Basst scho'.
ELSE.
  WRITE 'Nicht geklappt'.
ENDIF.

ls_stravelag1-agencynum = 777.
DELETE stravelag FROM ls_stravelag1.
WRITE: / 'delete Datensatz 1'.
IF Sy-subrc = 0.
  WRITE 'Hat geklappt SUPER Basst scho'.
ELSE.
  WRITE 'Nicht geklappt'.
ENDIF.

** Scounter
Uline.
DATA ls_scounter1 TYPE scounter.
ls_scounter1 = VALUE #( mandt = 100 carrid = 'LH' countnum = 777 airport = 'MUC' ).

INSERT scounter FROM ls_scounter1.
WRITE: / 'Anlegen (insert) Datensatz 1'.
IF Sy-subrc = 0.
  WRITE 'Hat geklappt SUPER Basst scho'.
ELSE.
  WRITE 'Nicht geklappt'.
ENDIF.

INSERT INTO scounter
VALUES @(
          value #( mandt = 100 carrid = 'AA' countnum = 778 airport = 'FRA' )
        ).

WRITE: / 'Anlegen (insert) Datensatz 2'.
IF Sy-subrc = 0.
  WRITE 'Hat geklappt SUPER Basst scho'.
ELSE.
  WRITE 'Nicht geklappt'.
ENDIF.
