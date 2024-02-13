
*&---------------------------------------------------------------------*
*& Report zob_mb_schulung_car
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_mb_schulung_car.


PARAMETERS: p_marke  TYPE string, "Usereingabe für Abruf Auto
            p_modell TYPE string,
            p_jahr   TYPE n LENGTH 4,
            p_kms    TYPE n LENGTH 6,
            p_owner  TYPE string, "Ergänzung für den Abruf Eigentümer
            p_adres  TYPE char35,
            p_fnr    TYPE string.



START-OF-SELECTION.

  DATA gv_car TYPE REF TO zob2_cl_check_car.
  zmb_lcl_car=>hinzufuegen( EXPORTING iv_marke = p_marke iv_modell = p_modell iv_jahr = p_jahr iv_km = p_kms ). "Aufruf der Methode Abruf Kunde

  zmb_lcl_car=>hinzufuegen_O( EXPORTING iv_owner = p_owner iv_adres = p_adres iv_model = p_modell iv_fahrgestellnr = p_fnr iv_kmseitservice = 0 ). " Aufruf der Methode Abruf Besitzer

  CREATE OBJECT gv_car EXPORTING iv_name = p_owner.

*  gv_car->autopruefen( iv_name = p_owner ).
*  zob2_cl_check_car->

  gv_car->autopruefen( EXPORTING iv_name = p_owner ).
  gv_car->reparieren( ).

END-OF-SELECTION.
