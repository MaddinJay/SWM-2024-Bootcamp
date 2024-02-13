*&---------------------------------------------------------------------*
*& Report z_uebung_join
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_uebung_join.

SELECT
  FROM sbook AS booking "wir haben sie booking benannt, leichter zum runterschreiben"
  INNER JOIN scustom AS customer "WELCHE SPALTEN INTERESSIEREN UNS aus der linken und der rechten"
          ON customer~id = booking~customid "Matchen links mit rechts, istgleich, also muss es der gleiche Wert sein"
  FIELDS
        booking~carrid,
        booking~connid,
        booking~fldate,
        customer~name,
        customer~langu
  INTO TABLE @DATA(lt_join_specific)
  UP TO 20 ROWS.

* cl_demo_output=>display( lt_join_specific ).


SELECT FROM SFLIGHT
       LEFT OUTER JOIN scarr
       ON Sflight~carrid = scarr~carrid
       FIELDS
          sflight~carrid,
          sflight~connid,
          sflight~fldate,
          scarr~carrname
       INTO TABLE @DATA(lt_leftjoin).

*  cl_demo_output=>display( lt_leftjoin ).


SELECT FROM SPFLI
       INNER JOIN SCARR
       ON SPFLI~carrid = SCARR~carrid
       FIELDS
         SCARR~carrname,
         SPFLI~cityfrom,
         SPFLI~cityto
       WHERE spfli~carrid = 'LH' AND SPFLI~fltype <> 'X'
          INTO TABLE @DATA(lt_Lufthansa).

*cl_demo_output=>display( lt_Lufthansa ).

SELECT FROM SPFLI
       LEFT OUTER JOIN SCARR
       ON SPFLI~carrid = SCARR~carrid
       FIELDS
           SCARR~carrname,
           SPFLI~cityfrom,
           SPFLI~cityto
       WHERE SPFLI~fltype <> 'X'
       INTO TABLE @DATA(lt_Linienfluege).


*cl_demo_output=>display( lt_Linienfluege ).

SELECT
  FROM sflight AS flug
  LEFT JOIN scarr AS fluggesellschaft ON flug~carrid = fluggesellschaft~carrid
  FIELDS fluggesellschaft~carrname,
  SUM( seatsmax ) AS max_seats,
  SUM( seatsmax_b ) AS max_seats_b,
  SUM( seatsmax_f ) AS max_seats_f,
  SUM( seatsmax + seatsmax_b + seatsmax_f ) AS totalSum
GROUP BY fluggesellschaft~carrname
INTO TABLE @DATA(ls_maxseats).

*cl_demo_output=>display( ls_maxseats ).

*EXTRA: geben Sie die Anzahl der Lieferanten pro Land aus, Tabelle: LFA1


SELECT
FROM LFA1
FIELDS
    count( * ) AS anzahl,
    LAND1
GROUP BY land1
INTO TABLE @Data(lt_lieferanten_pro_land).

*cl_demo_output=>display( lt_lieferanten_pro_land ).

*Geben Sie die Namen aller Deutschen leiferanten aus, Tabelle LFA1, zusätzlich geben Sie den Gruppennamen aus
**********************************************************************      TAbellen LFA1, T077Y~TXT30

SELECT
FROM LFA1
LEFT OUTER JOIN T077Y ON lfa1~KTOKK = t077Y~ktokk AND t077Y~spras = @sy-langu
FIELDS
  name1,
  t077y~txt30
WHERE land1 = 'DE'
INTO TABLE @DATA(lt_de_lieferanten).

*cl_demo_output=>display( lt_de_lieferanten).

*TABELLEN MARA, MAKT und MBEW

SELECT
FROM MARA
LEFT OUTER JOIN MAKT
ON MARA~matnr = MAKT~matnr
LEFT OUTER JOIN MBEW "zweite Aufgabe
ON MARA~matnr = MBEW~matnr
LEFT OUTER JOIN MARC
ON MARA~matnr = MARC~matnr "AUFGABE 3
LEFT OUTER JOIN MARD
ON MARA~matnr = MARD~matnr
FIELDS
    MARA~matnr,
    MAKT~maktg,
    MAKT~maktx,
    MBEW~stprs,
    MARC~KZDKZ,
    MARD~LGORT,
    MARD~labst
    WHERE MARC~kzdkz = 'X'
INTO TABLE @DATA(lt_material).


cl_demo_output=>display( lt_material ).
