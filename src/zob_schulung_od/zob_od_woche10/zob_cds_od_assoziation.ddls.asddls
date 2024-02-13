@AbapCatalog.sqlViewName: 'ZOB_VW_OD_ASSO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ASSOZIATION'
define view ZOB_CDS_OD_ASSOZIATION as select from spfli
association [1] to scarr as _Carrier
on spfli.carrid = _Carrier.carrid
association[*] to sflight as _Flight
on spfli.carrid = _Flight.carrid
and spfli.connid = _Flight.connid
{
  key spfli.carrid as AirlineCode,
  key spfli.connid as VerbindungsCode,
  spfli.countryfr as Countryfrom,
_Carrier,
_Flight
}
//@AbapCatalog.sqlViewName: 'ZOB_VW_OD_ASSO' ist eine Annotation, die den SQL-View-Namen der CDS View spezifiziert. 
//Dies ist der Name, unter dem die View in der Datenbank zu finden ist.
//
//@AbapCatalog.compiler.compareFilter: true bedeutet, dass der ABAP Compiler sicherstellt, dass alle Filter, 
//die in der SELECT-Anweisung der CDS View angegeben sind, auch in der generierten SQL View zum Tragen kommen.
//
//@AbapCatalog.preserveKey: true erhält die Schlüssel der Originaltabelle, was bedeutet, 
//dass die Schlüsselfelder im Ergebnisset der View beibehalten werden.
//
//@AccessControl.authorizationCheck: #NOT_REQUIRED gibt an, dass für diese CDS View keine Berechtigungsprüfungen erforderlich sind.
//
//@EndUserText.label: 'ASSOZIATION' definiert den Text, der für den Endbenutzer als Bezeichnung der View angezeigt wird.
//
//define view ZOB_CDS_OD_ASSOZIATION as select from spfli beginnt die Definition der eigentlichen CDS View.
//ZOB_CDS_OD_ASSOZIATION ist der Name der CDS View, und spfli ist die Quelltabelle, von der Daten ausgewählt werden.
//
//association [1] to scarr as _Carrier definiert eine Eins-zu-Eins-Assoziation zu einer anderen CDS View oder Datenbanktabelle scarr, 
//die mit dem Alias _Carrier innerhalb dieser CDS View referenziert wird.
//
//association [*] to sflight as _Flight definiert eine Eins-zu-viele-Assoziation zu einer anderen CDS View oder Datenbanktabelle sflight, 
//die mit dem Alias _Flight in dieser View referenziert wird.
//
//Danach kommt die ON-Klausel, die die Join-Bedingungen für die Assoziationen beschreibt: 
//spfli.carrid = _Carrier.carrid verbindet die spfli Tabelle mit scarr, 
//und spfli.carrid = _Flight.carrid and spfli.connid = _Flight.connid verbindet spfli mit sflight.
//
//Die geschweiften Klammern { ... } enthalten die eigentlichen Felder, die von der View zurückgegeben werden sollen. 
//Sie spezifizieren, welche Spalten aus der Tabelle spfli sowie die assoziierten Tabellen _Carrier und _Flight selektiert und 
//unter welchem Namen (Alias) diese in der CDS View erscheinen sollen.
//
//Das Ergebnis ist eine View, die Daten aus der spfli Tabelle zusammen mit den assoziierten 
//Daten aus den scarr und sflight Tabellen basierend auf den definierten Assoziationen anzeigt.
