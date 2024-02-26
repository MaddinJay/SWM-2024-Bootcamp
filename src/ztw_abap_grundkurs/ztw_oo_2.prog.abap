*&---------------------------------------------------------------------*
*& Report ztw_oo_2
*&---------------------------------------------------------------------*

REPORT ztw_oo_2.

* Klassendefinition
CLASS lcl_vehicle DEFINITION.
  PUBLIC SECTION.
    DATA mv_make TYPE string.
    DATA mv_model TYPE string.
ENDCLASS.

* Klassenimplementierung
CLASS lcl_vehicle IMPLEMENTATION.
ENDCLASS.

DATA grt_ref TYPE STANDARD TABLE OF REF TO lcl_vehicle. " Datenblase (Tabelle von Datenreferenzen)
DATA gr_vehic TYPE REF TO lcl_vehicle. " Datenreferenz (Referenz auf eine Instanz der Klasse lcl_vehicle)

CREATE OBJECT gr_vehic. " Eine Instanz wird erstellt und 'gr_vehic' verweist darauf
gr_vehic->mv_make = 'VW'.
gr_vehic->mv_model = 'Arteon'.
APPEND gr_vehic TO grt_ref. " Die Datenreferenz wird an die Datenblase ('grt_ref') angehängt

CREATE OBJECT gr_vehic.
gr_vehic->mv_make = 'Mercedes'.
gr_vehic->mv_model = 'S-Klasse'.
APPEND gr_vehic TO grt_ref.

CREATE OBJECT gr_vehic.
gr_vehic->mv_make = 'Audi'.
gr_vehic->mv_model = 'Q5'.
APPEND gr_vehic TO grt_ref.

"Instanz: Ein konkretes Objekt, das auf Basis einer Klasse erstellt wird. Im gegebenen Code wird eine Instanz von lcl_vehicle durch die Anweisung CREATE OBJECT gr_vehic erstellt.
"Das heißt, es wird ein reales Fahrzeug-Objekt mit Eigenschaften wie mv_make und mv_model geschaffen, das im Speicher existiert.

"Datenblase: Dies ist kein Standardbegriff in der Programmierung, aber in diesem Kontext wird es verwendet, um eine Art Sammlung oder Behälter zu beschreiben, hier spezifisch grt_ref, eine Tabelle zur Aufnahme mehrerer Referenzen auf Fahrzeuginstanzen.
"Im ABAP-Kontext könnte damit eine interne Tabelle gemeint sein, die in der Lage ist, Objektreferenzen zu speichern, also eine "Blase" (Tabelle), in der Daten (Objektreferenzen) aufbewahrt werden können.

"Datenreferenz: Eine Variable, die nicht die tatsächlichen Daten enthält, sondern auf einen Bereich im Speicher verweist, wo diese Daten liegen.
"Im Code ist gr_vehic eine Datenreferenz, weil sie verwendet wird, um auf verschiedene Instanzen von lcl_vehicle zu verweisen, aber nicht die Daten des Fahrzeugs selbst enthält. Es ist vergleichbar mit einem Zeiger in anderen Programmiersprachen.
