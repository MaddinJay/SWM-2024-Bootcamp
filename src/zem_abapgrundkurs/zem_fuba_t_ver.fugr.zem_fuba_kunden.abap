FUNCTION zem_fuba_kunden.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IV_NAME) TYPE  STRING
*"  EXPORTING
*"     REFERENCE(LT_TAB) TYPE  ZEM_TAB_KNR
*"----------------------------------------------------------------------
Select
From kna1
left join knvk on kna1~kunnr = knvk~kunnr
left join vbak on vbak~kunnr = kna1~kunnr
Fields
vbak~kunnr,
knvk~kunnr,
kna1~MCOD1,
kna1~STRAS,
kna1~ekont,
vbak~VBELN
Where kna1~MCOD1 = @iv_name
Into Table @lt_tab.

ENDFUNCTION.
