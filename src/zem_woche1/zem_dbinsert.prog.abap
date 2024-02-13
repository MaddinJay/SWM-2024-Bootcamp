*&---------------------------------------------------------------------*
*& Report zem_dbinsert
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_dbinsert.


**********************************************************************
* Tabelle : SAIRPORT

*Datensatz hinzufügen ---- Insert

*Schlüsselfeld nicht vergessen


*Inlinedeklaration
*
*Data(ls_struktur) = VALUE sairport(
*                  name = 'Wunderland'
*                  id = 'PP' ) .
*
* Insert sairport from ls_struktur.
*
* If sy-subrc = 0.
*
* Write: '+'.
* Else. Write '-'.
*
* endif.

**********************************************************************
*das gleiche wie oben
* Separate Deklaration

*
* Data: ls_struktur2 type sairport.
*
*       ls_struktur2 = VALUE #(
*                name = 'Tartarus'
*                   id = 'ZZ') .
*
* Insert sairport from ls_struktur2.
*
*  If sy-subrc = 0.
*
* Write: '++'.
* Else. Write '--'.
*
* endif.

**********************************************************************

*Update.... ergänzt einen bestehenden Datensatz

*Update sairport set id = 'AA'  where id = ' '.
*
*
*If sy-subrc = 0.
*Write '++'.
*Else. Write '--'.
*
*endif.
*
*Update sairport set TIME_ZONE = 'UTC-7' where id = 'AA'.
*
**If sy-subrc = 0.
**Write '+++'.
**Else. Write '---n'.
**
**endif.
*
**Oder...Wertezuweisung über Update und VALUE löscht alle felder die nicht genannt werden
*
*Data(ls_struktur3) = VALUE sairport(
*                    id = 'AA'
*                    name = 'styx'  ) .
*
* Update sairport from ls_struktur3.
*
**If sy-subrc = 0.
**Write '+++'.
**Else. Write '---n'.
**
**endif.


**********************************************************************
*Delete

*Delete from sairport where id = 1.
*
*If sy-subrc = 0.
*Write '+++'.
*Else. Write '---n'.
*
*endif.

*DATA ls_struktur TYPE sairport.
*ls_struktur-id = '1'.                    "Wenn 1 als Zahl eingegeben. Muss es auch als Zahl gelöscht werden.
*DELETE scarr FROM ls_struktur.


*If sy-subrc = 0.
*Write '+++'.
*Else. Write '---n'.
*
*endif.

**********************************************************************

*Übung Delete update insert in Tabellen SCOUNTER und STRAVELAG

*Data(ls_struktur4) = VALUE stravelag(
*                      agencynum = 425
*                      name = 'Freddy Krueger'
*                      region = 'From Hell'
*                      country = 'From Hell') .
*
* Update stravelag from ls_struktur4.
*
* if sy-subrc = 0.
* Write 'jo'.
* Else. Write 'no'.
* endif.


 Data ls_struktur5 type scounter.

 ls_struktur5 = Value #( carrid = 'ZJ'
                         countnum = 69
                         airport = 'Schnarchzapfen').

Update scounter from ls_struktur5.

 If sy-subrc = 0.
 Write 'passt'.
 Else. Write 'schau noch mal'.
 Endif.
