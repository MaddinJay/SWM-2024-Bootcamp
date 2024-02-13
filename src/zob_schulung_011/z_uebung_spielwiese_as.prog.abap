*&---------------------------------------------------------------------*
*& Report z_uebung_spielwiese_as
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_uebung_spielwiese_as.
TABLES sflight.


* UEBUNG01
*SELECT
*FROM sbook
*FIELDS *
*WHERE passname = 'Christa Delon'
*INTO TABLE @DATA(gt_book).
*
*cl_demo_output=>display( gt_book ).

**********************************************************************
* Alternative
*DATA lt_bookings type table of sbook.
*SELECT
*FROM sbook
*FIELDS *
*WHERE passname = 'Christa Delon'
*INTO TABLE @lt_bookings.

* Alternative mit corresponding fields
*DATA: BEGIN OF ls_booking,
*        agencynum TYPE sbook-agencynum,
*        bookid    TYPE sbook-bookid,
*        passname  TYPE sbook-passname,
*        test      TYPE string,
*      END OF ls_booking,
*      lt_bookings_extra LIKE TABLE OF ls_booking.
*
*
*SELECT
*  FROM
*    sbook
*  FIELDS
*    agencynum,
*    bookid,
*    passname
*  WHERE passname = 'Christa Delon'
*  INTO CORRESPONDING FIELDS OF TABLE @lt_bookings_extra.
**********************************************************************

* UEBUNG02
*SELECT SINGLE
*FROM sbook
*FIELDS *
*WHERE passname = 'Christa Delon'
*INTO @DATA(gs_book2).
*
*cl_demo_output=>display( ls_book2 ).

* UEBUNG, EXTRA: LANGSTRECKENFLÜGE
*SELECT *
*FROM spfli
*WHERE distance > 5000
*INTO TABLE @DATA(gt_spfli).
*
*cl_demo_output=>display( lt_spfli ).

* UEBUNG, EXTRA: FLÜGE VON FRANKFURT
*SELECT *
*FROM spfli
*WHERE cityfrom = 'FRANKFURT'
*INTO TABLE @DATA(gt_spfli2).
*
*cl_demo_output=>display( lt_spfli2 ).

* UEBUNG, EXTRA: NACHNAME S*

*SELECT *
*FROM scustom
*WHERE name LIKE 'S%'
*INTO TABLE @DATA(gt_scustom).
*
*cl_demo_output=>display( lt_scustom ).

* UEBUNG, EXTRA: EURO
*SELECT carrid, carrname
*FROM scarr
*WHERE currcode = 'EUR'
*INTO TABLE @DATA(gt_scarr).
*
*cl_demo_output=>display( lt_scarr ).

* UEBUNG, AGGREGATION
*SELECT
*FROM sflight
*FIELDS carrid, connid, count( * ) as amount,
*AVG( seatsocc AS DEC( 10,0 ) ) AS avg_economy,
*AVG( seatsocc_b AS DEC( 10,0 ) ) AS avg_business,
*AVG( seatsocc_f AS DEC( 10,0 ) ) AS avg_firstClass
*GROUP BY carrid, connid
*INTO TABLE @DATA(lt_sflight).
*
*cl_demo_output=>display( lt_sflight ).


* UEBUNG, ORDER-BY
*SELECT
*FROM sairport
*FIELDS *
*ORDER BY time_zone DESCENDING
*INTO TABLE @DATA(lt_ordered).
*cl_demo_output=>display( lt_ordered ).


* UEBUNG, EXTRA: Teuerster Tarif
*SELECT SINGLE
*FROM sflight
*FIELDS MAX( price )
*INTO @DATA(ls_sflight2).
*
*cl_demo_output=>display( ls_sflight2 ).



* UEBUNG, EXTRA: Durchschnitts Preis
*SELECT
*FROM sflight
*FIELDS carrid, COUNT(*) AS amount,
*AVG( price AS DEC( 10,0 ) ) AS avg_price
*where carrid = 'LH'
*GROUP BY carrid
*INTO TABLE @DATA(lt_sflight3).
*
*cl_demo_output=>display( lt_sflight3 ).


* UEBUNG, Extra: Verfügbare Plätze
*SELECT SINGLE
*FROM sflight
*FIELDS
*SUM( seatsmax ) AS max_seats,
*SUM( seatsocc ) AS occupied_seats,
*SUM( seatsmax_b ) AS max_seats_b,
*SUM( seatsocc_b ) AS occupied_seats_b,
*SUM( seatsmax_f ) AS max_seats_f,
*SUM( seatsocc_f ) AS occupied_seats_f
*INTO @DATA(ls_free_seats).
*
*DATA(lv_free_seats) = ls_free_seats-max_seats - ls_free_seats-occupied_seats
*                     + ls_free_seats-max_seats_b - ls_free_seats-occupied_seats_b
*                     + ls_free_seats-max_seats_f - ls_free_seats-occupied_seats_f.
*
*cl_demo_output=>display( lv_free_seats ).

* UEBUNG, JOIN

*SELECT
*FROM sbook AS booking
*INNER JOIN scustom AS customer
*  ON booking~customid = customer~id
*fields
*  booking~carrid,
*  booking~connid,
*  booking~fldate,
*  customer~name,
*  customer~langu
*INTO TABLE @DATA(lt_customid)
*  UP TO 20 ROWS.
*
*cl_demo_output=>display( lt_customid ).

*SELECT
*FROM sbook AS booking
*INNER JOIN scustom AS customer ON booking~customid = customer~id
*fields booking~carrid, booking~connid, booking~fldate, customer~name, customer~langu
*INTO TABLE @DATA(lt_customid2)
*UP TO 20 ROWS.
*
*cl_demo_output=>display( lt_customid2 ).

* UEBUNG, EXTRA: Flüge und Fluggesellschaften
*
*SELECT
*  FROM sflight AS flug
*LEFT JOIN scarr AS fluggesellschaft ON flug~carrid = fluggesellschaft~carrid "Bei diesem Beispiel würde auch INNER JOIN klappen
*FIELDS flug~carrid, flug~connid, flug~currency, flug~fldate, fluggesellschaft~carrname
*INTO TABLE @DATA(lt_details).
*
*cl_demo_output=>display( lt_details ).

* UEBUNG, EXTRA: Lufthansa Flüge

*SELECT
*FROM spfli AS flugplan
*RIGHT JOIN scarr AS fluggesellschaft ON flugplan~carrid = fluggesellschaft~carrid
*FIELDS flugplan~carrid, flugplan~connid, flugplan~cityfrom, flugplan~cityto, fluggesellschaft~carrname
*WHERE flugplan~carrid = 'LH' AND fltype <> 'X' "X = Charter '' = Linie
*INTO TABLE @DATA(lt_flugplan).
*
*cl_demo_output=>display( lt_flugplan ).

* UEBUNG, EXTRA: Linienflüge
*
*SELECT
*FROM spfli AS flugplan
*left JOIN scarr AS fluggesellschaft ON flugplan~carrid = fluggesellschaft~carrid
*FIELDS flugplan~connid, flugplan~cityfrom, flugplan~cityto, fluggesellschaft~carrname
*INTO TABLE @DATA(lt_flugplan2).
*
*cl_demo_output=>display( lt_flugplan2 ).

* UEBUNG, EXTRA: Maximale Kapazität

*SELECT
*  FROM scarr AS fluggesellschaft
*  LEFT JOIN sflight AS flug  ON flug~carrid = fluggesellschaft~carrid
*  FIELDS fluggesellschaft~carrname,
*  SUM( seatsmax ) AS max_seats,
*  SUM( seatsmax_b ) AS max_seats_b,
*  SUM( seatsmax_f ) AS max_seats_f,
*  SUM( seatsmax + seatsmax_b + seatsmax_f ) AS totalSum
*GROUP BY fluggesellschaft~carrname
*INTO TABLE @DATA(ls_maxseats).
*
*cl_demo_output=>display( ls_maxseats ).

* UEBUNG, EXTRA: Neuer Flughafen

*select
*from sairport
*fields *
*into table @DATA(lt_sairport).
*cl_demo_output=>display( lt_sairport ).

* Uebung: Geben Sie die Anzahl der Lieferanten pro Land aus, Tabelle: LFA1

*SELECT
*FROM lfa1
*FIELDS land1, COUNT( * ) AS anzahlLieferanten
*GROUP BY land1
*INTO TABLE @DATA(lt_anzahlLand).
*
*cl_demo_output=>display( lt_anzahlland ).

* UEBUNG: Geben Sie die Namen aller Deutschen Lieferanten aus

*SELECT
*FROM lfa1
*FIELDS name1
*WHERE land1 = 'DE'
*INTO TABLE @DATA(lt_lieferantenDE).
*
*cl_demo_output=>display( lt_lieferantenDE ).

* UEBUNG: Geben sie zusätzlich den Gruppennamen aus.

*SELECT
*FROM lfa1
*LEFT JOIN t077y ON lfa1~ktokk = t077y~ktokk AND t077y~spras = @sy-langu
*FIELDS
*  lfa1~name1,
*  t077y~txt30
*WHERE Land1 = 'DE'
*INTO TABLE @DATA(lt_lieferanten_gruppennamen_DE).

* Uebung: Gebe alle Materialien mit ihren Kurztexten aus, Tabellen: MARA, MAKT


*SELECT
*FROM mara LEFT JOIN makt ON makt~matnr = mara~matnr
*FIELDS mara~matnr, makt~maktx
*INTO TABLE @DATA(lt_mat_txt).
*
*cl_demo_output=>display( lt_mat_txt ).

* UEBUNG: Gebe zusätzlich den Standardpreis der Materialien aus, Tabellen: MARA, MBEW, MAKT

*SELECT
*FROM mara
*LEFT JOIN makt ON makt~matnr = mara~matnr
*LEFT JOIN mbew ON mbew~matnr = mara~matnr
*FIELDS
*  mara~matnr,
*  makt~maktx,
*  mbew~stprs
*INTO TABLE @DATA(lt_mat_txt).
*Data(lv_anzahl) = lines( lt_mat_txt ).
*write lv_anzahl.
*cl_demo_output=>display( lt_mat_txt ).

* Geben sie die Namen aller Materialien aus, die Dokupflichtig sind. Tabellen: MARA, MARC
*SELECT
*FROM mara
*INNER JOIN marc ON mara~matnr = marc~matnr
*FIELDS mara~matnr, marc~kzdkz
*WHERE marc~kzdkz = 'X'
*INTO TABLE @DATA(lt_doku_x).
*cl_demo_output=>display( lt_doku_x ).
*DATA(lv_anzahl) = lines( lt_doku_x ).
*WRITE lv_anzahl.

* Uebung, Insert

*DATA(ls_test) = VALUE scustom(
*id = 111238
*name = 'Ahmet'
*form = 'Firma'
*street = 'Maxistraße'
*postbox = 'test'
*postcode = '441441'
*city = 'Munich'
*country = 'germany'
*region = 'Bayern'
*telephone = '885214512'
*custtype = '2'
*discount = 'no'
*langu = 'DE'
*email = 'dasdasd@dasd.de'
*webuser = 'test').
*INSERT scustom FROM ls_test.
*
*IF sy-subrc = 0.
*  WRITE 'erfolgreich'.
*ELSE.
*  WRITE 'nicht gut'.
*ENDIF.

*DATA(ls_test) = VALUE scustom( id = 85263 name = 'Karlo' ).
*INSERT scustom FROM ls_test.
*IF sy-subrc = 0.
*  WRITE 'erfolgreich'.
*ELSE.
*  WRITE 'nicht gut'.
*ENDIF.

* Uebung, Update

*UPDATE scustom SET name = 'Matthias' WHERE id = 888838.
*
*IF sy-subrc = 0.
*  WRITE 'erfolgreich'.
*  SELECT
*  FROM scustom
*  FIELDS *
*  WHERE id = 888838
*   INTO TABLE @DATA(lt_scustom).
*  cl_demo_output=>display( lt_scustom ).
*ELSE.
*  WRITE 'nicht gut'.
*ENDIF.

* Uebung, Delete
*DELETE FROM scustom WHERE id = 888838.
*
*IF sy-subrc = 0.
*  WRITE 'erfolgreich'.
*ELSE.
*  WRITE 'nicht gut'.
*  SELECT
* FROM scustom
* FIELDS *
* WHERE id = 888838
*  INTO TABLE @DATA(lt_scustom).
*  cl_demo_output=>display( lt_scustom ).
*ENDIF.

* UEBUNG, EXTRA Neuer Flughafen
*DATA(lv_neuerFlughafen) = VALUE sairport(
* id = 'AS'
* name = 'Amo Airport'
* time_zone = 'UTC+1' ).
*INSERT sairport FROM lv_neuerflughafen.
*
*IF sy-subrc = 0.
*  WRITE 'erfolgreich'.
*ELSE.
*  WRITE 'nicht gut'.
*ENDIF.

* Uebung, stravelag
*DATA(lv_stravelag) = VALUE stravelag(
*agencynum = 089089
*name  = 'Crystal Sunrise'
*street  = 'Sunrisestraße'
*postbox = '812'
*postcode  = '81679'
*city  = 'München'
*country = 'DE'
*region  = 'FG'
*).
*INSERT stravelag FROM lv_stravelag.
*
*IF sy-subrc = 0.
*  WRITE 'erfolgreich'.
*ELSE.
*  WRITE 'nicht gut'.
*ENDIF.

*UPDATE stravelag SET agencynum = 089 WHERE agencynum = 089089.
*IF sy-subrc = 0.
*  WRITE 'erfolgreich'.
*  SELECT
* FROM stravelag
* FIELDS *
* WHERE agencynum = 089
*  INTO TABLE @DATA(lt_stravelag).
*  cl_demo_output=>display( lt_stravelag ).
*ELSE.
*  WRITE 'nicht gut'.
*ENDIF.

*DELETE FROM stravelag WHERE agencynum = 089.
*IF sy-subrc = 0.
*  WRITE 'erfolgreich'.
*ELSE.
*  WRITE 'nicht gut'.
*  SELECT
* FROM stravelag
* FIELDS *
* WHERE agencynum = 089
*  INTO TABLE @DATA(lt_stravelag).
*  cl_demo_output=>display( lt_stravelag ).
*ENDIF.

SELECT
  FROM
    scarr
  FIELDS
    *
  WHERE CARRID LIKE 'AA%'
  INTO TABLE @DATA(lt_scarr).

LOOP AT lt_scarr INTO DATA(ls_scarr).
  ls_scarr-CARRID = 'A-22'.
  MODIFY lt_scarr FROM ls_scarr.
ENDLOOP.

*LOOP AT lt_customers REFERENCE INTO DATA(lo_customer).
*  lo_customer->webuser = lo_customer->name(10).
*ENDLOOP.
*CLEAR lo_customer.
*
*LOOP AT lt_customers ASSIGNING FIELD-SYMBOL(<fs_customer>).
*  <fs_customer>-telephone = 016515187.
*ENDLOOP.
