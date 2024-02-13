*&---------------------------------------------------------------------*
*& Report ztw_uebung_join
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztw_uebung_join.
*
*SELECT
*scarr-carrid,
*scarr-carname,
*spfli-connid
*FROM scarr
*LEFT outer join spfli on scarr-carrid = spfli-carrid
*into table @DATA(lt)
*ORder by scar-carrid.

"Tabellen mit JOIN Befehl zusammenführen / Max. 20 Einträge
*
*SELECT b~carrid, b~connid, b~fldate, c~name, c~langu "b~ = sbook (wird in nächste Zeile bestimmt) c~ = scustom (wird in übernächster Zeile bestimmt)
*FROM sbook AS b
*LEFT OUTER JOIN scustom AS c
*ON b~customid = c~id "Zussamnführen der Tabelle
*INTO TABLE @DATA(lt_join) "lt = Lokale Tabelle
*UP TO 20 ROWS. "Max. 20 Einträge
*
*cl_demo_output=>display( lt_join ).
*
***********************************************************************
*
*SELECT
*FROM sbook AS booking
*INNER JOIN scustom AS customer
*ON customer~id = booking~customid
*FIELDS
*booking~carrid AS Airline_code,
*booking~connid AS Flugverbindung,
*booking~fldate AS Flugdatum,
*customer~name  AS Kundenname,
*customer~langu AS Sprache
*INTO TABLE @DATA(lt_join_1)
*UP TO 20 ROWS.
*
*cl_demo_output=>display( lt_join_1 ).
*
***********************************************************************^
*
*
*
*SELECT
*FROM sflight
*LEFT OUTER JOIN scarr
*ON sflight~carrid = scarr~carrid "carr id ist Schlüssel spalte, weclche die Verknüpfung zweier Tabellen herstellen
*FIELDS
*sflight~carrid,
*sflight~connid,
*sflight~fldate,
*scarr~carrname
*INTO TABLE @DATA(lt_fluege).
*cl_demo_output=>display( lt_fluege ).


**********************************************************************

*SELECT
*from spfli
*LEFT OUTER JOIN scarr
*on spfli~carrid = scarr~carrid
*Fields
*scarr~url as Internetseite,
*spfli~carrid as Fluggesellschaft,
*spfli~fltime as Flugzeit
*Where carrname = 'Lufthansa'
*INTO table @DATA(lt_Fluggesellschaft).
*cl_demo_output=>display( lt_Fluggesellschaft ).
*
***********************************************************************
*
*SELECT
*from spfli
*LEFT OUTER JOIN scarr
*on spfli~carrid = scarr~carrid
*Fields
*scarr~carrname as Fluggesellschaft,
*scarr~url as Internetseite,
*spfli~fltime as Flugzeit
*WHERE spfli~fltype <> 'x'
*INTO table @data(lt_fluege2).
*cl_demo_output=>display( lt_fluege2 ).
*

*SELECT
*FROM sflight AS fl
*LEFT JOIN scarr AS sc
*ON fl~carrid = sc~carrid
*FIELDS
*sc~carrname AS Fluggesellschaft,
*    SUM( seatsmax ) AS max_economy,
*      SUM( seatsmax_b ) AS max_business,
*       SUM( seatsmax_f ) AS max_first,
*       SUM( seatsmax + seatsmax_b + seatsmax_f ) AS max_insgesamt
*       GROUP BY sc~carrname
*INTO TABLE @DATA(lt_kapazi).
*
*cl_demo_output=>display( lt_kapazi ).

**********************************************************************
*"Geben Sie die Anzahl der Lieferanten pro Land aus.
*"Tabelle: LFA1
*
*SELECT
*FROM lfa1
*FIELDS
*COUNT( * ) AS anzahl,
*land1
*GROUP BY land1
*INTO TABLE @DATA(lt_lieferanten_pro_land).
*
*cl_demo_output=>display( lt_lieferanten_pro_land ).
*
***********************************************************************
*"Geben Sie die Namen aller Ihrer Deutschen Lieferanten aus.
*"Tabelle LFA1
*
*SELECT
*FROM lfa1
*FIELDS
*name1
*WHERE land1 = 'DE'
*INTO TABLE @DATA(lt_de_lieferanten).
*
*cl_demo_output=>display( lt_de_lieferanten ).
*
***********************************************************************
*"Geben Sie zusätzliche Gruppennamen aus.
*"Tabellen: LFA1, T007Y-TXT30
*
*SELECT
*FROM lfa1
*LEFT JOIN T077Y
*ON lfa1~KTOKK = T077Y~ktokk AND T077Y~spras = @sy-langu
*FIELDS
*lfa1~name1,
*T077Y~txt30
*WHERE land1 = 'DE'
*INTO TABLE @DATA(lt_de_lieferanten_mit_extra).
*
*cl_demo_output=>display( lt_de_lieferanten_mit_extra ).

**********************************************************************

*SELECT
*FROM MARA
*LEFT JOIn makt
*on mara~matnr = makt~matnr
*LEFT join Mbew
*on mara~matnr = mbew~matnr
*fields
*mara~matnr,
*makt~maktx,
*mbew~stprs
*INTO Table @data(lt_materialien)
*UP TO 100 ROWS.
*
*cl_demo_output=>display( lt_materialien ).

**********************************************************************
*"INSERT BEFEHL -> einfügen an einer bereits bestehenden Tabelle
*DATA(ls_personal) = VALUE scustom(
*                          id = '37622'
*                          name = 'Thea Waldhauser'
*                          street = 'Uffingerstraße'
*                          city = 'Muenchen' ).
*INSERT scustom FROM ls_personal.
*IF sy-subrc = 0.
*  WRITE: 'Hat geklappt'.
*ELSE.
*  WRITE: 'Hat nicht geklappt'.
*ENDIF.
*
***********************************************************************
*
*UPDATE scustom SET name = 'Hubert Alois' WHERE id = '37622'.
*UPDATE scustom SET street = 'Gulbransonstraße' WHERE id = '37622'.
*
*
*IF sy-subrc = 0.
*  WRITE: 'Hat geklappt'.
*ELSE.
*  WRITE: 'Hat nicht geklappt'.
*ENDIF.
*
***********************************************************************
*DELETE FROM scustom WHERE id = '37622'.
*
*MESSAGE 'Die Daten werden unwiderruflich gelöscht' TYPE 'I'.
*
*IF sy-subrc = 0.
*  WRITE: 'Hat geklappt'.
*ELSE.
*  WRITE: 'Hat nicht geklappt'.
*ENDIF.
**********************************************************************
"Übung mit Tabelle STRAVELAG

DATA(ls_travel) = VALUE stravelag(
                        agencynum = '154895'
                        postcode = '81477'
                        city = 'muenchen'
                        name = 'Otto Reisen'
                        street = 'Reiserstr'
                        country = 'DE').

INSERT stravelag from ls_travel.

IF sy-subrc = 0.
  WRITE: 'Hat geklappt!'.
ELSE.
  WRITE: 'Hat nicht geklappt!'.
ENDIF.

**********************************************************************

UPDATE stravelag SET city = 'hamburg' where agencynum = '154895'.

IF sy-subrc = 0.
  WRITE: 'Hat geklappt!'.
ELSE.
  WRITE: 'Hat nicht geklappt!'.
ENDIF.

**********************************************************************
DELETE from stravelag where agencynum = '154895'.

IF sy-subrc = 0.
  WRITE: 'Hat geklappt!'.
ELSE.
  WRITE: 'Hat nicht geklappt!'.
ENDIF.
