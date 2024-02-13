*&---------------------------------------------------------------------*
*& Report zuebungen_extra_von_denise_tl
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuebungen_extra_von_denise_tl.
*********************************************************************************
"Aufgabe 1:
"Geben Sie die ältesten 10 Flüge der Flug-Tabelle aus. Tabelle SFLIGHT.
"Variante 1:
SELECT
FROM
sflight
FIELDS *
ORDER BY fldate DESCENDING
INTO TABLE @DATA(lt_flights)
UP TO 10 ROWS.

*cl_demo_output=>display( lt_flights ).

"Variante 2:
*SELECT
* *
*FROM
*sflight
*ORDER BY fldate ASCENDING "--> er nimmt die ersten 10 jüngsten Flüge
*INTO TABLE @DATA(lt_flights2)
*UP TO 10 ROWS.
*
*cl_demo_output=>display( lt_flights2 ).

*********************************************************************************
"Aufgabe 2:
"Geben Sie alle Kunden mit einer 100-er ID aus. Tabelle SCUSTOM.
"Variante1:
SELECT
FROM
scustom
FIELDS
ID,
NAME
WHERE ID >= 100 AND ID < 200
INTO TABLE @DATA(lt_kunden).

*cl_demo_output=>display( lt_kunden ).
*
*"Variante 2:
*SELECT
*FROM
*scustom
*FIELDS
* *
*WHERE ID >= 100 AND ID < 200
*INTO TABLE @DATA(lt_kunden2).
*
*cl_demo_output=>display( lt_kunden2 ).

*********************************************************************************
"Aufgabe 3:
""Geben Sie die Namen aller Fluggesellschaften aus, dessen Währung nicht Dollar oder Euro ist. Tabelle: SCARR
SELECT
FROM
scarr
FIELDS
carrname
WHERE currcode <> 'EUR' AND currcode <> 'USD' "Ungleich heißt <>
*WHERE currcode NOT LIKE 'EUR' AND currcode NOT LIKE 'USD' "Zweite Variante UNGLEICH zu schreiben
INTO TABLE @DATA(lt_waehrung).

*cl_demo_output=>display( lt_waehrung ).

*********************************************************************************
"Aufgabe 4:
"Geben Sie die Namen alle Flugkunden aus, die eine Anrede besitzen. Tabelle SCUSTOM.
SELECT
FROM
scustom
FIELDS
NAME,
FORM
WHERE FORM LIKE 'M%' AND FORM LIKE 'F%' AND FORM LIKE 'H%' AND FORM LIKE 'F%'
INTO TABLE @DATA(lt_anrede).
cl_demo_output=>display( lt_anrede ).
