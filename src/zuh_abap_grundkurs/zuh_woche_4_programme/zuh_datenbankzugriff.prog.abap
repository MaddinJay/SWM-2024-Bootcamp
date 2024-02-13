*&---------------------------------------------------------------------*
*& Report zuh_datenbankzugriff
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_datenbankzugriff.


SELECT
  FROM
    scustom
  FIELDS
    *
  WHERE name LIKE 'Sa%'
  INTO TABLE @DATA(lt_customers).

LOOP AT lt_customers INTO DATA(ls_customer).
  ls_customer-postbox = 'A-22'.
  MODIFY lt_customers FROM ls_customer.
ENDLOOP.


LOOP AT lt_customers REFERENCE INTO DATA(lo_customer).
 lo_customer->webuser = lo_customer->name(10).
ENDLOOP.

LOOP AT lt_customers ASSIGNING FIELD-SYMBOL(<fs_customer>).
  <fs_customer>-telephone = 012324234.
ENDLOOP.
