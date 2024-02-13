*&---------------------------------------------------------------------*
*& Report zob_test_mb
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_test_mb.
*Aufgabenstellung
*Geben Sie alle Buchungen des Kunden Christa Delon aus.
*Tabelle: SBOOK
*
*SELECT
* FROM
* sbook
* FIELDS
* *
* WHERE passname = 'Christa Delon'
* INTO TABLE @DATA(lt_sbook).
*cl_demo_output=>display( lt_sbook ).
*
**Aufgabenstellung
**Geben Sie eine Buchung des Kunden Christa Delon aus.
**Tabelle: SBOOK
*
*SELECT SINGLE
* FROM
* sbook
* FIELDS  " anstatt, des Sternchen könnte man hier jetzt Spalten angeben, z.B. passname, bookid,agencynum
* *
* WHERE passname = 'Christa Delon'
* INTO @DATA(ls_sbook).
*Cl_demo_output=>display( ls_sbook ).

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

Select from scarr Fields * where currcode EQ 'EUR@'
INTO TABLE @DATA(lt_scarr).
Cl_demo_output=>display( lt_scarr ).
