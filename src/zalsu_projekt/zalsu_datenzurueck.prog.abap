*&---------------------------------------------------------------------*
*& Report zalsu_datenzurueck
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zalsu_datenzurueck.



****** Spielkundendaten ********
Update zalsu_db_ticket set technikerid = '', status = 'NEU', kategorie = 'STROMSTÖRUNG', kundeninfo = '', loesung = '', grossstoerung = '', datum_erl = 00000000
where ticketid > 4214.



delete from zalsu_db_grsto.

Write 'Alle Tickets wurden zurück gesetzt.'.
