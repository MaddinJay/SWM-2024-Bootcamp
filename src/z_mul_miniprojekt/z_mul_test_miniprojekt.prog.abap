*&---------------------------------------------------------------------*
*& Report z_mul_test_miniprojekt
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_mul_test_miniprojekt.


*Tables: zmul_db_zst.

*Data: ls_struktur type zmul_db_zst,
*      lt_tabelle type table of zmul_db_zst.
*
*Data lv_zst type ZMUL_DE_zst.
*
*Parameters: p_zst type zmul_de_zst,
*            p_datum type zmul_de_abldat.
*
*
*ls_struktur-LFDNR = '0000000002'.
*ls_struktur-zaehlerstand = p_zst.
*ls_struktur-zaehlernr = 'DE90000121'.
*
*insert zmul_db_zst from ls_struktur.


*Data lv_datum type zmul_de_abldat.
*data lv_gw type zmul_de_gwantl.
*
*lv_datum = '20230301'.
*lv_gw = '0.2839'.
*
*
*Perform z_mul_slp using lv_datum lv_gw.
*
*Form z_mul_slp using lv_datum lv_gw.
*
*Data: ls_struktur type zmul_db_slp,
*      lt_tabelle type table of zmul_db_slp.
*
*
*ls_struktur-datum = lv_datum.
*ls_struktur-gewichtung = lv_gw.
*
*modify zmul_db_slp from ls_struktur.
*
*
*Do 30 times.
*
*lv_datum = lv_datum + '1'.
*ls_struktur-datum = lv_datum.
*ls_struktur-gewichtung = lv_gw.
*Append ls_struktur to lt_tabelle.
*modify zmul_db_slp from ls_struktur.
*
*enddo.
*
*
*if sy-subrc = 0.
*
*Write 'passt'.
*
*else. Write 'passt nicht'.
*
*endif.
*
*
*Endform.






***********************************************************************
* Select letzte Zählerstände für KDNr. + letzter Tarif des Kunden
**********************************************************************


 Parameters: p_kdnr type zmul_db_kd-kundennr.


Select Single
From zmul_db_kd
fields
tarif
Where kundennr = @p_kdnr
into @Data(lv_tarif).

DATA: lv_verb TYPE i,
      lv_zeit TYPE i.

SELECT
FROM zmul_db_zst
FIELDS
zaehlerstand,
ablesedatum
WHERE Kundennr = @p_kdnr
ORDER BY ablesedatum DESCENDING
INTO TABLE @DATA(lt_tabelle).


*cl_demo_output=>display( lt_tabelle ).

READ TABLE lt_tabelle INDEX 1 INTO DATA(ls_struktur).
READ TABLE lt_tabelle INDEX 2 INTO DATA(ls_struktur2).


WRITE: 'aktueller Zählerstand:', ls_struktur-zaehlerstand, 'Ablesedatum:', ls_struktur-ablesedatum, /
       'letzter Zählerstand:', ls_struktur2-zaehlerstand, 'Ablesedatum:', ls_struktur2-ablesedatum.

SKIP.

lv_verb = ls_struktur-zaehlerstand - ls_struktur2-zaehlerstand.
lv_zeit = ls_struktur-ablesedatum - ls_struktur2-ablesedatum.

WRITE: |In { lv_zeit } Tagen, hast Du { lv_verb } kWh verbraucht |.

Skip.


**********************************************************************
* Select SLP - ließt den Gewichtungsanteil aus den letzten beiden Ablesungen aus.
**********************************************************************


DATA:  lv_abldat1 type zmul_de_abldat,
      lv_abldat2 type zmul_de_abldat,
      lv_abldat3 type zmul_de_abldat.

lv_abldat1 = ls_struktur-ablesedatum.
lv_abldat2 = ls_struktur2-ablesedatum.




DATA: lv_gwpres TYPE p decimals 3,
      lv_gwfut  TYPE p decimals 3,
      lv_verba type i,
      lv_kosten type p decimals 2.


SELECT SINGLE    "ließt den Prozentualen Anteils des Jahreverbrauchs, anhand der letzten beiden Zst, aus.
FROM zmul_db_slp
FIELDS
SUM( gewichtung ) AS Gewichtungsanteil
WHERE datum <= @lv_abldat1 AND datum >= @lv_abldat2
into @lv_gwpres.





IF lv_gwpres >= 15.

lv_verba = lv_verb * 100 / lv_gwpres.
lv_kosten =  lv_verba * lv_tarif.

Write: / |In { lv_zeit } hast Du zuletzt { lv_verb } kWh verbrauch.|.
Write:   |Der Ablesezeitraum enspricht in Etwa { lv_gwpres }% eines Verbrauchsjahres.|.


Write: / |Wenn Du das Verbrauchsverhalten aus dem letzten Ablesezeitraum beibehältst,|.
write:   |darfst Du mit einem Jahresverbrauch in Höhe von { lv_verba } kWh und Kosten in Höhe von { lv_kosten } Euro rechnen.|.




Write /'Jahreszeitliche Schwankungen sind berücksichtigt'.


Else.   "Wenn der Gewichtungsanteil kleiner als 15% ist, werden die letzen 3 Zählerstände betrachtet.

Uline.
Write: |Zwischen den letzten beiden Abelesungen ist zu wenig Zeit vergangen. Der Anteil am Jahresverbrauch liegt gerade bei { lv_gwpres }%|.
Write: |Wir haben uns deshal erlaubt, einen älteren Zählerstand für Ihre Hochrechnung zu verwenden|.

Uline.

READ TABLE lt_tabelle INDEX 3 INTO DATA(ls_struktur3).



lv_verb = ls_struktur-zaehlerstand - ls_struktur3-zaehlerstand.
lv_zeit = ls_struktur-ablesedatum - ls_struktur3-ablesedatum.

lv_abldat1 = ls_struktur-ablesedatum.
lv_abldat3 = ls_struktur3-ablesedatum.

SELECT SINGLE
FROM zmul_db_slp
FIELDS
SUM( gewichtung ) AS Gewichtungsanteil
WHERE datum <= @lv_abldat1 AND datum >= @lv_abldat3
into @lv_gwfut.

lv_verba = lv_verb * 100 / lv_gwfut.
lv_kosten =  lv_verba * lv_tarif.


Write: / 'VErbrauch', lv_verb, 'Tage', lv_zeit, 'Anteil am Jahresverbrauch', lv_gwfut,'%'.


Write: /, |bei gleichen Verbrauchsverhalten im Ablesezeitraum|.
write:    |darfst Du mit einem Jahresverbrauch in Höhe von { lv_verba }kWh und Kosten in Höhe von { lv_kosten } Euro rechnen|.

Write /'Jahreszeitliche Schwankungen sind berücksichtigt'.



Endif.


**********************************************************************
* Join ... nur zum Spaß
**********************************************************************


Select
From zmul_db_zst
left Join zMul_db_kd on zmul_db_zst~kundennr = zmul_db_kd~kundennr
fields *
Where zmul_db_kd~kundennr = @p_kdnr
Order by zmul_db_zst~ablesedatum DESCENDING
into table @Data(ls_tab).


cl_demo_output=>display( ls_tab ).

**********************************************************************


*Parameters:  lv_von type zmul_de_abldat,
*              lv_bis type zmul_de_abldat .
*
*Select single
*From ZMUL_DB_SLP
*Fields
*Sum( gewichtung ) as Gewichtungsanteil
*Where datum BETWEEN @lv_von and @lv_bis
*Into @lv_gwfut.
*
*write: / lv_von, lv_bis,  lv_gwfut.
