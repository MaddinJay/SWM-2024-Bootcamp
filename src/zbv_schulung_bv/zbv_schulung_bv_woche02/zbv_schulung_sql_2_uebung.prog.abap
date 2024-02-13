*&---------------------------------------------------------------------*
*& Report zbv_schulung_sql_2_uebung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbv_schulung_sql_2_uebung.

*"Übung Insert
*"Fügen Sie einen Eintrag in die SCUSTOM Tabelle ein.
*
*DATA(ls_flugkunde) = VALUE scustom(
*                         ID = 5507
*                         NAME = 'Ronaldo'
*                         FORM = 'Herr'
*                         STREET = 'Emmy-Noether-Straße 2'
*                         POSTCODE = 80992
*                         CITY = 'München'
*                         COUNTRY = 'Deutschland'
*                         TELEPHONE = '089-1234' ).
*INSERT scustom FROM ls_flugkunde.
*IF sy-subrc = 0.
*  WRITE 'Insert Option 2 - Alles hat funktioniert!'.
*ELSE.
*  WRITE 'Insert Option 2 - Das hat nicht geklappt.'.
*ENDIF.
*
*"Übung Update
*"Ändern Sie den zuvor angelegten Eintrag in der SCUSTOM Tabelle.
*ls_flugkunde-region = 'Bayern'.
*ls_flugkunde-name = 'Cristiano Ronaldo'.
*UPDATE scustom FROM ls_flugkunde.
*IF sy-subrc = 0.
*  WRITE 'Alles hat funktioniert!'.
*ELSE.
*  WRITE 'Das hat nicht geklappt.'.
*ENDIF.
*
*"Übung Delete
*"Löschen Sie den zuvor angelegten Eintrag in der SCUSTOM Tabelle.
*
*DELETE scustom FROM ls_flugkunde.
*IF sy-subrc = 0.
*  WRITE 'Alles hat funktioniert!'.
*ELSE.
*  WRITE 'Das hat nicht geklappt.'.
*ENDIF.

"In Tabelle STRAVELAG einen Eintrag Anlegen ( Insert ), updaten und deleten.

DATA(ls_reise) = VALUE STRAVELAG(
                    AGENCYNUM = 5551
                    NAME = 'Benjamin Veletanlic'
                    STREET = 'Musterstraße 1'
                    POSTCODE = 81234
                    CITY = 'München'
                    COUNTRY = 'DE').
INSERT STRAVELAG FROM ls_reise.
IF sy-subrc = 0.
  WRITE 'Moze'.
ELSE.
  WRITE 'Ne moze'.
ENDIF.

ls_reise-region = 'Bayern'.
UPDATE STRAVELAG FROM ls_reise.
IF sy-subrc = 0.
  WRITE 'Moze'.
ELSE.
  WRITE 'Ne moze'.
ENDIF.

DELETE STRAVELAG FROM ls_reise.
IF sy-subrc = 0.
  WRITE 'Moze'.
ELSE.
  WRITE 'Ne moze'.
ENDIF.


"In Tabelle SCOUNTER einen Eintrag Anlegen ( Insert ), updaten und deleten.
