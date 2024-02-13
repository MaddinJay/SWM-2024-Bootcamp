*&---------------------------------------------------------------------*
**& Report zob_sql_2_dw
**&---------------------------------------------------------------------*
**&
**&---------------------------------------------------------------------*
REPORT zob_sql_2_dw.
*
***********************************************************************
**INSERT, UPDATE, DELETE
***********************************************************************
*"Beispiel INSERT
*"Option 1

*INSERT INTO scarr VALUES @( VALUE
*        #( carrid = 'XZ'
*           carrname = 'X Flights'
*           currcode = 'EUR') ).
*IF sy-subrc = 0.
*  WRITE 'Insert Option 1 - Alles hat funktioniert!'.
*ELSE.
*  WRITE 'Insert Option 1 - Das hat nicht geklappt.'.
*ENDIF.
*
*"Option 2
*DATA ls_Fluggesellschaft TYPE scarr. "Option 1
*ls_fluggesellschaft = VALUE #(       "Option 1
***DATA(ls_fluggesellschaft) = VALUE scarr( "Option 2
*                         carrid = 'XY'
*                         carrname = 'XY Flights'
*                         currcode = 'EUR' ).
*INSERT scarr FROM ls_fluggesellschaft.
*IF sy-subrc = 0.
*  WRITE 'Insert Option 2 - Alles hat funktioniert!'.
*ELSE.
*  WRITE 'Insert Option 2 - Das hat nicht geklappt.'.
*ENDIF.

***********************************************************************
*"Übung: Insert
*"Fügen Sie einen Eintrag in die SCUSTOM Tabelle ein.
*
**DATA(ls_for_insert) = VALUE scustom(
**                            id = 501000
**                            name = 'Ein Kunde'
**                            form = ''
**                            street = 'Straße 1'
**                            postbox = '12345'
**                            postcode = ''
**                            city = 'Stadt'
**                            country = 'DE'
**                            region = '' ).
**INSERT scustom FROM ls_for_insert.
**IF sy-subrc = 0.
**  WRITE 'Alles hat funktioniert!'.
**ELSE.
**  WRITE: 'Das hat nicht geklappt.'.
**ENDIF.
*
***********************************************************************
*"Extra: Neuer Flughafen
*"Fügen Sie dem Datensatz einen neuen Flughafen hinzu.
*"Tabelle: SAIRPORT
*
***********************************************************************
*"Beispiel UPDATE

*
*"Option 1
*UPDATE scarr SET currcode = 'USD' WHERE carrid = 'XX'.
*IF sy-subrc = 0.
*  WRITE 'Update Option 1 - Alles hat funktioniert!'.
*ELSE.
*  WRITE 'Update Option 1 - Das hat nicht geklappt.'.
*ENDIF.
*
*"Option 2

*SELECT SINGLE
*  FROM
*  scarr
*  FIELDS
*  *
*  WHERE carrid = 'XY'
*  INTO @DATA(ls_fluggesellschaft2).
*
*  ls_fluggesellschaft2-carrname = 'Y Flying'.
*  ls_fluggesellschaft2-url = ''.
*
*UPDATE scarr FROM ls_fluggesellschaft2.
*IF sy-subrc = 0.
*  WRITE 'Update Option 2 - Alles hat funktioniert!'.
*ELSE.
*  WRITE 'Update Option 2 - Das hat nicht geklappt.'.
*ENDIF.
*
***********************************************************************
*"Übung: Update
*"Ändern Sie den zuvor angelegten Eintrag in der SCUSTOM Tabelle.
*
**UPDATE scustom SET
**    telephone = 123456
**  WHERE id = 501000.
*
***********************************************************************
*"Beispiel DELETE
*
*"Option 1
*DELETE FROM scarr WHERE carrid = 'XX'.
*IF sy-subrc = 0.
*  WRITE 'Delete Option 1 - Alles hat funktioniert!'.
*ELSE.
*  WRITE 'Delete Option 1 - Das hat nicht geklappt.'.
*ENDIF.
*
*"Option 2
*DATA ls_Fluggesellschaft TYPE scarr.
*ls_fluggesellschaft-carrid = 'XY'.
*DELETE scarr FROM ls_fluggesellschaft.
*IF sy-subrc = 0.
*  WRITE 'Delete Option 2 - Alles hat funktioniert!'.
*ELSE.
*  WRITE 'Delete Option 2 - Das hat nicht geklappt.'.
*ENDIF.
*






***********************************************************************
*"Übung: Delete
*"Löschen Sie den zuvor angelegten Eintrag in der SCUSTOM Tabelle.
**DELETE FROM SCUSTOM WHERE id = 501000.
