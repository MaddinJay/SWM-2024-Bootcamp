*&---------------------------------------------------------------------*
*& Report ZEM_TBL
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZEM_TBL.

TYPES: BEGIN OF lty_plattensammlung, "Struktur definieren

         interpret(20) TYPE c,
         album(20)     TYPE c,
         label(20)     TYPE c,
         ErschDatum    Type d,

       END OF lty_plattensammlung.

TYPES lsy_t_plattensammlung type table of lty_plattensammlung.

DATA gs_plattensammlung TYPE lty_plattensammlung.
*Data gt_plattensammlung type SORTED TABLE OF lty_plattensammlung WITH UNIQUE KEY label.
Data gt_plattensammlung TYPE lsy_t_plattensammlung.

gs_plattensammlung-interpret = 'John Coltrane'.
gs_plattensammlung-album     = 'A Love Supreme'.
gs_plattensammlung-label     = 'Impulse'.
gs_plattensammlung-erschDatum = '19640101'.
APPEND gs_plattensammlung to gt_plattensammlung.
*Insert gs_plattensammlung INTO TABLE gt_plattensammlung.
CLEAR gs_plattensammlung.

gs_plattensammlung-interpret = 'Thelonious Monk'.
gs_plattensammlung-album     = 'Monk´s Dream'.
gs_plattensammlung-label     = 'Columbia'.
gs_plattensammlung-erschDatum = '19710101'.
APPEND gs_plattensammlung to gt_plattensammlung.
*Insert gs_plattensammlung INTO TABLE gt_plattensammlung.
CLEAR gs_plattensammlung.

gs_plattensammlung-interpret = 'Miles Davis'.
gs_plattensammlung-album     = 'So What'.
gs_plattensammlung-label     = 'Columbia'.
gs_plattensammlung-erschDatum = '19620101'.
APPEND gs_plattensammlung to gt_plattensammlung.
*Insert gs_plattensammlung INTO TABLE gt_plattensammlung.


*READ Table gt_plattensammlung WITH TABLE KEY label = 'Impulse' INTO gs_plattensammlung.

*DELETE gt_plattensammlung INDEX 'Impulse'.

Write: gs_plattensammlung-interpret, gs_plattensammlung-album, gs_plattensammlung-label, gs_plattensammlung-ErschDatum.
