*&---------------------------------------------------------------------*
*& Report z_write
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_write.

*INSERT INTO SCUSTOM VALUES @( VALUE #(
*                           ID = '1345644'
*                           NAME = 'HANS'
*                           FORM = 'HERR'
*                           STREET = 'MUSTERSTRASSE'
*                                ) ).
*
*IF SY-SUBRC = 0.
*WRITE: 'geht'.
*ELSE.
*WRITE: 'geht nicht'.
*ENDIF.
*
*SELECT
*  FROM
*    SCUSTOM
*  FIELDS
*    *
*  WHERE ID = '1345644'
*  INTO TABLE @DATA(lt_mandant).
*
*cl_demo_output=>display( lt_mandant ).

"Option 1
*UPDATE scarr SET currcode = 'USD' WHERE carrid = 'XX'.
*IF sy-subrc = 0.
*  WRITE 'Update Option 1 - Alles hat funktioniert!'.
*ELSE.
*  WRITE 'Update Option 1 - Das hat nicht geklappt.'.
*ENDIF.

*UPDATE SCUSTOM SET name = 'Martens'  WHERE id = 5.
*IF sy-subrc = 0.
*  WRITE 'Update Option 1 - Alles hat funktioniert!'.
*ELSE.
*  WRITE 'Update Option 1 - Das hat nicht geklappt.'.
*ENDIF.

"Beispiel DELETE

"Option 1
*DELETE FROM scarr WHERE carrid = 'XX'.
*IF sy-subrc = 0.
*  WRITE 'Delete Option 1 - Alles hat funktioniert!'.
*ELSE.
*  WRITE 'Delete Option 1 - Das hat nicht geklappt.'.
*ENDIF.
*
*"Option 2
*DELETE scarr FROM ls_fluggesellschaft.
*IF sy-subrc = 0.
*  WRITE 'Delete Option 2 - Alles hat funktioniert!'.
*ELSE.
*  WRITE 'Delete Option 2 - Das hat nicht geklappt.'.
*ENDIF.
**********************************************************************
"Übung: Delete
"Löschen Sie den zuvor angelegten Eintrag in der SCUSTOM Tabelle.
*DELETE FROM SCUSTOM WHERE id = 501000.

*
*DELETE FROM SCUSTOM WHERE id = '1345644'.
*IF sy-subrc = 0.
*  WRITE 'Delete Option 2 - Alles hat funktioniert!'.
*ELSE.
*  WRITE 'Delete Option 2 - Das hat nicht geklappt.'.
*ENDIF.


"scounter

*INSERT into SCOUNTER VALUES @( VALUE #(
*                                        carrid = 'AL'
*                                        countnum = '00000999'
*                                        AIRPORT = 'DUC'
*                                        ) ).
*


INSERT INTO SCOUNTER VALUES @( VALUE #(
                                          carrid = 'AA'
                                          AIRPORT = 'DUC'
                                                ) ).

IF SY-SUBRC = 0.
WRITE: 'geht'.
ELSE.
WRITE: 'geht nicht'.
ENDIF.
