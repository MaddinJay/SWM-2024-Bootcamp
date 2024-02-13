*&---------------------------------------------------------------------*
*& Report zas_uebung_02_woche2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zas_uebung_02_woche2.

"Geben Sie alle Buchungen des Kunden Christa Delon aus.
*select
*from sbook
*fields *
*where passname = 'Christa Delon'
*into table @DATA(lt_passname).
*cl_demo_output=>display( lt_passname ).

"Geben Sie eine Buchung des Kunden Christa Delon aus.
*select single
*from sbook
*fields *
*where passname = 'Christa Delon'
*into @DATA(lt_passname).
*cl_demo_output=>display( lt_passname ).

"Sie wollen die durchschnittlichen Sitzplätze der Economy, Business und First Class wissen.
"Gruppieren Sie die Ergebnisse nach carrid und connid.

*select
*from sflight
*fields carrid, connid, count( * ) as amount,
*avg( seatsocc as dec( 10,0 ) ) as avgEconomy,
*avg( seatsocc_b as dec( 10,0 ) ) as avgBusiness,
*avg( seatsocc_f as dec( 10,0 ) ) as avgFirstClass
*GROUP BY carrid, connid
*into table @DATA(lt_avgSitze).
*cl_demo_output=>display( lt_avgsitze ).

"Geben Sie alle Buchungen aus, sortieren Sie diese nach der Zeitzone.
*select
*from sairport
*fields *
*order by time_zone descending
*INTO TABLE @DATA(lt_ordered).
*cl_demo_output=>display( lt_ordered ).

"Wählen Sie die Spalten für Airline-Code, Flugverbindungsnummer, Flugdatum,
*Kundenname und Sprache aus. Geben Sie maximal 20 Einträge aus

*select
*from sbook inner join scustom on sbook~customid = scustom~id
*fields sbook~connid, sbook~carrid, sbook~fldate, scustom~name, scustom~langu
*into table @DATA(lt_join)
*UP TO 20 ROWS.
*cl_demo_output=>display( lt_join ).

*Fügen Sie einen Eintrag in die SCUSTOM Tabelle ein.
*DATA(ls_insert) = VALUE scustom( id = 23131 ... ).

"Ändern Sie den zuvor angelegten Eintrag in der SCUSTOM Tabelle.
*UPDATE scustom SET telephone = '' custtype = '' discount = '' langu = '' email = '' webuser = '' WHERE id = 5$$###.

"Löschen Sie den zuvor angelegten Eintrag in der SCUSTOM Tabelle.
*DELETE FROM SCUSTOM WHERE id = 5$$###.
