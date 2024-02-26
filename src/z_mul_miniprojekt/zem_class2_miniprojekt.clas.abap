CLASS zem_class2_miniprojekt DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.

Methods: anzeige_aktueller_verbrauch importing ip_kdnr type zmul_de_kdnr
                                     RETURNING VALUE(rv_ist_verb) type zmul_de_zst.


Data mv_kdnr type zmul_de_kdnr.

Methods: ermittlung_gesamtverbrauch Exporting rv_jahr      type i
                                              rv_jahr_verb type i.



  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zem_class2_miniprojekt IMPLEMENTATION.


  METHOD anzeige_aktueller_verbrauch.  """"""""""""""""""""""""""""


mv_kdnr = ip_kdnr.


  DATA: lv_verb TYPE i,
      lv_verb3 type i,
      lv_zeit TYPE i,
      lv_zeit3 TYPE i.

SELECT
FROM zmul_db_zst
FIELDS
zaehlerstand,
ablesedatum,
bearb_status,
ist_verbrauch
WHERE Kundennr = @mv_kdnr
ORDER BY ablesedatum DESCENDING
INTO TABLE @DATA(lt_tabelle).


READ TABLE lt_tabelle INDEX 1 INTO DATA(ls_struktur).
READ TABLE lt_tabelle INDEX 2 INTO DATA(ls_struktur2).
READ TABLE lt_tabelle INDEX 3 INTO DATA(ls_struktur3).

lv_verb = ls_struktur-zaehlerstand - ls_struktur2-zaehlerstand.
lv_zeit = ls_struktur-ablesedatum - ls_struktur2-ablesedatum.

lv_verb3 = ls_struktur-zaehlerstand - ls_struktur3-zaehlerstand.
lv_zeit3 = ls_struktur-ablesedatum - ls_struktur3-ablesedatum.

Uline.

*If ls_struktur-bearb_status = 'P'.
Data(g_graphics) = icon_graphics.

Write: / '@SK@'.
Write:   |Verbrauch aus den letzten zwei gespeicherten Ableseergebnissen:|.
Uline.

WRITE: |Aktueller Zählerstand: { ls_struktur-zaehlerstand } kWh // Ablesedatum: { ls_struktur-ablesedatum }|, /.
WRite: |Letzter Zählerstand  : { ls_struktur2-zaehlerstand } kWh // Ablesedatum: { ls_struktur2-ablesedatum }|, /.

WRITE: |= { lv_verb } kWh in { lv_zeit } Tagen|.

rv_ist_verb = lv_verb.


Select Single
From zmul_db_kd
fields
tarif
Where kundennr = @mv_kdnr
into @Data(lv_tarif).

DATA:  lv_abldat1 type zmul_de_abldat,
      lv_abldat2 type zmul_de_abldat,
      lv_abldat3 type zmul_de_abldat.

lv_abldat1 = ls_struktur-ablesedatum.
lv_abldat2 = ls_struktur2-ablesedatum.


DATA: lv_gwpres TYPE p decimals 3,
      lv_gwfut  TYPE p decimals 3,
      lv_verba type i,
      lv_verbm type i,
      lv_kosten type p decimals 2,
      lv_kosten_monat type p decimals 2.


SELECT SINGLE    "ließt den Prozentualen Anteils des Jahreverbrauchs, anhand der letzten beiden Zst, aus.
FROM zmul_db_slp
FIELDS
SUM( gewichtung ) AS Gewichtungsanteil
WHERE datum <= @lv_abldat1 AND datum >= @lv_abldat2
into @lv_gwpres.



lv_verba = lv_verb * 100 / lv_gwpres.
lv_kosten =  lv_verba * lv_tarif.

lv_kosten_monat = lv_kosten / 12.
lv_verbm = lv_verba / 12.


Write:   |(Gewichtungsanteil: { lv_gwpres }%)|. Skip.

uline.
Write: /  '@0M@'.
write:   |Hochgerechneter Verbrauch (Basis: angegebener Ablesezeitraum:) |. Uline.
Write: / |Jahr: { lv_verba } kWh |.
Write: / |Monat: { lv_verbm } kWh|. Skip.
Uline.


Write:  / '@3H@'.
Write:    |Kosten lt. Hochrechnung: |. Uline.
Write:  / |Kosten (Jahr): { lv_kosten } Euro (brutto) |.
Write: /  |Kosten (Monat): { lv_kosten_monat } Euro (brutto)|. Skip.
Write:    |Aktueller Arbeitspreis: { lv_tarif } Euro/kWh (brutto)|. Skip.



*Data: Begin of ls_s,
*      Tage type i,
*      Verbrauch type i,
*      Aktueller_ZST type zmul_de_zst,
*      Alter_Zst type zmul_de_zst,
*      End of ls_s.
*
*Data lt_tverb like table of ls_s.
*
*ls_s-tage          = lv_zeit.
*ls_s-verbrauch     = lv_verb.
*ls_s-alter_zst     = ls_struktur2-zaehlerstand.
*ls_s-aktueller_zst = ls_struktur-zaehlerstand.
*
*Append ls_s to lt_tverb.
*
*cl_demo_output=>display( lt_tverb ).


  ENDMETHOD.

  METHOD ermittlung_gesamtverbrauch. """""""""""""""""""""""""""""""

Select
From zmul_db_zst
Fields
Min( zaehlerstand ) as kleinster_zaehlerstand,
max( zaehlerstand ) as hoechster_zaehlerstand,
Min( ablesedatum ) as aeltestes_AblDatum,
Max( ablesedatum ) as neuestes_AblDatum

Where kundennr = @mv_kdnr
Into @Data(ls_minmax).

Data lv_ges_verb type i.
Data lv_ges_zeit type i.
Data lv_verb_jahr type i.
Data lv_verb_gw type zmul_de_gwantl.
Data lv_tag type i.
Data lv_monat type i.
Data lv_jahr type i.

lv_ges_verb = ls_minmax-hoechster_zaehlerstand - ls_minmax-kleinster_zaehlerstand.
lv_ges_zeit = ls_minmax-neuestes_abldatum - ls_minmax-aeltestes_abldatum.

lv_tag = lv_ges_verb / lv_ges_zeit.
lv_monat = lv_tag * 30.
lv_jahr = lv_tag * 365.

rv_jahr = lv_jahr.
*Uline.
*Write: |Geschätzter Durchschnittsverbrauch nach Zählerstandseingabe:|.
*Uline.
*
*Write: |Jahresverbrauch: { lv_jahr } kWh/Jahr|.
*Write: |Monatsverbrauch: ca. { lv_monat } kWh/Monat|.
*Write: |Tagesverbrauch : ca. { lv_tag } kWh/Tag|. Skip.



****************Gesamtverbrauch und Tage im Vertragszeitraum
**********************************************************************
*************** Gewichtungsanteil vor der Ablesung

Data lv_von type dats.
data lv_bis type dats.
Data lv_tag_verb type p.
Data lv_jahr_verb type p.
Data lv_monat_verb type p.

Data lv_verb type p.




SELECT
FROM zmul_db_zst
FIELDS
zaehlerstand,
ablesedatum,
bearb_status
WHERE Kundennr = @mv_kdnr
ORDER BY ablesedatum DESCENDING
INTO TABLE @DATA(lt_tabelle).

REad Table lt_tabelle index 2 into Data(ls_s).

lv_von = ls_minmax-aeltestes_abldatum.
lv_bis = ls_s-ablesedatum.

lv_verb = ls_s-zaehlerstand - ls_minmax-kleinster_zaehlerstand.


SELECT    "ließt den Prozentualen Anteils des Jahreverbrauchs, anhand der letzten beiden Zst, aus.
FROM zmul_db_slp
FIELDS
SUM( gewichtung ) AS Gewichtungsanteil
WHERE datum BETWEEN @lv_von AND @ls_s-ablesedatum
into @lv_verb_gw.


lv_jahr_verb = lv_verb * 100 / lv_verb_gw.
lv_tag_verb = lv_jahr_verb / 365.
lv_monat_verb = lv_tag_verb * 30.


*Uline.
*Write: |Geschätzter Durchschnittsverbrauch vor Zählerstandseingabe:|.
*Uline.
*Write: |Jahr:  { lv_jahr_verb } kWh/365 Tage |.
*Write: |Monat: { lv_monat_verb } kWh/Monat|.
*Write: |Tag:   { lv_tag_verb } kWh/Tag|. Skip.
*
*
rv_jahr_verb = lv_jahr_verb.



  ENDMETHOD.


ENDCLASS.
