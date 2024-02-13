*&---------------------------------------------------------------------*
*& Report zextra_aufgaben1_bis_4_tl
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zextra_aufgaben1_bis_4_tl.
************************************************************************
"Extra 1: Langstreckenflüge"
*Finden Sie alle Flüge bei denen die Entfernung über 5000 liegt.
*Tabelle: SPFLI
************************************************************************
DATA lt_spfli TYPE TABLE OF spfli. "Tabelle erstellt, in die Daten aus der SPFLI befüllt werden

SELECT
FROM
spfli
FIELDS *
WHERE distance > 5000
INTO TABLE @lt_spfli.
cl_demo_output=>display( lt_spfli ).

************************************************************************
"Extra 2: Flüge von Frankfürt"
*Ermitteln Sie alle Flüge die von Frankfurt abfliegen.
*Tabelle: SPFLI
************************************************************************
DATA lt_spfli2 TYPE TABLE OF spfli. "Tabelle erstellt, in die Daten aus der SPFLI befüllt werden

SELECT
FROM
spfli
FIELDS *
WHERE cityfrom = 'FRANKFURT'
INTO TABLE @lt_spfli2.
cl_demo_output=>display( lt_spfli2 ).

************************************************************************
"Extra 3: Nachname S* "
*Geben Sie die Details aller Kunden aus, deren Nachname mit 'S' beginnt.
*Tabelle: SCUSTOM
************************************************************************
DATA lt_scustom3 TYPE TABLE OF scustom. "Tabelle erstellt, in die Daten aus der SPFLI befüllt werden

SELECT
FROM
scustom
FIELDS *
WHERE name LIKE 'S%'
INTO TABLE @lt_scustom3.
cl_demo_output=>display( lt_scustom3 ).

************************************************************************
"Extra 4: Euro"
*Geben Sie alle Fluggesellschaften aus, dessen Währung 'EUR ist.
*Tabelle: SCARR
************************************************************************
SELECT
FROM
scarr
FIELDS
carrname
WHERE currcode = 'EUR'
INTO TABLE @DATA(lt_scarr4). " --> man darf hier nicht wie beim anderen am anfang tabelle deklarieren, weil sonst 4 spalten angezeigt werden, und wir wollen nur eine
cl_demo_output=>display( lt_scarr4 ).
