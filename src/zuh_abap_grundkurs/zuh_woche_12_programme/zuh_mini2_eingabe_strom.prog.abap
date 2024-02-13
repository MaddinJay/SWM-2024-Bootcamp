*&---------------------------------------------------------------------*
*& Report zuh_mini2_eingabe_strom
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_mini2_eingabe_strom.

*DATA: p_name      TYPE char30,
*      p_vorname   TYPE char30,
*      p_zaehlernr TYPE char10,
*      p_zaehlerst TYPE p DECIMALS 1 LENGTH 7,
*      p_datum     TYPE dats.



*PARAMETERS p_name TYPE char30.
*PARAMETERS p_vname TYPE char30.
*PARAMETERS p_znr TYPE char10.
PARAMETERS p_zst TYPE p DECIMALS 1 LENGTH 7 OBLIGATORY.
PARAMETERS p_datum TYPE dats OBLIGATORY.




Data ls_tabelle type zmul_db_zst.



ls_tabelle-kundennr = 2.
ls_tabelle-zaehlernr = 'DE9005672'.
ls_tabelle-bearb_status = 'F'.

ls_tabelle-zaehlerstand = p_zst.
ls_tabelle-ablesedatum = p_datum.

Modify zmul_db_zst from ls_tabelle.


*cl_demo_output=>display( ls_tabelle ).
