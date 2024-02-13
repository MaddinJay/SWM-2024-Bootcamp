*&---------------------------------------------------------------------*
*& Report zaw_dictionary_ausgabe
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_dictionary_ausgabe.

SELECT
FROM zaw_t_car
RIGHT JOIN zaw_t_owner
ON zaw_t_car~brand = zaw_t_owner~brand AND zaw_t_car~model = zaw_t_owner~model  " -> Es sollten für Eindeutigkeit alle Schlüssel angegeben werden!
FIELDS                                                                          " -> Felder, die angezeigt werden sollen, angeben. Ansonsten kommen beide Tabellen.
zaw_t_owner~owner_firstname AS Vorname,
zaw_t_owner~owner_name AS Nachname,
zaw_t_owner~owner_address AS Adresse,
zaw_t_owner~brand AS Marke,
zaw_t_owner~model AS Modell,
zaw_t_car~prodyear AS Produktionsjahr
WHERE zaw_t_owner~brand IS NOT INITIAL
INTO TABLE @DATA(lt_car).

cl_demo_output=>display( lt_car ).
