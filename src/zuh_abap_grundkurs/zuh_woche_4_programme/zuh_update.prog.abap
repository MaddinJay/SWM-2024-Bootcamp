*&---------------------------------------------------------------------*
*& Report zuh_update
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_update.




*
*update scustom set street = 'Dachauerstraße' where id = 23463.   "Es wird nur ein Wert geändert
*IF sy-subrc = 0.
*  WRITE 'Insert Option 2 - Alles hat funktioniert!'.
*ELSE.
*  WRITE 'Insert Option 2 - Das hat nicht geklappt.'.
*ENDIF.


DATA(ls_struktur) = VALUE scustom(
                                  id = 23460
                                  street = 'Frankfurterring'
                                  country = 'FR'
                                                  ).

UPDATE scustom FROM ls_struktur.

IF sy-subrc = 0.
  WRITE 'Insert Option 2 - Alles hat funktioniert!'.
ELSE.
  WRITE 'Insert Option 2 - Das hat nicht geklappt.'.
ENDIF.
