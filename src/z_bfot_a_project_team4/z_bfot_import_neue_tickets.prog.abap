*&---------------------------------------------------------------------*
*& Report z_bfot_import_neue_tickets
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_bfot_import_neue_tickets.

DATA: lo_import TYPE REF TO zcl_bfot_serviceticket.
lo_import = NEW #(  ).

DATA(lv_neue_hoechste_ticketnr) = lo_import->get_hoechste_ticketnr2( ) + 1.

INSERT INTO zbfot_tickets VALUES @( VALUE
        #(
           ticketnummer = lv_neue_hoechste_ticketnr
           vknr = '2103893001'
           tickettitel = 'ZÄHLER LÄUFT RÜCKWÄRTS'
           ticketbeschreibung = 'HALLO, HEUTE MORGEN IST MIR AUFGEFALLEN, DASS MEIN STROMZÄHLER RÜCKWÄRTS LÄUFT. WAS SOLL ICH TUN?'
           ticketstatus = 'NEU'
           sparte = 'STROM'
           datum = sy-datum
        )
        ).


lv_neue_hoechste_ticketnr = lv_neue_hoechste_ticketnr + 1.

INSERT INTO zbfot_tickets VALUES @( VALUE
        #(
           ticketnummer = lv_neue_hoechste_ticketnr
           vknr = '2108880373'
           tickettitel = 'WIR FRIEREN!'
           ticketbeschreibung = 'UNSERE GASHEIZUNG HEIZT NICHT MEHR!!!WAS SOLLEN WIR TUN?'
           ticketstatus = 'NEU'
           sparte = 'GAS'
           datum = sy-datum
       )
        ).

*lv_neue_hoechste_ticketnr = lv_neue_hoechste_ticketnr + 1.
*
*INSERT INTO zbfot_tickets VALUES @( VALUE
*        #(
*           ticketnummer = lv_neue_hoechste_ticketnr
*           vknr = '2107295629'
*           tickettitel = 'MAHNUNG'
*           ticketbeschreibung = 'WIR HABEN EINE MAHNUNG FÜR UNSEREN FERNWÄRMEVERTRAG BEKOMMEN. ALLERDINGS HABEN WIR UNSEREN ABSCHLAG FÜR FEBRUAR BEREITS ÜBERWIES'
*           ticketstatus = 'NEU'
*           sparte = 'FERNWÄRME'
*           datum = sy-datum
*        )
*        ).

Write: 'Die Störung wurde erfolgreich aufgenommen'. " Text von Frontend hier einfügen.
