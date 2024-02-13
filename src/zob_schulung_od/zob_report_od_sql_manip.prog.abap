*&---------------------------------------------------------------------*
*& Report zob_report_od_sql_manip
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_report_od_sql_manip.

*DATA(ls_custom_insert) = VALUE scustom(
*id = 6666
*name = 'Orlando'
*form = 'Herr'
*street = 'calle 13'
*postbox = '80000'
*postcode = '81927'
*city = 'Minga'
*country = 'DE'
*region = 'BY'
*).
*INSERT INTO SCUSTOM VALUES ls_custom_insert.
*if sy-subrc = 0.
*WRITE 'OK'.
*ELSE.
*WRITE 'NICHT OK'.
*ENDIF.

***********************************************************************
* VERSUCH MAX ID +1
***********************************************************************
select
max( id ) as id from scustom INTO @data(lv_id).
lv_id  = lv_id + 1.

DATA(ls_custom_insert) = VALUE scustom(
id = lv_id
name = 'Orlando'
form = 'Herr'
street = 'calle 13'
postbox = '80000'
postcode = '81927'
city = 'Minga'
country = 'DE'
region = 'BY'
).
INSERT INTO SCUSTOM VALUES ls_custom_insert.
if sy-subrc = 0.
WRITE 'OK'.
ELSE.
WRITE 'NICHT OK'.
ENDIF.

*UPDATE scustom  set TELEPHONE ='100009999999', EMAIL ='web@mail.com' where ID = 6666.
*
*if sy-subrc = 0.
*WRITE 'Änderung OK'.
*ELSE.
*WRITE 'Änderung nicht erfolgt'.
*ENDIF.
*STRAVELAG

*DELETE FROM SCUSTOM WHERE POSTCODE = 81927 AND POSTBOX = 80000. "funktioniert nicht
*DELETE FROM SCUSTOM WHERE ID iN ( 6666 ).

*if sy-subrc = 0.
*WRITE 'löschen OK'.
*ELSE.
*WRITE 'löschen nicht erfolgt'.
*ENDIF.

*INSERT 2

*DATA(ls_stravelag_insert) = VALUE STRAVELAG(
*AGENCYNUM = 9999
*NAME = 'ECUATOURS'
*STREET = 'STRASSE 99'
*POSTBOX = 90909
*POSTCODE = 33333
*CITY = 'MINGA'
*COUNTRY ='EC'
*REGION = 'BB'
*).
*INSERT INTO STRAVELAG VALUES ls_stravelag_insert.
*if sy-subrc = 0.
*WRITE 'INSERT OK'.
*ELSE.
*WRITE 'INSERT NICHT OK'.
*ENDIF.
