*&---------------------------------------------------------------------*
*& Report zbv_schulung_modify
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbv_schulung_modify.

"Datenreferenz

SELECT
  FROM
    scustom
  FIELDS
    *
  WHERE name LIKE 'Sa%'
  INTO TABLE @DATA(lt_customers).

LOOP AT lt_customers INTO DATA(ls_customer).
  "Kopie
  ls_customer-postbox = 'A-22'.
  MODIFY lt_customers FROM ls_customer.
ENDLOOP.

LOOP AT lt_customers REFERENCE INTO DATA(lo_customer).
  "Datenreferenz
  "Zeigen auf Objekte
  "dereferenzieren ->
  "höhere Flexibilität und Typsicherheit => nutzen bei generischem Code

  lo_customer->webuser = lo_customer->name(10).
ENDLOOP.

LOOP AT lt_customers ASSIGNING FIELD-SYMBOL(<fs_customer>).

  "Feldsymbol (Field-Symbol):
  "Zeiger/Pointer
  "Kein eigener Speicher zeigen direkt auf Adresse des Datenobjekts
  "Schneller => nutzen bei performance-kritischen Operationen

  <fs_customer>-telephone = 012324234.
ENDLOOP.
