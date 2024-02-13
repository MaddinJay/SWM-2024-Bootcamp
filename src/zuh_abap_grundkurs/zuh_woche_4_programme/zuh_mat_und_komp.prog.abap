*&---------------------------------------------------------------------*
*& Report zuh_mat_und_komp
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_mat_und_komp.

*Geben sie Materialennamen mit ihren Komponeten aus.
*Ermitteln Sie hierfür die Stücklisten der Materialien ( MAST )
*Selektieren sie darauf die Positionen der Stückliste ( STPO ).
*Tabelle Mara, Makt, Mast, STPO

SELECT
 FROM mara
 LEFT JOIN makt
 ON mara~matnr = makt~matnr
 LEFT JOIN mast
 ON mara~matnr = mast~matnr
 LEFT JOIN stpo
 ON mast~stlnr = stpo~stlnr
 FIELDS
 mara~matnr AS Materialnr,
 makt~maktx AS Mat_Name,
 mast~stlnr AS Stueckliste,
 stpo~posnr AS Positionen


 INTO TABLE @DATA(lt_tabelle).

cl_demo_output=>display( lt_tabelle ).
