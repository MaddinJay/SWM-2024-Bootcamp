*&---------------------------------------------------------------------*
*& Report zfb_week2_sql_uebung_2extra
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfb_week2_sql_uebung_2extra.

"Geben Sie die letzten 10 Flüge der Flug-Tabelle aus. Tabelle SFLIGHT.

*SELECT
*FROM sflight
*FIELDS
*  *
*  ORDER BY FLdate DESCENDING
**  WHERE fldate between 20210102 and 20210105
*  INTO TABLE @DATA(lt_flights)
*  UP TO 10 ROWS.
**cl_demo_output=>display( lt_flights ).
*
*
*"Geben Sie alle Kunden mit einer 100-er id aus. Tabelle SCUSTOM.
*SELECT
*FROM scustom
*FIELDS
*  *
**  WHERE id >= 100 And id < 200
*  WHERE id between 100 And 200
*
*  INTO TABLE @DATA(lt_flights2).
*
*cl_demo_output=>display( lt_flights2 ).
*
*
*"Geben Sie die Namen aller Fluggesellschaften aus, dessen Währung nicht Dollar oder Euro ist. Tabelle: SCARR
*
*SELECT
*  FROM
*  scarr
*  FIELDS
*  *
*  WHERE currcode <> 'EUR' AND currcode <> 'USD'
** " WHERE currcode NOT LIKE 'EUR' AND currcode NOT LIKE 'USD'
*  INTO TABLE @DATA(lt_flugges).
*
*cl_demo_output=>display( lt_flugges ).

"Geben Sie die Namen alle Flugkunden aus, die eine Anrede besitzen. Tablle SCUSTOM.

"Geben Sie den Flug mit der Buchungsnummer 144 aus. Tabelle SBOOK

"Geben Sie alle Flüge, die innerhalb der USA fliegen, aus. Tabelle SPFLI.

"Geben Sie alle Flüge, die Vormittags losfliegen und die mehr als einen Tag dauern, aus. Tabelle SPFLI.

"Geben Sie die Buchungsummen der einzelnen Tage aus. Tabelle SFLIGHT.

"Geben Sie alle Flugkunden, deren Hausnummer 6 ist, aus. Tabelle SCUSTOM.

"Geben Sie die Anzahl der gebuchten Flüge eines Kunden aus. Tabelle SBOOK.



*REPORT zob_test_dw.

**** Grundcoding um Inhalte aus einer bestehenden Tabelle
**** in eine "eigene" Tabelle per Struktur zu überführen ***

SELECT
  FROM
    scustom
  FIELDS
    *
  WHERE id >= 20
  INTO TABLE @DATA(lt_customers).

 cl_demo_output=>display( lt_customers ).

**** Grundcoding oben muss so mitgegeben werden als Referenz ---- ENDE


**** Danach gibt es drei Möglichkeiten:

**** per MODIFY - REFERENCE INTO Befehl oder FIELD-SYMBOL
*
***** MODIFY ändert eine Zeile der kopierten Tabelle und ändert den Wert für die "eigene" neue Tabelle
*
***** (REFERENCE Befehl ist "gründlicher" weil gesamte Datenbank vollständig geladen wird)
*****
***** (FIELD-SYMBOL wählt direkt das Feld aus und geht schneller und direkte Zuordnung
*****                (performanter für System bei großen Datenbanken)
*
*LOOP AT lt_customers INTO DATA(ls_flugkunden).
*  "Kopie
*  ls_flugkunden-postcode = 'Fabi 75839'.
*  MODIFY lt_customers FROM ls_flugkunden.
*ENDLOOP.
*
*
*
*LOOP AT lt_customers REFERENCE INTO DATA(lo_flugkunden).
*  "Datenreferenz
*  "Zeigen auf Objekte
*  "dereferenzieren ->
*  "höhere Flexibilität und Typsicherheit => nutzen bei generischem Code
*
*  lo_customer->webuser = lo_customer->name(10).
*ENDLOOP.
*
*LOOP AT lt_customers ASSIGNING FIELD-SYMBOL(<fs_customer>).
*  "Feldsymbol (Field-Symbol):
*  "Zeiger/Pointer
*  "Kein eigener Speicher zeigen direkt auf Adresse des Datenobjekts
*  "Schneller => nutzen bei performance-kritischen Operationen
*
*  <fs_customer>-telephone = 012324234.
*ENDLOOP.

****** Beispiel von Frank:

*SELECT
*  FROM
*    scarr
*  FIELDS
*    *
*  WHERE Carrid LIKE 'S%' or Carrname Like 'L%'
*  INTO TABLE @DATA(lt_scarr).
*
*LOOP AT lt_scarr INTO Data(ls_scarr).
*  ls_scarr-url = 'www.LEGOLAND.de'.
*  MODIFY lt_scarr FROM ls_scarr.
*ENDLOOP.
*
*cl_demo_output=>display( lt_scarr ).
*
*LOOP AT lt_scarr REFERENCE INTO DATA(lr_scarr).
*  lr_scarr->carrid = lr_scarr->url.
*ENDLOOP.
*
*cl_demo_output=>display( lt_scarr ).
*
*LOOP AT lt_scarr ASSIGNING FIELD-SYMBOL(<fs_scarr>).
*  <fs_scarr>-currcode = 'FRA'.
*ENDLOOP.
*
*cl_demo_output=>display( lt_scarr ).



* ----
