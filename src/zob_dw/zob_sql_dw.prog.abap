**&---------------------------------------------------------------------*
**& Report zob_sql_dw
**&---------------------------------------------------------------------*
**&
**&---------------------------------------------------------------------*
REPORT zob_sql_dw.
*SELECT => ZOB_SQL_SELECT_SIMPLE_DW
*SELECT mit JOINS => ZOB_SQL_SELECT_JOIN_DW
*INSERT, UPDATE, DELETE => ZOB_SQL_2_DW


"Datenreferenz
SELECT
  FROM
    scustom
  FIELDS
    *
  WHERE name LIKE 'Sa%'
  INTO TABLE @DATA(lt_customers).

"Option 1
LOOP AT lt_customers INTO DATA(ls_customer).
  "Kopie
  ls_customer-postbox = 'A-22'.
  MODIFY lt_customers FROM ls_customer.
ENDLOOP.

"Option 2
LOOP AT lt_customers REFERENCE INTO DATA(lo_customer).
  "Datenreferenz
  "Zeigen auf Objekte
  "dereferenzieren ->
  "höhere Flexibilität und Typsicherheit => nutzen bei generischem Code
  lo_customer->postbox = 'B11'.
ENDLOOP.

"Option 3
LOOP AT lt_customers ASSIGNING FIELD-SYMBOL(<fs_customer>).
  "Feldsymbol (Field-Symbol):
  "Zeiger/Pointer
  "Kein eigener Speicher zeigen direkt auf Adresse des Datenobjekts
  "Schneller => nutzen bei performance-kritischen Operationen
  <fs_customer>-postbox = 'S1'.
ENDLOOP.
