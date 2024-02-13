*&---------------------------------------------------------------------*
*& Report ZEA_HELLOWORLD
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZEA_HELLOWORLD LINE-SIZE 50. "Linesize setzt die Beschränkung der Ausgabenbreite der Liste auf die angegebene Zahl"

WRITE 'Hello World, Elvin Alioski'. "normaler Write-Befehl"
WRITE / 'Hello World'. "Zeilenumbruch, dieser TExt kommt die nächste Zeile."

ULINE. "Zieht an dieser Setelle einen kompletten Strich in der Zeile"
SKIP 2. "dieser Befehl lässt eine, bzw. je nach Zahl selbst angegeben 2 Zeilen frei.
WRITE 'Hello World'.
