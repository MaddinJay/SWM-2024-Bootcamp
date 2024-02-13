*&---------------------------------------------------------------------*
*& Report zaw_uebung_sql1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_uebung_sql1.

" Geben Sie alle Buchungen von Christa Delon aus. Tabelle: SBOOK


*Macht nur Sinn, wenn alle Spalten übernommen werden sollen.
DATA lt_sbook TYPE TABLE OF sbook.

SELECT
FROM sbook
FIELDS *
WHERE passname = 'Christa Delon'
INTO TABLE @lt_sbook.

cl_demo_output=>display( lt_sbook ).

SELECT COUNT( carrid )
FROM sbook
INTO @DATA(lv_count).

WRITE: |Anzahl der Eintrage: { lv_count }|.

*Wenn nicht alle Spalten der externen Tabelle benötigt werden, dann zusätzlich "CORRESPONDING FIELDS".
SELECT
FROM sbook
FIELDS
passname,
carrid,
bookid,
fldate
WHERE passname = 'Christa Delon'
INTO CORRESPONDING FIELDS OF TABLE @lt_sbook.


" Geben Sie die erste Buchung von Christa Delon aus. Tabelle: SBOOK

SELECT SINGLE FROM sbook FIELDS * WHERE passname = 'Christa Delon' INTO @DATA(lt_sbook2). "-> @Data bewirkt, dass die Struktur der externen Tabelle komplett übernommen wird

cl_demo_output=>display( lt_sbook2 ).


" Geben Sie die aktuellsten 10 Flüge der Flug-Tabelle SFLIGTHT aus:

SELECT
FROM sflight
FIELDS *
ORDER BY fldate DESCENDING
INTO TABLE @DATA(lt_flight)
UP TO 10 ROWS.

cl_demo_output=>display( lt_flight ).

" Geben Sie alle Kunden mit einer 100-er ID aus:

SELECT
FROM scustom
FIELDS *
*where id >= 100 and < 200
WHERE id BETWEEN 100 AND 199
INTO TABLE @DATA(lt_kunde).

cl_demo_output=>display( lt_kunde ).


" Geben Sie die Namen aller Fluggesellschaften aus, dessen Währung nicht Dollar oder Euro ist:

SELECT
FROM scarr
FIELDS carrname
WHERE currcode <> 'EUR' AND currcode <> 'USD'
INTO TABLE @DATA(lt_scarr).

cl_demo_output=>display( lt_scarr ).
