
REPORT z_report_as_02.

data: lv_test2 type string.
DATA(lv_test) = |Test|.
lv_test2 = 'Test'.
lv_test = 'Dies ist ein Test'.
lv_test2 = 'Dies ist ein zweiter Test'.
WRITE: lv_test, lv_test2.
