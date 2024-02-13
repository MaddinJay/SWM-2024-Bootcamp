*&---------------------------------------------------------------------*
*& Report zfd_sql_extra_uebungen_2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_sql_extra_uebungen_2.

"Geben Sie die letzten 10 Flüge der Flug-Tabelle aus. Tabelle SFLIGHT.

SELECT
FROM sflight
FIELDS
  *
  ORDER BY FLdate DESCENDING
*  WHERE fldate between 20210102 and 20210105
  INTO TABLE @DATA(lt_flights)
  UP TO 10 ROWS.
*cl_demo_output=>display( lt_flights ).


"Geben Sie alle Kunden mit einer 100-er id aus. Tabelle SCUSTOM.
SELECT
FROM scustom
FIELDS
  *
*  WHERE id >= 100 And id < 200
  WHERE id BETWEEN 100 AND 199
  INTO TABLE @DATA(lt_flights2).
*cl_demo_output=>display( lt_flights2 ).

"Geben Sie die Namen aller Fluggesellschaften aus, dessen Währung nicht Dollar oder Euro ist. Tabelle: SCARR
SELECT
FROM scarr
FIELDS
  carrname
  WHERE ( Currcode NE 'USD' ) AND ( currcode NE 'EUR' )
*  WHERE currcode NOT LIKE 'USD' and currcode NOT LIKE 'EUR'
  INTO TABLE @DATA(lt_waehrung).
*cl_demo_output=>display( lt_waehrung ).

"Geben Sie die Namen alle Flugkunden aus, die eine Anrede besitzen. Tabelle SCUSTOM.
SELECT
FROM scustom
FIELDS
 name,
 form
 WHERE form IS NOT initial
INTO TABLE @DATA(lt_anrede1).

cl_demo_output=>display( lt_anrede1 ).

"Geben Sie den Flug mit der Buchungsnummer 144 aus. Tabelle SBOOK

"Geben Sie alle Flüge, die innerhalb der USA fliegen, aus. Tabelle SPFLI.

"Geben Sie alle Flüge, die Vormittags losfliegen und die mehr als einen Tag dauern, aus. Tabelle SPFLI.

"Geben Sie die Buchungsummen der einzelnen Tage aus. Tabelle SFLIGHT.

"Geben Sie alle Flugkunden, deren Hausnummer 6 ist, aus. Tabelle SCUSTOM.

"Geben Sie die Anzahl der gebuchten Flüge eines Kunden aus. Tabelle SBOOK.
SELECT
FROM sbook
FIELDS
  passname,
  COUNT(*) as Amount

  where passname = 'Chris Miller'
  GROUP by passname
  INTO TABLE @DATA(lt_geb_Fluege_Chris_miller).

cl_demo_output=>display( lt_geb_Fluege_Chris_miller ).
