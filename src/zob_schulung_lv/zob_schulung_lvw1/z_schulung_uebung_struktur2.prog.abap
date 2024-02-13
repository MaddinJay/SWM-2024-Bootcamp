*&---------------------------------------------------------------------*
*& Report z_schulung_uebung_struktur2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_schulung_uebung_struktur2.

TYPES: BEGIN OF str_ty_student,
         name  TYPE string,
         alter TYPE i,
         id    TYPE i,
       END OF str_ty_student,
       tab_ty_student TYPE TABLE OF str_ty_student WITH KEY id.

DATA: gs_student TYPE str_ty_student,
      gt_student TYPE tab_ty_student.

gs_student-name = 'paul'.
gs_student-alter = 2.
gs_student-id = 1.
INSERT gs_student INTO TABLE gt_student.
CLEAR gt_student.

gs_student-name = 'hans'.
gs_student-alter = 4.
gs_student-id = 2.
INSERT gs_student INTO TABLE gt_student.
CLEAR gt_student.

gs_student-name = 'bernd'.
gs_student-alter = 67.
gs_student-id = 3.
INSERT gs_student INTO TABLE gt_student.
CLEAR gt_student.

gs_student-name = 'Raul'.
gs_student-alter = 43.
gs_student-id = 4.
INSERT gs_student INTO TABLE gt_student.
CLEAR gt_student.

LOOP AT gt_student INTO gs_student.
  WRITE: / gs_student-name,
         / gs_student-alter,
         / gs_student-id.
  CLEAR gs_student.
ENDLOOP.
