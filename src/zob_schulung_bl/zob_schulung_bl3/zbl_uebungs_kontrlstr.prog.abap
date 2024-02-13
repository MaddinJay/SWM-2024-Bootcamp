*&---------------------------------------------------------------------*
*& Report zbl_uebungs_kontrlstr
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbl_uebungs_kontrlstr.

DATA(lv_num) = 1.

WHILE lv_num <= 100.
  IF lv_num MOD 3 = 0.
    WRITE:/ lv_num.
  ENDIF.
  lv_num = lv_num + 1.
ENDWHILE.

"DATA: lv_zahl TYPE i LENGTH 3.

types: ty_integer3 TYPE int1.


"TYPES: BEGIN OF ty_teilnehmer,
 "id TYPE i,
 "Vorname TYPE string,
 "Nachname_initial TYPE c LENGTH 1,
 "age TYPE i,
 "softskills TYPE string,
"END OF ty_teilnehmer.
"DATA: wa_teilnehmer TYPE ty_teilnehmer.

"wa_teilnehmer-id = 1.
"wa_teilnehmer-vorname = 'Bernd'.
"wa_teilnehmer-Nachname_initial = 'L'.
"wa_teilnehmer-age = 27.
"wa_teilnehmer-softskills = 'Teamwork, Kommunikation, Problemlösung'.
"APPEND wa_teilnehmer TO ty_teilnehmer.

"WRITE: / 'ID:', wa_teilnehmer-id,
 "     / 'Vorname:', wa_teilnehmer-vorname,
"      / 'Erster Buchstabe des Nachnamens:', wa_teilnehmer-Nachname_initial,
"      / 'Alter:', wa_teilnehmer-age,
"      / 'Softskills:', wa_teilnehmer-softskills.

"wa_teilnehmer-id = 2.
"wa_teilnehmer-vorname = 'Franz'.
"wa_teilnehmer-Nachname_initial = 'M'.
"wa_teilnehmer-age = 27.
"wa_teilnehmer-softskills = 'Keine'.
"
"WRITE: / 'ID:', wa_teilnehmer-id,
"      / 'Vorname:', wa_teilnehmer-vorname,
"      / 'Erster Buchstabe des Nachnamens:', wa_teilnehmer-Nachname_initial,
"      / 'Alter:', wa_teilnehmer-age,
 "     / 'Softskills:', wa_teilnehmer-softskills.




      DATA: BEGIN OF ls_teilnehmer,
            id TYPE ty_integer3,
            vorname type string,
            nachname type c LENGTH 1,
            alter type i,
            softskills type string,
            END OF LS_TEILNEHMER.

            ls_teilnehmer-id = '1'.
            ls_teilnehmer-vorname = 'Gerald'.
            ls_teilnehmer-nachname = 'H'.
            ls_teilnehmer-alter = '30'.
            ls_teilnehmer-softskills = 'arbeitet schnell'.
