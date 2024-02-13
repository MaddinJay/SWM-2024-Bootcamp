*&---------------------------------------------------------------------*
*& Report zas_uebung_03_woche2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zas_uebung_03_woche2.

"Finden Sie alle Flüge bei denen die Entfernung über 5000 liegt.
*select
*from spfli
*fields *
*where distance > 5000
*into table @DATA(lt_langstreckenfluege).
*cl_demo_output=>display( lt_langstreckenfluege ).

"Ermitteln Sie alle Flüge die von Frankfurt abfliegen.
*select
*from spfli
*fields *
*where cityfrom = 'FRANKFURT'
*into table @DATA(lt_frankfurtfluege).
*cl_demo_output=>display( lt_frankfurtfluege ).

"Geben Sie die Details aller Kunden aus, deren Nachname mit 'S' beginnt.
*select
*from scustom
*fields *
*where name like 'S%'
*into table @DATA(lt_nachname).
*cl_demo_output=>display( lt_nachname ).

"Geben Sie alle Fluggesellschaften aus, dessen Währung 'EUR ist.
*select
*from scarr
*fields *
*where currcode = 'EUR'
*INTO TABLE @DATA(lt_scarr).
*Cl_demo_output=>display( lt_scarr ).

"Finden den teuersten Tarif in der Tabelle SFLIGHT.
*select single
*from sflight
*fields max( price ) as maxPrice
*into  @DATA(lt_sflight).
*cl_demo_output=>display( lt_sflight ).

"Verwenden Sie ABAP SQL,
"um den durchschnittlichen Preis aller Flüge einer bestimmten Fluggesellschaft in der Tabelle SFLIGHT zu berechnen.
*select
*from sflight
*fields carrid, connid, avg( price as dec( 10,0 ) ) as avgPrice
*group by carrid, connid
*into table @DATA(lt_avgPrice).
*cl_demo_output=>display( lt_avgprice ).

"Berechnen Sie die Gesamtzahl der verfügbaren Sitze aller Flüge.
*SELECT single
*FROM sflight
*FIELDS carrid, connid,
*SUM( seatsocc ) AS sumEconomy,
*SUM( seatsocc_b ) AS sumBusiness,
*SUM( seatsocc_f ) AS sumFirstClass,
*SUM( seatsmax ) AS maxEconomy,
*SUM( seatsmax_b ) AS maxBusiness,
*SUM( seatsmax_f ) AS maxFirstClass
*GROUP BY carrid, connid
*INTO  @DATA(ls_sflight).
*
*DATA(ls_free_seats) = ( ls_sflight-maxeconomy - ls_sflight-sumeconomy ) + ( ls_sflight-maxbusiness - ls_sflight-sumbusiness ) + ( ls_sflight-maxfirstclass - ls_sflight-sumfirstclass ).
*
*cl_demo_output=>display( ls_free_seats ).
*********************************************************************
"Verwenden Sie einen Join,
"um die Details aller Flüge und deren entsprechenden Fluggesellschaften aus den Tabellen SFLIGHT und SCARR zu holen.
*select
*from sflight left join scarr on sflight~carrid = scarr~carrid
*fields *
*into table @DATA(lt_sflight).
*cl_demo_output=>display( lt_sflight ).


"Wählen Sie alle Linienflüge der Fluggesellschaft "Lufthansa" aus. Tabelle: SPFLI, SCARR
*select
*from spfli left join scarr on spfli~carrid = scarr~carrid
*fields spfli~carrid, spfli~connid, spfli~cityfrom, spfli~cityto, scarr~carrname
*where spfli~carrid = 'LH' "scarr~carrname = 'Lufthansa'
*into table @DATA(lt_sflight).
*cl_demo_output=>display( lt_sflight ).

"Wählen Sie alle Linienflüge aus. Erweitern Sie Ihren Select Befehl so,
"dass der vollständige Name der Fluggesellschaft anstatt der ID der Airline angezeigt wird.
*select
*from spfli left join scarr on spfli~carrid = scarr~carrid
*fields spfli~carrid, spfli~connid, spfli~cityfrom, spfli~cityto, scarr~carrname
*where spfli~carrid = 'LH' "scarr~carrname = 'Lufthansa'
*into table @DATA(lt_sflight).
*cl_demo_output=>display( lt_sflight ).

"Finden Sie die maximale Kapazität jeder Fluggesellschaft. Geben Sie den Namen der Fluggesellschaft mit aus. Tabelle: SCARR, SFLIGHT
*select
*from sflight left join scarr on sflight~carrid = scarr~carrid
*fields sflight~carrid, scarr~carrname,
**sum( sflight~seatsmax ) as maxSeats,
**sum( sflight~seatsmax_b ) as maxSeats_b,
**sum( sflight~seatsmax_f ) as maxSeats_f,
*sum( sflight~seatsmax + sflight~seatsmax_b + sflight~seatsmax_f ) as totalSeats
*group by sflight~carrid, scarr~carrname
*into table @DATA(lt_sflight).
*cl_demo_output=>display( lt_sflight ).


"Fügen Sie dem Datensatz einen neuen Flughafen hinzu.
*DATA(ls_airport) = VALUE sairport( id = 'XXX' name = 'Xantix Xairport' time_zone = 'UTC+1' ).
*insert sairport from ls_airport.
