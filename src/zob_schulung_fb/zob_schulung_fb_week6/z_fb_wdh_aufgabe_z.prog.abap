*&---------------------------------------------------------------------*
*& Report z_fb_wdh_aufgabe
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_fb_wdh_aufgabe_z.

* Wiederholung Praxis
* Erstellt einen Report, der über ein Selektionsbild Daten aus einer Kundentabelle (SCUSTOM) abfragt.
* Im Selektionsbild kann der Benutzer einen Landescode eingeben, um Kunden aus einem bestimmten Land zu selektieren.
*
* Wenn ein Land eingegeben wurde, sollen nur die Kunden dieses Landes angezeigt werden, andernfalls sollen alle Kunden ausgegeben werden.
*
* Die Kunden sollen sortiert ausgegeben werden (nach Land, Stadt und Straße).
*
* Zusatz 2:
* Setzt die Lösung mithilfe einer Klasse um.

Parameters p_eing type string.

zfb_wdh_aufg1_class=>abruf( iv_eingabe = p_eing ).

*Select
*From scustom
*fields *
*Where COUNTRY = @p_eing
*order by CITY, country, STREET
*into table @Data(lt_tabelle).
*
**cl_demo_output=>display( lt_tabelle ).
*
*Loop at lt_tabelle into Data(ls_struktur).
*Write: ls_struktur-country, ls_struktur-city, ls_struktur-street.
*Endloop.
