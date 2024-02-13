*&---------------------------------------------------------------------*
*& Report zextra_uebungen_denise_writetl
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zextra_uebungen_denise_writetl.
***********************************************************************
*Übung INSERT/UPDATE/DELETE
*Tabellen: STRAVELAG, SCOUNTER
***********************************************************************
*Aufgabe1:  STRAVELAG
*----------------------------------------------------------------------
"INSERT"
DATA(ls_travel) = VALUE stravelag(
agencynum = 12345
name = 'Tea Travels'
street = 'Emmy_Noether_St 2'
postbox = 'A123'
postcode = '80992'
city = 'Minhen'
country = 'Deutschland'
region = 'BA'
telephone = '+49 1789654285'
).
*INSERT stravelag FROM ls_travel.
*IF sy-subrc = 0.
*  WRITE 'INSERT - Du hast erfolgreich Daten hinzugefügt'.
*ELSE.
*  WRITE 'INSERT - Daten wurden nicht hinzugefügt'.
*ENDIF.

"UPDATE"
*SELECT SINGLE
*  FROM
*  stravelag
*  FIELDS *
*  WHERE agencynum = 12345
*  INTO @ls_travel.
*  ls_travel-name = 'Tea Travels d.o.o'.
*  ls_travel-city = 'Derventa'.
*  ls_travel-country = 'BIH'.
*  ls_travel-region = 'RS'.
*UPDATE stravelag FROM ls_travel.
*IF sy-subrc = 0.
*  WRITE 'UPDATE - Daten wurden geupdatet'.
*ELSE.
*  WRITE 'UPDATE - Das hat nicht geklappt.'.
*ENDIF.

"DELETE"
DELETE FROM stravelag WHERE agencynum = 536547.
IF sy-subrc = 0.
  WRITE 'Delete Data2 - Alles hat funktioniert!'.
ELSE.
  WRITE 'Delete Data2 - Das hat nicht geklappt.'.
ENDIF.


***********************************************************************
*Aufgabe2:  SCOUNTER
*----------------------------------------------------------------------
