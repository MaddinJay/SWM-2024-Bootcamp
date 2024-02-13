*&---------------------------------------------------------------------*
*& Report zuh_delete
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_delete.


DATA ls_struktur TYPE scustom.
ls_struktur-id = 23463.
DELETE scustom FROM ls_struktur.

IF sy-subrc = 0.
  WRITE 'Insert Option 2 - Alles hat funktioniert!'.
ELSE.
  WRITE 'Insert Option 2 - Das hat nicht geklappt.'.
ENDIF.
