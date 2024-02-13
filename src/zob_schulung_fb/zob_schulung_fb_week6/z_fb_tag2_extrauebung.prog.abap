*&---------------------------------------------------------------------*
*& Report z_fb_tag2_extrauebung
*&---------------------------------------------------------------------*
*& ABAP Dictionary - Übungen
*&---------------------------------------------------------------------*

* Aufgabe:
* Befüllen Sie die beiden Tabellen mit Datensätzen.
* Mindestens ein Auto-Datensatz sollte mit einem Besitzer-Datensatz verknüpft sein.
* Lassen Sie sich die verknüpften Tabelleninhalte über einen Report ausgeben,
* dabei sollen nur Autos angezeigt werden, die auch einen Besitzer haben.

REPORT z_fb_tag2_extrauebung.

*** LÖSUNG 1 ****

TABLES: ZOBFB_T_CAR_002, ZOBFB_T_OWNER002.

*SELECT db_car~brand,
*       db_car~model,
*       db_car~caryear,
*       db_aowner~owner_name
*     FROM ZOBFB_T_CAR_002 AS db_car
*     LEFT JOIN ZOBFB_T_OWNER002 AS db_aowner
*     ON db_car~brand = db_aowner~brand
*     and db_car~model = db_aowner~model
*
*WHERE db_aowner~owner_name IS NOT NULL
*GROUP BY db_car~brand, db_car~model, db_car~caryear, db_aowner~owner_name
*INTO TABLE @DATA(lt_auto).
*
*cl_demo_output=>display( lt_auto ).


*** LÖSUNG 2 ***

*SELECT FROM ztw_t_owner
*RIGHT JOIN ztw_t_car
*ON ztw_t_car~brand = ztw_t_owner~brand
*AND 2. verbindung
*fields
*ztw_t_owner~name as Name,
*ztw_t_owner~adress as Adresse,
*ztw_t_car~brand as Marke,
*ztw_t_car~model as Model,
*ztw_t_car~prodyear as Herstellungsjahr
*WHERE ztw_t_owner~brand IS NOT INITIAL
*INTO TABLE @DATA(gt_car).
*
******** "Where ztw_owner_name = abap_true.
*
*cl_demo_output=>display( gt_car ).

SELECT FROM ZOBFB_T_OWNER002
RIGHT JOIN ZOBFB_T_CAR_002
ON ZOBFB_T_CAR_002~brand = ZOBFB_T_OWNER002~brand
AND ZOBFB_T_CAR_002~model = ZOBFB_T_OWNER002~model
fields
ZOBFB_T_OWNER002~owner_name as Name,
ZOBFB_T_OWNER002~owner_adress as Adresse,
ZOBFB_T_CAR_002~brand as Marke,
ZOBFB_T_CAR_002~model as Model,
ZOBFB_T_CAR_002~caryear as Herstellungsjahr
WHERE ZOBFB_T_OWNER002~owner_name IS NOT INITIAL
INTO TABLE @DATA(gt_car).

******* "Where ztw_owner_name = abap_true.

cl_demo_output=>display( gt_car ).
