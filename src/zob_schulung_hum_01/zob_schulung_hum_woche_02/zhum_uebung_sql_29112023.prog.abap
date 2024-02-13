*&---------------------------------------------------------------------*
*& Report zhum_uebung_sql_29112023
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zhum_uebung_sql_29112023.

*OPTION 1: INSERT

*INSERT INTO scarr VALUES @(  VALUE
* #( carrid = 'XX'
*carrname = 'Flights'
*currcode = 'EUR' ) ).
*IF sy-subrc = 0.
*  WRITE 'Alles hat funktioniert'.
*ELSE.
*  WRITE 'Das hat nicht geklappt'.
*ENDIF.
*
**Option 2: Insert
*DATA ls_Fluggesellschaft TYPE scarr.
*ls_Fluggesellschaft = VALUE #(
*carrid = 'XZ'
*carrname = 'Flightz'
*currcode = 'EUR' ) .
*INSERT scarr FROM ls_fluggesellschaft.

* ÜBUNG INSERT
*Fügen Sie einen Eintrag in die SCUSTOM Tabelle ein.

*DATA ls_scustom TYPE scustom.
*ls_scustom = VALUE #(
*id = 5639
*name = 'Müller'
*form = 'Frau'
*street = 'Schillingweg 6'
*Postcode = 85368 ).
*INSERT scustom FROM ls_scustom.
*IF sy-subrc = 0.
*  WRITE 'Alles hat funktioniert'.
*ELSE.
*  WRITE 'Das hat nicht geklappt'.
*ENDIF.

*OPTION 1 UPDATE
*UPDATE scarr SET currcode = 'USD' WHERE carrid = 'XX'.
*IF sy-subrc = 0.
*  WRITE 'Das hat funktioniert'.
*ELSE.
*  WRITE 'Das hat nicht funktioniert'.
*ENDIF.

*Option 2 Update hier muss die Information schon vorhanden sein und das UPDATE muss nach der entsprechenden Zeile kommen.
*ls_fluggesellschaft-carrname = 'Y-Flying'
*UPDATE scarr from ls_fluggesellschaft.
*IF sy-subrc = 0.
*  WRITE 'Das hat funktioniert'.
*ELSE.
*  WRITE 'Das hat nicht funktioniert'.
*ENDIF.

*ÜBUNG UPDATE
*UPDATE scustom "Welche Tabelle soll geändert werden
*SET name = 'Maier'  "Was soll geändert werden, können auch meherer getrennt durch Komma sein
*WHERE id = '5639'. "Wo kommt die Änderung hin, am besten mit Primärschlüssel
*IF sy-subrc = 0.
*  WRITE 'Alles hat funktioniert'.
*ELSE.
*  WRITE 'Das hat nicht geklappt'.
*ENDIF.

**Option 1 DELETE
*DELETE FROM scarr WHERE id ='XX'.
*IF sy-subrc = 0.
*  WRITE 'Alles hat funktioniert'.
*ELSE.
*  WRITE 'Das hat nicht geklappt'.
*ENDIF.
*
**Option 2 Delete
*DATA ls_fluggesellschaft TYPE scarr
*ls_fluggesellschaft-carrid = 'XY'
*DELETE scarr FROM ls_fluggesellschaft.
*IF sy-subrc = 0.
*  WRITE 'Alles hat funktioniert'.
*ELSE.
*  WRITE 'Das hat nicht geklappt'.
*ENDIF.

*ÜBUNG DELETE
*DELETE FROM scustom "Aus welcher Tabelle soll gelöscht werden
*WHERE id = '5639'. "Welcher Eintrag soll gelöscht werden
*Message 'Datensatz wird unwiderruflich gelöscht' TYPE 'I'.
*IF sy-subrc = 0.
*  WRITE 'Alles hat funktioniert'.
*ELSE.
*  WRITE 'Das hat nicht geklappt'.
*ENDIF.

*ÜBUNG EXTRA Eintrag anlegen und löschen
*Tabelle: STRAVELAG und Scounter

INSERT INTO stravelag VALUES @( VALUE
#( agencynum = '5889'
name = 'Bertis Reiseladen'
street = 'Koblenzer Straße 18'
postcode = '56978'
city = 'Traumhausen'
country = 'CH'
langu = 'DE') ).
IF sy-subrc = 0.
  WRITE 'Sie haben einen neuen Datensatz angelegt'.
ELSE.
  WRITE 'Der Datensatz konnte nicht angelegt werden'.
ENDIF.

*UPDATE stravelag SET name = 'Bertis Reiseträume', city = 'Traumdorf' WHERE agencynum = '5889'.
*IF sy-subrc = 0.
*  WRITE 'Die Änderungen wurden vorgenommen'.
*ELSE.
*  WRITE 'Die Änderungen konnten nicht vorgenommen werden'.
*ENDIF.
*
*DELETE FROM stravelag WHERE agencynum = '5889'.
*IF sy-subrc = 0.
*  WRITE 'Die Daten wurden unwiderruflich gelöscht'.
*ELSE.
*  WRITE 'Der Datensatz konnte nicht gelöscht werden'.
*ENDIF.
