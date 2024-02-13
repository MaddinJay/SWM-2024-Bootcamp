*&---------------------------------------------------------------------*
*& Report zuh_wiederholung_praxis
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_wiederholung_praxis.


*Erstellt einen Report, der über ein Selektionsbild Daten aus einer Kundentabelle (SCUSTOM) abfragt.
*Im Selektionsbild kann der Benutzer einen Landescode (count) eingeben, um Kunden aus einem bestimmten Land zu selektieren.
*Wenn ein Land eingegeben wurde, sollen nur die Kunden dieses Landes angezeigt werden, andernfalls sollen alle Kunden ausgegeben werden.
*Die Kunden sollen sortiert ausgegeben werden (nach Land (country), Stadt(city) und Straße(street)).


PARAMETERS p_land TYPE scustom-country.

zuh_wh_praxis=>abruf(  iv_land = p_land ).
