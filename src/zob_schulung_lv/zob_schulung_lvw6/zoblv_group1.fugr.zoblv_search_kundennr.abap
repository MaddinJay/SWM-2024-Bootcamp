FUNCTION zoblv_search_kundennr.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IV_CUSTOMER_NAME) TYPE  STRING
*"  EXPORTING
*"     REFERENCE(EV_CUSTOMER_NR) TYPE  STANDARD TABLE
*"----------------------------------------------------------------------
 "kna1.
*  DATA lt_customers TYPE TABLE OF kna1.
*  DATA lv_customer_number TYPE kna1-kunnr.

  "datenbankabfrage: kundennummer anhand des namens
  SELECT
    FROM kna1
    FIELDS
    kunnr AS kna1num,
     name1 AS knaname
  WHERE name1 LIKE  @iv_customer_name
    INTO TABLE @ev_customer_nr.

*  "ausgabe der kundennummern
*  LOOP AT lt_customers INTO DATA(ls_customer).
*    lv_customer_number = ls_customer-kunnr.
**    WRITE: / 'customer name: ', iv_customer_name,
**    / 'customer number: ', lv_customer_number.
*  ENDLOOP.
**
*  IF lt_customers IS INITIAL.
*    WRITE: / 'no customer found for the given name: ', iv_customer_name.
*  ENDIF.




ENDFUNCTION.
