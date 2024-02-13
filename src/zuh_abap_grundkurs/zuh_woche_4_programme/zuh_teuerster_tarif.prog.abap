*&---------------------------------------------------------------------*
*& Report zuh_teuerster_tarif
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_teuerster_tarif.

**Aufgabenstellung
**Finden den teuersten Tarif in der Tabelle SFLIGHT

SELECT MAX( price ) INTO @DATA(lv_max_value) FROM sflight.

WRITE: 'Teuereste Preis', lv_max_value.

*oder:
*select MAX( price ) from sflight into @DATA(lv_max_value).
*
*WRITE: 'Teuereste Preis', lv_max_value.
