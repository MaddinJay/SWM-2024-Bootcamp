*&---------------------------------------------------------------------*
*& Report zfd_instanz
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_instanz.


*START-OF-SELECTION
DATA kraftfahrzeug TYPE REF TO zfd_kraftfahrzeug.

kraftfahrzeug = NEW #( ). " Instanz unserer Klasse
*oder
*kraftfahrzeug = NEW zfd_kraftfahrzeug(  ).
*oder
*CREATE OBJECT kraftfahrzeug.  " alte Möglichkeit eine Instanz zu erstellen!

kraftfahrzeug->hersteller = 'Mercedes'.
kraftfahrzeug->marke = 'SL500'.

kraftfahrzeug->abbremsen( ).

CALL METHOD kraftfahrzeug->abbremsen. " alte Möglichkeit eine Methode aufzurufen.

write: /, kraftfahrzeug->hersteller.
write: /, kraftfahrzeug->marke.
