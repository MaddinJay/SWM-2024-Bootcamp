*&---------------------------------------------------------------------*
*& Report zob_programm_bl4
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_programm_bl4.

*SELECT
* FROM
* sbook
* FIELDS
* *
* WHERE passname = 'Christa Delon'
* INTO TABLE @DATA(lt_sbook).
*cl_demo_output=>display( lt_sbook ).


*SELECT SINGLE
* FROM
* sbook
* FIELDS
* *
* WHERE passname = 'Christa Delon'
* INTO @DATA(ls_sbook).
*Cl_demo_output=>display( ls_sbook ).
**INTO CORRESPONDING FIELDS OF TABLE @lt_bookings. "Alternative Ausgabemöglichkeit.

*SELECT
* FROM
* SPFLI
* FIELDS
* *
* WHERE distance > 5000                            "Flüge weiter als 5.000km
* INTO TABLE @DATA(lt_Strecke).
*cl_demo_output=>display( lt_Strecke ).

*
*SELECT
* FROM
* SPFLI
* FIELDS
* *
* WHERE cityfrom = 'Fankfurt'                          "Flüge ab Frankfurt
* INTO TABLE @DATA(lt_Strecke).
*cl_demo_output=>display( lt_Strecke ).
*
*"Alle Fluggäste deren Nachname mit S beginnt:
*
*SELECT
*FROM
*SCUSTOM
*FIELDS *
*WHERE name LIKE 'S%'
* INTO TABLE @DATA(lt_name).
*cl_demo_output=>display( lt_name ).
*
*"Airlines mit Währung EUR
*
*SELECT
*FROM
*SCARR
*FIELDS *
*WHERE  currcode 'EUR'
* INTO TABLE @DATA(lt_waehrung).
* cl_demo_output=>display( lt_waehrung ).

* Verwenden Sie ABAP SQL, um den durchschnittlichen Preis aller Flüge einer
*bestimmten Fluggesellschaft in der Tabelle SFLIGHT zu berechnen.

*SELECT
* FROM
* SFLIGHT
* FIELDS
* *
* WHERE carrid = 'AA'
* ORDER BY price DESCENDING.
* INTO TABLE @DATA(lt_Strecke).
*cl_demo_output=>display( lt_Strecke ).


*Wählen Sie die Spalten für Airline-Code, Flugverbindungsnummer, Flugdatum,
*Kundenname und Sprache aus. Geben Sie maximal 20 Einträge aus.
*Tabellen: SBOOK und SCUSTOM

*SELECT
* FROM sbook AS booking
* INNER JOIN scustom AS customer
* ON customer~id = booking~customid
* FIELDS
* booking~carrid,
* booking~connid,
* booking~fldate,
* booking~wunit,
* customer~name,
* customer~langu
* INTO TABLE @DATA(lt_join_specific)
* UP TO 20 ROWS.
* cl_demo_output=>display( lt_join_specific ).
*
* DATA(ls_for_insert) = VALUE scustom(
*id = 5$$###
*name = 'Bernd'
*form = 'Herr'
*street = 'Sammy-Drechsel-Straße'
*postbox = '27'
*postcode = '81737'
*city = 'Muenchen'
*country = 'Germany'
*region = 'BAY'
*).



*Verwenden Sie einen Join, um die Details aller Flüge und deren
*entsprechenden Fluggesellschaften aus den Tabellen SFLIGHT und SCARR zu
*holen

*SELECT
*FROM sflight
*LEFT OUTER JOIN scarr
*ON sflight~carrid = scarr~carrid "carr id ist Schlüsselspalte, welche die Verknüpfung zweier Tabellen herstellen
*FIELDS
*sflight~carrid,
*sflight~connid,
*sflight~fldate,
*scarr~carrname
*INTO TABLE @DATA(lt_fluege).
*cl_demo_output=>display( lt_fluege ).

"Alle Linienflüge der Fluggesellschaft Lufthansa.

*SELECT
*FROM sflight
*LEFT OUTER JOIN scarr
*ON sflight~carrid = scarr~carrid
*FIELDS
*sflight~carrid,
*sflight~connid,
*sflight~fldate,
*scarr~carrname
*WHERE sflight~carrid = 'LH'
*INTO TABLE @DATA(lt_LHfluege).
*cl_demo_output=>display( lt_LHfluege ).

*Extra: Linienflüge
*Aufgabenstellung
*Wählen Sie alle Linienflüge aus. Erweitern Sie Ihren Select Befehl so, dass der
*vollständige Name der Fluggesellschaft anstatt der ID der Airline angezeigt
*wird.
*Tabelle: SPFLI, SCARR

*SELECT
*FROM spfli as flights
*LEFT OUTER JOIN scarr
*ON spfli~carrid = scarr~carrid
*FIELDS
*flights~carrid,
*flights~connid,
*flights~fldate,
*scarr~carrname
*WHERE FLTYPE <> 'X'
*INTO TABLE @DATA(lt_lifluege).
*cl_demo_output=>display( lt_lifluege ).
*
*"Lieferantentabelle (Zeige die Anzahl der Lieferanten pro Land)
*
*SELECT
*FROM LFA1
*FIELDS
*count( * ) AS anzahl,
*LAND1
*GROUP BY land1
*INTO TABLE @DATA(lt_lieferanten_pro_Land).
*cl_demo_output=>display( lt_lieferanten_pro_land ).
*
*SELECT
*FROM LFA1
*LEFT OUTER JOIN T077K ON lfa1~ktokk = t077k~ktokk AND spras = 'D'
*FIELDS
*lfa1~name1,
*t077Y~txt30
*WHERE land1 = 'DE'
*INTO TABLE @DATA(lt_lieferanten_aus_de).
*cl_demo_output=>display( lt_lieferanten_aus_de ).

*Gebt alle Materialien mit ihren Kurztexten aus.
*Tabellen MARA, MAKT

*SELECT
*FROM MARA
*LEFT JOIN MAKT ON mara-MATNR = makt~matnr
*FIELDS
*mara~matnr,
*makt~maktx
*INTO TABLE @DATA ( lt_materialien )
*cl_demo_output=>display( lt_m )

*Zusätzlich den Standardpreis der Materialien anzeigen.
*SELECT
*FROM MARA
*LEFT JOIN MAKT ON mara~matnr = makt~matnr
*LEFT JOIN MBEW ON mara~matnr = mbew~matnr
*FIELDS
*mara~matnr,
*makt~maktx,
**makt~spras,
*mbew~stprs
*INTO TABLE @DATA (lt_materialien)
*cl_demo_output=>display( lt_m )
*UP TO 100 ROWS.

*
*INSERT
* INTO scarr VALUES @(  VALUE #(
* carrid = 'XZ'
* carrname = 'X Flights'
* currcode = 'EUR') ).

 "Eine Zeile in die SCUSTOM Tabelle einfügen:

* INSERT
* INTO scustom VALUES @(  VALUE #(
*id = '5476'
* name = 'Bernd Löttrich'
* postcode = '81737'
* city = 'München'
* email = 'bernd@sap.com') ).
* IF sy-subrc = 0.
* WRITE 'hat geklappt'.
* ENDIF.
*
* UPDATE scarr SET currcode = 'ZAR' WHERE carrid = 'FJ'.

 "Ändern Sie den zuvor angelegten Eintrag in der SCUSTOM Tabelle

*  UPDATE scustom SET city = 'Manchester' WHERE city = 'München'.
*  UPDATE scustom SET postcode = '0161' WHERE postcode = '81737'.
*
*  UPDATE scustom SET street = 'Schwanseestraße' WHERE id = '5476'.

*DELETE FROM scarr WHERE carrid = 'AB'.
*
*DELETE FROM scustom WHERE id = '5476'.
*IF sy-subrc = 0.
*WRITE 'funzt'.
*ELSE.
*WRITE 'funzt ned'.
*ENDIF.



INSERT
 INTO stravelag VALUES @(  VALUE #(
agencynum = '1'
 name = 'Djoser Reisen'
 postcode = '81737'
 city = 'München'
 currency = 'EUR') ).
 IF sy-subrc = 0.
 WRITE 'hat geklappt'.
ENDIF.

UPDATE stravelag SET currency = 'ZAR' WHERE agencynum = '1'.
