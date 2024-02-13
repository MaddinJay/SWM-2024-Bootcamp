*&---------------------------------------------------------------------*
*& Report zfb_week2_sql_uebungen
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfb_week2_sql_uebungen.

*   ÜBUNG1
*   Geben Sie alle Buchungen des Kunden Christa Delon aus. Tabelle: SBOOK

SELECT
  FROM sbook
    FIELDS *
    WHERE passname = 'Christa Delon'
      INTO TABLE @DATA(lt_sbook).      "lt_sbook -> eigene Variablendeklaration, da hier mehrere Werte TABLE Struktur vorgeben.

*cl_demo_output=>display( lt_sbook ).

*   ÜBUNG2
*   Geben Sie eine Buchung des Kunden Christa Delon aus. Tabelle: SBOOK
SELECT SINGLE
  FROM sbook FIELDS *
    WHERE passname = 'Christa Delon'
      INTO @DATA(ls_sbook).           "ls_sbook -> eigene Variablendeklaration, da hier nur ein Wert only Struktur vorgeben.

*cl_demo_output=>display( ls_sbook ).

*   ÜBUNG 1 und 2 - ZUSATZ A und B
*   Geben Sie verschiedene Felder des Kunden Christa Delon aus.Tabelle: SBOOK

*   ZUSATZ A - OLD-SCHOOL CODING:
DATA lt_bookings TYPE TABLE OF sbook.

SELECT
  FROM
    sbook
  FIELDS
    agencynum,
    bookid,
    passname
  WHERE passname = 'Christa Delon'
  INTO CORRESPONDING FIELDS OF TABLE @lt_bookings.

*cl_demo_output=>display( lt_bookings ).

*   ZUSATZ B - OLD-SCHOOL CODING | nicht gecheckt :-( |
DATA: BEGIN OF ls_booking,
        agencynum TYPE sbook-agencynum,
        bookid    TYPE sbook-bookid,
        passname  TYPE sbook-passname,
        test      TYPE string,
      END OF ls_booking,
      lt_bookings_extra LIKE TABLE OF ls_booking.

SELECT
  FROM
    sbook
  FIELDS
    agencynum,
    bookid,
    passname
  WHERE passname = 'Christa Delon'
*   INTO CORRESPONDING FIELDS OF TABLE @lt_bookings_extra.
**  INTO TABLE @lt_bookings.
  INTO TABLE @DATA(lt_tabelle).
*cl_demo_output=>display( lt_bookings ).


*   Übung: Aggregation - Tabelle: SFLIGHT
*   Sie wollen die durchschnittlichen Sitzplätze der Economy, Business und First Class wissen.
*   Gruppieren Sie die Ergebnisse nach carrid und connid.

SELECT
FROM sflight
FIELDS
carrid,
connid,
*COUNT(*) AS amount,                               "Zählen der Zeilen, muss nicht ergänzt werden.
AVG( seatsmax AS DEC( 10,0 ) ) AS avg_max_eco,
AVG( seatsmax_b AS DEC( 10,0 ) ) AS avg_max_b,
AVG( seatsmax_f AS DEC( 10,0 ) ) AS avg_max_f
GROUP BY carrid, connid
INTO TABLE @DATA(lt_aggre).

*cl_demo_output=>display( lt_aggre ).


*   Übung: Order by - Tabelle: SAIRPORT
*   Geben Sie alle Buchungen aus, sortieren Sie diese nach der Zeitzone.

SELECT
FROM sairport
FIELDS *
ORDER BY time_zone DESCENDING
INTO TABLE @DATA(lt_ordered).

*cl_demo_output=>display( lt_ordered ).


*   Übung: Join - Tabellen: SBOOK und SCUSTOM
*   Wählen Sie die Spalten für Airline-Code, Flugverbindungsnummer, Flugdatum, Kundenname und Sprache aus.
*   Geben Sie maximal 20 Einträge aus.

SELECT
    FROM sbook AS booking
    INNER JOIN scustom AS customer
      ON customer~id = booking~customid
    FIELDS
         booking~carrid AS Airline_Code,
         booking~connid AS Flugverbindung,
         booking~fldate AS Flugdatum,
         customer~name AS Kundenname,
         customer~langu AS Sprache
    INTO TABLE @DATA(lt_join_1)
    UP TO 20 ROWS.

*  cl_demo_output=>display( lt_join_1 ).

*   Übung: Insert - Tabelle SCUSTOM
*   Fügen Sie einen Eintrag in die SCUSTOM Tabelle ein.

*   - Start Zeilen mit zwei Optionen -

    " Option 1:
    " DATA(ls_flugkunden) = VALUE scustom(

    " Option 2:
    " DATA ls_flugkunden TYPE scustom.
    " ls_flugkunden = VALUE #(

DATA(ls_flugkunden) = VALUE scustom(
                         id = '00005277'
                         name = 'Fabian'
                         form = 'Herr'
                         street = 'ABAP-Straße 6'
                         postcode = '27016' ).
INSERT scustom FROM ls_flugkunden.
IF sy-subrc = 0.
  WRITE 'Insert Option 2 - Eintrag ergänzt!'.
ELSE.
  WRITE 'Insert Option 2 - Eintrag nicht ergänzt.'.
ENDIF.

*   cl_demo_output=>display( ls_flugkunden ).


*   Übung: Update - Tabelle SCUSTOM
*   Ändern Sie den zuvor angelegten Eintrag in der SCUSTOM Tabelle.

*   - Start Zeilen mit zwei Optionen -

    " Option 1:
    " DATA(ls_flugkunden) = VALUE scustom(

    " Option 2:
    " DATA ls_flugkunden TYPE scustom.
    " ls_flugkunden = VALUE #(

*DATA(ls_flugkunden) = VALUE scustom(
*                         id = '00005277'
*                         name = 'Fabian'
*                         form = 'Herr'
*                         street = 'ABAP-Straße 6'
*                         postcode = '27016' ).
*UPDATE scustom SET street = 'ABAP-Straße 11'
*                   name   = 'Fabian B'       WHERE id = '00005277'.
*if sy-subrc = 0.
*  write 'update option 1 - Eintrag geändert (UPDATE)!'.
*else.
*  write 'update option 1 - Eintrag nicht geändert (NO-UPDATE)!'.
*endif.

*   cl_demo_output=>display( ls_flugkunden ).
*

*   Übung: Delete - Tabelle SCUSTOM
*   Löschen Sie den zuvor angelegten Eintrag in der SCUSTOM Tabelle.

*   - Start Zeilen mit zwei Optionen -

    " Option 1:
    " DATA(ls_flugkunden) = VALUE scustom(

    " Option 2:
    " DATA ls_flugkunden TYPE scustom.
    " ls_flugkunden = VALUE #(

* DATA(ls_flugkunden) = VALUE scustom( id = '00005276' ).
* DELETE FROM scustom.
*
* if sy-subrc = 0.
*  write 'delete option 1 - Eintrag gelöscht (DELETE)!'.
*else.
*  write 'delete option 1 - Eintrag nicht gelöscht (NO-DELETE)!'.
*endif.

   cl_demo_output=>display( ls_flugkunden ).


* CODE DENISE: noch bearbeiten !!!!!!!!!!!!!!!!!!!!
* "Option 1

*IF sy-subrc = 0.
*  WRITE 'Delete Option 1 - Alles hat funktioniert!'.
*ELSE.
*  WRITE 'Delete Option 1 - Das hat nicht geklappt.'.
*ENDIF.
*
*"Option 2
*DATA ls_Fluggesellschaft TYPE scarr.
*ls_fluggesellschaft-carrid = 'XY'.
*DELETE scarr FROM ls_fluggesellschaft.
*IF sy-subrc = 0.
*  WRITE 'Delete Option 2 - Alles hat funktioniert!'.
*ELSE.
*  WRITE 'Delete Option 2 - Das hat nicht geklappt.'.
*ENDIF.





























*Test
