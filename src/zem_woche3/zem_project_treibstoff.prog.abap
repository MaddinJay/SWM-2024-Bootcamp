
REPORT zem_project_treibstoff.

PARAMETERS: p_carrid TYPE sflight-carrid,
            p_connid TYPE sflight-connid,
            p_fldate TYPE sflight-fldate.


zem_class_treibstoffverbrauch=>verbrauchleer( iv_connid = p_connid
                                                           iv_carrid = p_carrid
                                                           iv_fldate = p_fldate ).

*zem_class_treibstoffverbrauch=>akttreibstoffbedarf(  ).
