*&---------------------------------------------------------------------*
*& Report zselect1_uebung_tl
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zselect1_uebung_tl.
"Aufgabenstellung:
"Geben Sie ale Buchungen des Kunden Christa Delon aus. Tabelle: SBOOK

SELECT
FROM
sbook
FIELDS *
WHERE passname = 'Christa Delon'
INTO TABLE @DATA(lt_sbook).
cl_demo_output=>display( lt_sbook ).

***************************************************************************
"Aufgabe Select2: Lesen Sie eine Zeile aus:
SELECT SINGLE
FROM
sbook
FIELDS *
WHERE passname = 'Christa Delon'
INTO @DATA(ls_sbook).
Cl_demo_output=>display( ls_sbook ).
