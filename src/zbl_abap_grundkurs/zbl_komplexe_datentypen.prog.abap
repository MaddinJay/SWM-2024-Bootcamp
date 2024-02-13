*&---------------------------------------------------------------------*
*& Report ZBL_KOMPLEXE_DATENTYPEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbl_komplexe_datentypen.


TYPES: BEGIN OF lty_s_mitarbeiter,
         pernr   TYPE i,
         vorname TYPE string,
         name    TYPE string,
         alter   TYPE i,
       END OF lty_s_mitarbeiter.
TYPES lty_t_mitarbeiter TYPE STANDARD TABLE OF lty_s_mitarbeiter.

DATA gs_mitarbeiter TYPE lty_s_mitarbeiter.
*  DATA gt_mitarbeiter TYPE lty_t_mitarbeiter.
DATA gt_mitarbeiter2 TYPE SORTED TABLE OF lty_s_mitarbeiter WITH UNIQUE KEY pernr.

gs_mitarbeiter-pernr = 1.
gs_mitarbeiter-vorname = 'Hans'.
gs_mitarbeiter-name = 'Peter'.
gs_mitarbeiter-alter = 50.
APPEND gs_mitarbeiter TO gt_mitarbeiter2.

CLEAR gs_mitarbeiter.
gs_mitarbeiter-pernr = 2.
gs_mitarbeiter-vorname = 'Paul'.
gs_mitarbeiter-name = 'Müller'.
gs_mitarbeiter-alter = 23.
APPEND gs_mitarbeiter TO gt_mitarbeiter2.
