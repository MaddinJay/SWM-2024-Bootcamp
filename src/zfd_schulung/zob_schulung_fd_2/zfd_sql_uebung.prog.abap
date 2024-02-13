*&---------------------------------------------------------------------*
*& Report zfd_sql_uebung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
*******************************
* Übung Select 1 und 2
*******************************

REPORT zfd_sql_uebung.

*TABLES: Sbook.  " Wann brauche ich diese TABLE angabe ?
*
*
*DATA: BEGIN OF ls_struktur,
*        passname TYPE c LENGTH 25,
*        bookid   TYPE n LENGTH 8,
*      END OF ls_struktur.
*
*DATA lt_tabelle LIKE TABLE OF ls_struktur.
*
*SELECT
*  FROM
*    sbook
*  FIELDS
*    passname, bookid
*  WHERE passname = 'Christa Delon'
*  INTO TABLE @lt_tabelle.
*
*LOOP AT lt_tabelle INTO ls_struktur.
*  WRITE: /, ls_struktur-passname,' ',ls_struktur-bookid.
*ENDLOOP.
**cl_demo_output=>display( lt_tabelle ).
*
*ULINE.
*
*SELECT SINGLE FROM sbook FIELDS bookid WHERE passname = 'Christa Delon' INTO @ls_struktur-bookid.
*
*WRITE: 'Die erste gefundene Buchungsnummer: ', ls_struktur-bookid.

*******************************
* Musterlösung Übung 1 +2
*******************************
*SELECT FROM Sbook FIELDS * WHERE passname = 'Christa Delon' INTO TABLE @DATA(lt_sbook).
*cl_demo_output=>display( lt_sbook ).
*
*SELECT SINGLE FROM sbook FIELDS * WHERE passname = 'Christa Delon' INTO @DATA(ls_sbook).
*Cl_demo_output=>display( ls_sbook ).

*******************************
* Übung Aggregation
*******************************
SELECT
  FROM
    sflight
  FIELDS
    carrid,
    connid,
    COUNT(*) AS Amount,
    AVG( seatsocc AS DEC( 10,0 ) ) AS avg_seatsocc, " Beschrifttung der Spaltenüberschrift
    AVG( seatsocc_b AS DEC( 10,0 ) ) AS avg_seatsoc_b,
    AVG( seatsocc_f AS DEC( 10,0 ) ) AS avg_seatsoc_f
    GROUP BY carrid, connid
    ORDER BY
      carrid ASCENDING,
      connid ASCENDING
  INTO TABLE @DATA(lt_aggregation).

*cl_demo_output=>display( lt_aggregation ).

*******************************
* Übung ORDER BY
*******************************
SELECT
FROM sairport
FIELDS
  *
  ORDER BY time_zone DESCENDING
  INTO TABLE @DATA(lt_order_by).

*cl_demo_output=>display( lt_order_by ).

*******************************
* Übung JOIN
*******************************
SELECT
FROM sbook
INNER JOIN scustom
ON sbook~customid = scustom~id
FIELDS
  sbook~carrid AS Fluggesellschaft,
  sbook~connid,
  sbook~fldate,
  scustom~name,
  scustom~langu
INTO TABLE @DATA(lt_join1)
UP TO 20 ROWS
.

*cl_demo_output=>display( lt_join1 ).

*******************************
* Übung INSERT , Fügen Sie einen Eintrag in die SCUSTOM Tabelle ein
*******************************
DATA ls_flugkunden TYPE scustom.
ls_flugkunden = VALUE #( mandt = 100 id = 777777 name = 'Frank Dobmeier' form = 'Herr' city = 'Muenchen' ).
INSERT scustom FROM ls_flugkunden.

WRITE: / 'Anlegen Datensatz'.
IF Sy-subrc = 0.
  WRITE 'Hat geklappt SUPER Basst scho'.
ELSE.
  WRITE 'Nicht geklappt'.
ENDIF.

ls_flugkunden = VALUE #( mandt = 100 id = 777776 name = 'Frank Dobmeier' form = 'Herr' city = 'Muenchen' ).
INSERT scustom FROM ls_flugkunden.

WRITE: / 'Anlegen Datensatz 2'.
IF Sy-subrc = 0.
  WRITE 'Hat geklappt SUPER Basst scho'.
ELSE.
  WRITE 'Nicht geklappt'.
ENDIF.

*******************************
* Übung UPDATE Ändern Sie den zuvor angelegten Eintrag in der SCUSTOM Tabelle.
*******************************
* OPTION 1
UPDATE scustom SET name = 'Franky Dobmeier' WHERE id = 777777.
WRITE: / 'update'.
IF Sy-subrc = 0.
  WRITE 'Hat geklappt SUPER Basst scho'.
ELSE.
  WRITE 'Nicht geklappt'.
ENDIF.

UPDATE scustom SET name = 'Franky Dobmeier' WHERE id = 777779.
WRITE: / 'update'.
IF Sy-subrc = 0.
  WRITE 'Hat geklappt SUPER Basst scho'.
ELSE.
  WRITE 'Nicht geklappt'.
ENDIF.

* Option 2
ls_flugkunden-id = 777777.
ls_flugkunden-email = |thebaby@arcor.de|.
UPDATE scustom FROM ls_flugkunden.
WRITE: / 'update'.
IF Sy-subrc = 0.
  WRITE 'Hat geklappt SUPER Basst scho'.
ELSE.
  WRITE 'Nicht geklappt'.
ENDIF.

*******************************
* Übung Modify
*******************************

ls_flugkunden = VALUE #( id = 777778 name = 'Peter Dobmeier'  ).
MODIFY scustom FROM ls_flugkunden.
WRITE: / 'modify'.
IF Sy-subrc = 0.
  WRITE 'Hat geklappt SUPER Basst scho'.
ELSE.
  WRITE 'Nicht geklappt'.
ENDIF.

*******************************
* Übung DELETE Löschen Sie den zuvor angelegten Eintrag in der SCUSTOM Tabelle.
*******************************
*Option1
*DELETE from scustom where id = 777777.
*IF Sy-subrc = 0.
*  WRITE 'Hat geklappt SUPER Basst scho'.
*ELSE.
*  WRITE 'Nicht geklappt'.
*ENDIF.

*Option2
DATA ls_flugkunden2 TYPE scustom.
ls_flugkunden2-id = 777777.
DELETE scustom FROM ls_flugkunden.
WRITE: / 'delete'.
IF Sy-subrc = 0.
  WRITE 'Hat geklappt SUPER Basst scho'.
ELSE.
  WRITE 'Nicht geklappt'.
ENDIF.









*  ENDE
