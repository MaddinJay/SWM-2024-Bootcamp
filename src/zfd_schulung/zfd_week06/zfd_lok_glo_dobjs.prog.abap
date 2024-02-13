*&---------------------------------------------------------------------*
*& Report zfd_lok_glo_dobjs
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_lok_glo_dobjs.

TYPES: BEGIN OF ty_person,
         id   TYPE i,
         name TYPE string,
         age  TYPE i,

       END OF ty_person.

DATA ls_person TYPE ty_person.
DATA gs_person2 TYPE zfd_st_person.
DATA lt_person TYPE STANDARD TABLE OF ty_person.
DATA gt_person2 TYPE STANDARD TABLE OF zfd_tt_person.

ls_person-id = 1.
ls_person-name = 'Huber'.
ls_person-age = 30.
APPEND ls_person TO lt_person.

ls_person-id = 2.
ls_person-name = 'Heger'.
ls_person-age = 31.
APPEND ls_person TO lt_person.

gs_person2-id = 3.
gs_person2-name = 'Tafelmayer'.
gs_person2-age = 32.
insert zfd_tperson from gs_person2.
IF sy-subrc = 0.
  WRITE: / 'Daten über global erfolgreich eingefügt'.
ELSE.
  WRITE: / 'Fehler beim Einfügen der Daten'.
ENDIF.

CLEAR ls_person.
CLEAR gs_person2.

LOOP AT lt_person INTO ls_person.
  INSERT zfd_tperson FROM ls_person.
  IF sy-subrc = 0.
  WRITE: / 'Daten über lokal erfolgreich eingefügt'.
ELSE.
  WRITE: / 'Fehler beim Einfügen der Daten'.
ENDIF.
ENDLOOP.


*zfd_st_person-id = 4.
*ls_person-name = 'Tomuscheit'.
*ls_person-age = 33.
*APPEND ls_person TO lt_person.
*
*ls_person-id = 5.
*ls_person-name = 'Meier'.
*ls_person-age = 40.
*APPEND ls_person TO lt_person.
