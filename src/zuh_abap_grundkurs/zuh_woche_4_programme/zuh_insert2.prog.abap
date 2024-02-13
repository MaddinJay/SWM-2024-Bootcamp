*&---------------------------------------------------------------------*
*& Report zuh_insert2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_insert2.

*Fügen Sie einen Eintrag in die SCUSTOM Tabelle ein.

DATA ls_struktur TYPE scustom.
ls_struktur = VALUE #(

                       id = 23463
                         country = 'DE'
                         name = 'Hofmann Ulrich'
                         street = 'Landsbergerstraße' ).
INSERT scustom FROM ls_struktur.
IF sy-subrc = 0.
  WRITE 'Insert Option 2 - Alles hat funktioniert!'.
ELSE.
  WRITE 'Insert Option 2 - Das hat nicht geklappt.'.
ENDIF.
*
*INSERT INTO scustom VALUES @( VALUE #(
*
*                       id = 23461
*                         country = 'DE'
*                         name = 'Hofmann Ulrich'
*                         street = 'Landsbergerstraße' ) ).
*
*IF sy-subrc = 0.
*  WRITE 'Insert Option 2 - Alles hat funktioniert!'.
*ELSE.
*  WRITE 'Insert Option 2 - Das hat nicht geklappt.'.
*ENDIF.




*DATA(ls_struktur) = VALUE scustom(
*
*                       id = 23460
*                         country = 'DE'
*                         name = 'Hofmann Ulrich'
*                         street = 'Landsbergerstraße' ).
*
*INSERT INTO scustom VALUES ls_struktur.
*IF sy-subrc = 0.
*  WRITE 'Insert Option 2 - Alles hat funktioniert!'.
*ELSE.
*  WRITE 'Insert Option 2 - Das hat nicht geklappt.'.
*ENDIF.
