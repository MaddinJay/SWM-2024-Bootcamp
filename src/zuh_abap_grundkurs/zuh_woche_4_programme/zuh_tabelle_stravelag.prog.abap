*&---------------------------------------------------------------------*
*& Report zuh_tabelle_stravelag
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_tabelle_stravelag.


*Lege einen neuen Wert in der Tabelle stravelag an

*DATA ls_struktur TYPE stravelag.
*ls_struktur = VALUE #(    agencynum = 3366
*                          name = 'Hofmann Reisen'
*                          street = 'Dachauer Straße'
*                          ).
*INSERT stravelag FROM ls_struktur.
*IF sy-subrc = 0.
*  WRITE 'Insert Option 2 - Alles hat funktioniert!'.
*ELSE.
*  WRITE 'Insert Option 2 - Das hat nicht geklappt.'.
*ENDIF.

*Ändere ein feld in dem angelegten Datensatz

*
*UPDATE stravelag SET street = 'Brückerstraße' WHERE agencynum = 3366.
*
*IF sy-subrc = 0.
*  WRITE 'Insert Option 2 - Alles hat funktioniert!'.
*ELSE.
*  WRITE 'Insert Option 2 - Das hat nicht geklappt.'.
*ENDIF.

*löschen des angelegten Datensatzes

DATA ls_struktur TYPE stravelag.
ls_struktur-agencynum = 3366.
DELETE stravelag FROM ls_struktur.

IF sy-subrc = 0.
  WRITE 'Insert Option 2 - Alles hat funktioniert!'.
ELSE.
  WRITE 'Insert Option 2 - Das hat nicht geklappt.'.
ENDIF.
