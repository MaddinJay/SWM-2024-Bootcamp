*&---------------------------------------------------------------------*
*& Report z_uebung_extra
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_uebung_extra.

*Aufgabenstellung
*Finden Sie alle Flüge bei denen die Entfernung über 5000 liegt.
*Tabelle: SPFLI

*Select from spfli Fields * where  distance > '5000'
*INTO TABLE @DATA(lt_spfli).
*
*Cl_demo_output=>display( lt_spfli ).


*Aufgabenstellung
*Ermitteln Sie alle Flüge die von Frankfurt abfliegen.
*Tabelle: SPFLI

*Select from spfli Fields * where  airpfrom = 'FRA'
*INTO TABLE @DATA(lt_spfli).
*Cl_demo_output=>display( lt_spfli ).


*Aufgabenstellung
*Geben Sie die Details aller Kunden aus, deren Nachname mit 'S' beginnt.
*Tabelle: SCUSTOM

*Select from scustom Fields * where name like 'S%'
*INTO TABLE @DATA(lt_spfli).
*Cl_demo_output=>display( lt_spfli ).


*Aufgabenstellung
*Geben Sie alle Fluggesellschaften aus, dessen Währung 'EUR ist.
*Tabelle: SCARR

*Select from scarr Fields * where currcode = 'EUR' INTO TABLE @DATA(lt_scarr).
*Cl_demo_output=>display( lt_scarr ).



*Aufgabenstellung
*Finden den teuersten Tarif in der Tabelle SFLIGHT.

*
*
*SELECT MAX( price )
*From sflight
*INTO @Data(lv_price).
*WRITE: / lv_price, 'EUR'.


*Verwenden Sie ABAP SQL, um den durchschnittlichen Preis aller Flüge einer
*bestimmten Fluggesellschaft in der Tabelle SFLIGHT zu berechnen.

*SELECT
*
*FROM sflight
*Fields
*
* COUNT(*) AS amount,
* AVG( price AS DEC( 10,0 ) )
* where carrid ='LH'
* INTO TABLE @DATA(lt_sflight).                     "die Tabelle kann man so benennen wie man möchte
*
*Cl_demo_output=>display( lt_sflight ).


SELECT

FROM sflight
Fields
Carrid,
 AVG( price AS DEC( 10,0 ) ) AS avg_price
group by carrid
INTO TABLE @DATA(lt_Fluege).

Cl_demo_output=>display( lt_Fluege ).
