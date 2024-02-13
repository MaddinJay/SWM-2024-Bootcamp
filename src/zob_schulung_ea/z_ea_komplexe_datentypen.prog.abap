*&---------------------------------------------------------------------*
*& Report Z_EA_KOMPLEXE_DATENTYPEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z_EA_KOMPLEXE_DATENTYPEN.
**********************************************************************
* Strukturen und Strukturtypen, interne Tabellen und Tabellentypen.
**********************************************************************

TYPES: BEGIN OF lty_s_mitarbeiter, "lty_s_ bedeutet lokaler Typ undzwar eine Struktur."
      vorname TYPE string,
      name    TYPE string,
      alter   TYPE i,
 END OF lty_s_mitarbeiter.

 TYPES lty_t_mitarbeiter TYPE TABLE OF lty_s_mitarbeiter. "Hier definieren wir eine Tabelle, nämlich eine Tabelle aus Mitarbeitern der oben bereits drfinierten Struktur"

 DATA gs_mitarbeiter TYPE lty_s_mitarbeiter. "Datendeklaration unseres Mitarbeiter Typ gs(globaleStruktur auf unseren erstellen lokalen Strukturtypen"
 DATA gt_mitarbeiter TYPE lty_t_mitarbeiter. "Verwendung der Tabelle auf gt_mitarbeiter = GlobaleTabelle"
 "DATA gt_mitarbeiter TYPE TABLE OF lty_s_mitarbeiter - dies würde genauso funktionieren, somit müsste man weiter oben den Tabellentypen nicht extra definieren"


 gs_mitarbeiter-vorname = 'Hans'.
 gs_mitarbeiter-name    = 'Peter'.
 gs_mitarbeiter-alter   = 50.
 APPEND gs_mitarbeiter TO gt_mitarbeiter. "APPEND - Anhaängen des Datensatztes an die Tabelle"
 CLEAR gs_mitarbeiter. "CLEAR-Befehl: effizienterers Programmieren, löscht einmal die Daten aus gs_MA., um dannach wieder die weiteren rein zu bekommen, werden dennoch beide bei Tabelle ausgegeben"

 gs_mitarbeiter-vorname = 'Paul'.
 gs_mitarbeiter-name    = 'Müller'.
 gs_mitarbeiter-alter   = 23.
 APPEND gs_mitarbeiter TO gt_mitarbeiter.



 WRITE: gs_mitarbeiter-vorname, gs_mitarbeiter-name, gs_mitarbeiter-alter.
