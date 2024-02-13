*&---------------------------------------------------------------------*
*& Report z_uebung_datendeklara_21112023
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_uebung_datendeklara_21112023.

DATA: BEGIN OF ls_mitarbeiter,
        persnr  TYPE i,
        name    TYPE String,
        vorname TYPE string,
        Datum   TYPE  sy-datum,
      END OF ls_mitarbeiter,
      lt_mitarbeiter LIKE TABLE OF ls_mitarbeiter.

*ls_mitarbeiter-persnr = 1.
*ls_mitarbeiter-name = 'Maier'.
*ls_mitarbeiter-vorname = 'Tobias'.
*ls_mitarbeiter-datum = sy-datum.
*
*APPEND ls_mitarbeiter TO lt_mitarbeiter.
*
*APPEND VALUE #( persnr = 2 name = 'Müller' vorname = 'Barbara' datum = Sy-datum ) TO lt_mitarbeiter.
*lt_mitarbeiter = VALUE #( BASE lt_mitarbeiter ( name = 'Majoran' vorname = 'Luise' )  ).

ls_mitarbeiter-persnr = 1.
ls_mitarbeiter-name = 'Maier'.
ls_mitarbeiter-vorname = 'Tobias'.
ls_mitarbeiter-datum = sy-datum.

ls_mitarbeiter-persnr = 2.
ls_mitarbeiter-name = 'Meier'.
ls_mitarbeiter-vorname = 'Thomas'.
ls_mitarbeiter-datum = sy-datum.

ls_mitarbeiter-persnr = 3.
ls_mitarbeiter-name = 'Mayer'.
ls_mitarbeiter-vorname = 'Tassilo'.
ls_mitarbeiter-datum = sy-datum.

LOOP AT lt_mitarbeiter ASSIGNING FIELD-SYMBOL(<ls_tabellenzeile>).
ENDLOOP.

" Hier muss ich noch rausfinden warum es nicht ausgegeben wird

cl_demo_output=>display(
data = lt_mitarbeiter ).

TYPES: BEGIN OF str_student,
         nachname(40)    TYPE c,
         studienfach(20) TYPE c,
         Matrikelnummer  TYPE i,
       END OF str_student.
