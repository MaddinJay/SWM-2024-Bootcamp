FUNCTION z_obas_fm_011_customer.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IV_NAME) TYPE  STRING
*"  EXPORTING
*"     REFERENCE(EV_RESULT) TYPE  STRING
*"----------------------------------------------------------------------
  SELECT
  FROM kna1 LEFT JOIN knvk ON kna1~kunnr = knvk~kunnr
  LEFT JOIN vbak ON kna1~kunnr = vbak~knkli
  FIELDS kna1~kunnr, kna1~name1 AS Kundenname, kna1~stras, knvk~name1, vbak~vbeln
  WHERE kna1~name1 = @iv_name
  INTO TABLE @DATA(lt_customer).


  LOOP AT lt_customer INTO DATA(ls_customer).
    IF ls_customer-kunnr IS NOT INITIAL.
      ev_result = ls_customer-kunnr.
    ELSE.
      SELECT
   FROM kna1 LEFT JOIN knvk ON kna1~kunnr = knvk~kunnr
   LEFT JOIN vbak ON kna1~kunnr = vbak~knkli
   FIELDS kna1~kunnr, kna1~name1 AS Kundenname, kna1~stras, knvk~name1, vbak~vbeln
   INTO TABLE @DATA(lt_customer2).
      cl_demo_output=>display( lt_customer2 ).
    ENDIF.
  ENDLOOP.
  cl_demo_output=>display( lt_customer ).



ENDFUNCTION.
