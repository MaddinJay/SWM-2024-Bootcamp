*&---------------------------------------------------------------------*
*& Report zfd_datenreferenz_1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_datenreferenz_1.

"Datenreferenz

SELECT
  FROM
    scustom
  FIELDS
    *
  WHERE name LIKE 'Fr%'
  INTO TABLE @DATA(lt_customers).

LOOP AT lt_customers INTO Data(ls_customer).
  ls_customer-city = 'LEGOLAND'.
  MODIFY lt_customers FROM ls_customer.
ENDLOOP.

*cl_demo_output=>display( lt_customers ).

LOOP AT lt_customers REFERENCE INTO DATA(lo_customer).
  "Datenreferenz
  "Zeigen auf Objekte
  "dereferenzieren ->
  "höhere Flexibilität und Typsicherheit => nutzen bei generischem Code

  lo_customer->webuser = lo_customer->name(12).
ENDLOOP.

*cl_demo_output=>display( lo_customer ).

LOOP AT lt_customers ASSIGNING FIELD-SYMBOL(<fs_customer>).
  "Feldsymbol (Field-Symbol):
  "Zeiger/Pointer
  "Kein eigener Speicher zeigen direkt auf Adresse des Datenobjekts
  "Schneller => nutzen bei performance-kritischen Operationen

  <fs_customer>-telephone = 7777777.
  <fs_customer>-city = 'LEGOWORLD'.

ENDLOOP.

*cl_demo_output=>display( lt_customers ).


*

SELECT
  FROM
    scarr
  FIELDS
    *
  WHERE Carrid LIKE 'S%' or Carrname Like 'L%'
  INTO TABLE @DATA(lt_scarr).

LOOP AT lt_scarr INTO Data(ls_scarr).
  ls_scarr-url = 'www.LEGOLAND.de'.
  MODIFY lt_scarr FROM ls_scarr.
ENDLOOP.

cl_demo_output=>display( lt_scarr ).

LOOP AT lt_scarr REFERENCE INTO DATA(lr_scarr).
  lr_scarr->carrid = lr_scarr->url.
ENDLOOP.

cl_demo_output=>display( lt_scarr ).

LOOP AT lt_scarr ASSIGNING FIELD-SYMBOL(<fs_scarr>).
  <fs_scarr>-currcode = 'FRA'.
ENDLOOP.

cl_demo_output=>display( lt_scarr ).
