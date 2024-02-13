*&---------------------------------------------------------------------*
*& Report zob_uebung_tabellen_befuellen
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_uebung_tabellen_befuellen.


DATA(ls_insert) = VALUE scustom(
                                  id = 5565
                                  name     = 'ELvin Alioski'
                                  form     = 'Herr'
                                  street   = 'Musterstraße'
                                  postbox  = '25'
                                  postcode = '80000'
                                  city     = 'Munich'
                                  country  = 'Deutschland'
                                  region   = 'Bayern').

*INSERT SCUSTOM FROM ls_insert.


IF sy-subrc = 0.
   WRITE 'UZ UZ UZ'.
ELSE.
   WRITE 'ZNACI , KURCINA'.
ENDIF.

UPDATE scustom SET
       telephone = '333-5679-1'
       custtype = 'B'
       discount = '000'
       langu = 'D'
       email = 'mail@mail.com'
       webuser = ' '
       WHERE id = 5565.

IF sy-subrc = 0.
    WRITE / 'UZ UZ UZ'.
ELSE.
    WRITE / 'ZNACI , KURCINA'.
ENDIF.


*DELETE FROM SCUSTOM WHERE ID = 5565.

IF sy-subrc = 0.
   WRITE / 'UZ UZ UZ'.
ELSE.
   WRITE / 'ZANCI, KURCINA'.
ENDIF.



*STRAVELAG Tabelle, Beitrag anlegen, ändern, löschen.
*SCOUNTER



DATA(ls_insert2) = VALUE stravelag(
                                  AGENCYNUM = 6000
                                  NAME      = 'ELvin Alioski'
                                  STREET    = 'EMMY-NOETHER-STRASSE 2'
                                  POSTBOX   = '15 02 66'
                                  POSTCODE  = '80992'
                                  CITY      = 'München'
                                  COUNTRY   = 'Deutschland'
                                  REGION    = 'Bayern'
                                  TELEPHONE = '0173-9985441'
                                  URL       = 'www.Alioski.de'
                                  LANGU     = 'D'
                                  CURRENCY  = 'E').
INSERT STRAVELAG FROM ls_insert2.

IF sy-subrc = 0.
   WRITE / 'UZ UZ UZ'.
ELSE.
    WRITE / 'znaci, Kurcina'.
ENDIF.
