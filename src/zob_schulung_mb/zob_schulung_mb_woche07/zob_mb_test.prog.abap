*&---------------------------------------------------------------------*
*& Report zob_mb_test
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_mb_test.



"Geben Sie Materialiennamen mit Ihren Komponenten aus.
"Ermitteln Sie hierfür die Stücklisten der Materialien (MAST).
*Selektieren Sie daraufhin die Positionen der Stückliste (STPO).
*Tabellen: MARA, MAKT, MAST, STPO

select from mast
left join mara on mast~matnr = mara~matnr
left join stpo on mast~stlnr = stpo~stlnr
left join makt on mast~matnr = makt~matnr
fields
stpo~stlnr as Stueckliste,
stpo~IDNRK as Komponente,
mara~matnr as Materialnummer,
makt~maktx as Materialname

INTO TABLE @DATA(lt_materialien).
cl_demo_output=>display( lt_materialien ).
