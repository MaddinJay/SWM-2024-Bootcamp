*&---------------------------------------------------------------------*
*& Report z_schulung_uebung_tabelle
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_schulung_uebung_tabelle.

"strukturtyp definieren

TYPES: BEGIN OF strty_studenten,
         name           TYPE string,
         vorname        TYPE string,
         martikelnr(10) TYPE c,
         studienfach    TYPE string,
         semester(2)    TYPE c,
         abschluss      TYPE string,
       END OF strty_studenten,
       ttyp_studenten TYPE TABLE OF strty_studenten WITH KEY martikelnr. "tabellentyp type table of strukturtyp

DATA: lt_studenten TYPE TABLE OF strty_studenten,
      gt_studenten type ttyp_studenten. " zur struktur eine interne tabelle erstellen definiert

"struktur definieren globale struktur
DATA: gs_studenten TYPE strty_studenten.

"befüllen der struktur
gs_studenten-name = 'mueller'.
gs_studenten-vorname = 'alex'.
gs_studenten-martikelnr = '3456099'.
gs_studenten-studienfach = 'baum'.
gs_studenten-semester = 3.
gs_studenten-abschluss = 'M.A.'.
"jetzt eine tabelle einfügen/ weil wir ein schlüsselfeld haben, eher insert statt append (man könnten die nummern manuell hochziehen, aber kann zu fehler führen)
INSERT gs_studenten INTO TABLE gt_studenten. "automatisch eingeordnet
CLEAR gs_studenten.

"befüllen der struktur
gs_studenten-name = 'muerveller2'.
gs_studenten-vorname = 'alesdx2'.
gs_studenten-martikelnr = '34560993'.
gs_studenten-studienfach = 'baxdum4'.
gs_studenten-semester = 4.
gs_studenten-abschluss = 'M.A.'.
"jetzt eine tabelle einfügen/ weil wir ein schlüsselfeld haben, eher insert statt append (man könnten die nummern manuell hochziehen, aber kann zu fehler führen)
INSERT gs_studenten INTO TABLE gt_studenten. "automatisch eingeordnet
CLEAR gs_studenten.

"befüllen der struktur
gs_studenten-name = 'qweueller3e'.
gs_studenten-vorname = 'aqwerlex3e'.
gs_studenten-martikelnr = '34560993'.
gs_studenten-studienfach = 'bare um3e'.
gs_studenten-semester = 2.
gs_studenten-abschluss = 'M.A.'.
"jetzt eine tabelle einfügen/ weil wir ein schlüsselfeld haben, eher insert statt append (man könnten die nummern manuell hochziehen, aber kann zu fehler führen)
INSERT gs_studenten INTO TABLE gt_studenten. "automatisch eingeordnet
CLEAR gs_studenten.

"index 2 löschen
*DELETE gt_studenten WHERE martikelnr = 2.

"loop tabelleninhalt ausgabe
LOOP AT gt_studenten INTO gs_studenten.
WRITE: / 'name: ' , gs_studenten-name,
       / 'vorname: ' , gs_studenten-vorname,
       / 'martikelnr: ' , gs_studenten-martikelnr,
       / 'studienfach: ' , gs_studenten-studienfach,
       / 'semster: ' , gs_studenten-semester,
       / 'abschluss: ' , gs_studenten-abschluss.
*       INSERT gt_studenten.
     CLEAR gs_studenten.
ENDLOOP.


"ausgabe globale struktur:


APPEND VALUE #( name = 'peter'
         vorname = 'hans'
         martikelnr = 0000123456
         studienfach = 'informatik'
         semester = 2
         abschluss = 'M.A.'
) TO lt_studenten.




APPEND VALUE #( name = 'klaus'
                vorname = 'matthias'
                martikelnr = 189327409123
                studienfach = 'bwl'
                semester = 10
                abschluss = 'B.A.'
               ) TO lt_studenten.

cl_demo_output=>display( lt_studenten ).
cl_demo_output=>display( gt_studenten ).
