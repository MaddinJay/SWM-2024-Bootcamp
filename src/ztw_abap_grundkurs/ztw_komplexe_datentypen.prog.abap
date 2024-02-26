*&---------------------------------------------------------------------*
*& Report ZTW_KOMPLEXE_DATENTYPEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZTW_KOMPLEXE_DATENTYPEN.

TYPES: BEGIN OF lty_s_mitarbeiter, "lty_s_mitarbeiter = Anweisung, welche Typen die Tabllenfelder haben sollen"
  pernr   TYPE i,
  vorname TYPE string,
  name    TYPE string,
  alter   TYPE i,
  END OF lty_s_mitarbeiter.

TYPES lty_t_mitarbeiter TYPE STANDARD TABLE OF lty_s_mitarbeiter. "lty_t(Tabelle)_mitarbeiter = Tabelle: lty_s_mitarbeiter"

  DATA gs_mitarbeiter TYPE lty_s_mitarbeiter.
  DATA gt_mitarbeiter TYPE lty_t_mitarbeiter.
  DATA gt_mitarbeiter2 TYPE SORTED TABLE OF lty_s_mitarbeiter WITH UNIQUE KEY pernr. "gt_mitarbeiter2 = Tabellenname"

gs_mitarbeiter-pernr = 2.
  gs_mitarbeiter-vorname = 'Hans'.
  gs_mitarbeiter-name = 'Peter'.
  gs_mitarbeiter-alter = 50.
* APPEND gs_mitarbeiter TO gt_mitarbeiter2.
  INSERT gs_mitarbeiter INTO TABLE gt_mitarbeiter2.
  CLEAR gs_mitarbeiter. "CLEAR = LEERER Datensatz"

gs_mitarbeiter-pernr = 1.
  gs_mitarbeiter-vorname = 'Paul'.
  gs_mitarbeiter-name = 'Müller'.
  gs_mitarbeiter-alter = 23.
*APPEND gs_mitarbeiter TO gt_mitarbeiter2.
    INSERT gs_mitarbeiter INTO TABLE gt_mitarbeiter2.
*  INSERT gs_mitarbeiter INTO gt_mitarbeiter2 INDEX 1.
 CLEAR gs_mitarbeiter.












 READ TABLE gt_mitarbeiter2 INDEX 2 INTO gs_mitarbeiter. "INDEX = Zeile"
 READ TABLE gt_mitarbeiter2 WITH TABLE KEY pernr = 1 INTO gs_mitarbeiter.
 READ TABLE gt_mitarbeiter2 WITH KEY name = 'Peter' INTO gs_mitarbeiter.

 gs_mitarbeiter-pernr = 2.
  gs_mitarbeiter-vorname = 'Hans'.
  gs_mitarbeiter-name = 'Meyer'.
  gs_mitarbeiter-alter = 50.

MODIFY TABLE gt_mitarbeiter2 FROM gs_mitarbeiter. "Wenn Primärschlüssel vorhanden!"
MODIFY gt_mitarbeiter2 FROM gs_mitarbeiter INDEX 2. "Wenn kein Primärschlüssel vorhanden / wenn er nicht verwendet werden soll"

DELETE TABLE gt_mitarbeiter2 FROM gs_mitarbeiter.
DELETE gt_mitarbeiter2 INDEX 2.

  Write: gs_mitarbeiter-vorname, gs_mitarbeiter-name, gs_mitarbeiter-alter.
