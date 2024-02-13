*&---------------------------------------------------------------------*
*& Report zlv_instanziierung_klasse
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zlv_instanziierung_klasse.

DATA: kraftfahrzeug TYPE REF TO zlv_kraftfahrzeug. "declaration unserer klasse

kraftfahrzeug = NEW #( ). "instance unserer klasse, # wird automatisch aus der klasse geholt (abkürzung: nicht mehr klassennamen hinschreiben müssen "zlv_kraftfahrzeug" wurde mit # ersetzt.

kraftfahrzeug->beschleunigen( ).

kraftfahrzeug->umlackieren( ).

*CREATE OBJECT kraftfahrzeug.

"zuweisung des attributs
*DATA(attribut) = kraftfahrzeug->hersteller. "attribut zuweisung
*
*kraftfahrzeug->abbremsen(  ). "so ruft man methoden wieder auf. gebe "abbr" an und dann anstatt enter der vorschläge, eher umschalt + enter
*
*call METHOD kraftfahrzeug->abbremsen.
*
*""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*
*DATA(attribut2) = kraftfahrzeug->hubraum.  "declaration unserer
*
*kraftfahrzeug->abbremsen( ).
*
*CALL METHOD kraftfahrzeug->abbremsen.
