*&---------------------------------------------------------------------*
*& Report z_uebung_sql_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_uebung_sql_01.


SELECT  "Alle Buchungen werden ausgegeben
FROM
SBOOK
FIELDS *
WHERE PASSNAME = 'Christa Delon' INTO TABLE @DATA(lt_booking). "Bei SELECT mit lt_ für Tabelle


cl_demo_output=>display(
  data = lt_booking ).


  SELECT SINGLE "Erste Buchung wird ausgegeben
  FROM
  SBOOK
  FIELDS *
  WHERE PASSNAME = 'Christa Delon'
  INTO @DATA(ls_booking). "Bei SELECT SINGLE mit ls_ für Struktur, da nur eine Zeile

  cl_demo_output=>display(
  data = ls_booking ).
