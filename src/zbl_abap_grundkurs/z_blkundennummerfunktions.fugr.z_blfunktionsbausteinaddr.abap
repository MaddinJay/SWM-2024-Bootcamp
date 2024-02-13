FUNCTION z_blfunktionsbausteinaddr.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     VALUE(IV_KUNNR) TYPE  KNA1-KUNNR
*"  EXPORTING
*"     REFERENCE(ET_ADDRESS) TYPE  ADRC
*"----------------------------------------------------------------------
select single adrnr from kna1 where kunnr = @iv_kunnr
into @DATA(addrnumber).

  SELECT SINGLE *
    from adrc
    into @et_address
    where addrnumber = @addrnumber.

  IF sy-subrc <> 0.

  ENDIF.


ENDFUNCTION.
