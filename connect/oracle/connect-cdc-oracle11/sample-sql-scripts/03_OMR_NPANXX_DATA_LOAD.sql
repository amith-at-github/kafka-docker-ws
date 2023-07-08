DECLARE
    v_loopcounter   INTEGER;
    v_sqlcmd        VARCHAR2(500);
    v_npanxx_ranges INTEGER;
    v_npa_nxx       INTEGER;

BEGIN
    -- Get MAX values for Unique Columns
    SELECT
        MAX(to_number(npa_nxx))       max_npa_nxx,
        MAX(to_number(npanxx_ranges)) max_npanxx_ranges
    INTO
        v_npa_nxx,
        v_npanxx_ranges
    FROM
        fwd_cmn.omr_npanxx;
    -- Generate DYN Insert statments for OMR_NPANXX
    FOR v_loopcounter IN 1..50000 LOOP
        v_npanxx_ranges := v_npanxx_ranges + 1;
        v_npa_nxx := v_npa_nxx + 1;
        v_sqlcmd := 'INSERT INTO FWD_CMN.OMR_NPANXX (NPANXX_RANGES, NPA_NXX, XXXX_BEGIN, XXXX_END, ENABLER_ZONE, MARKET, SUB_MARKET)
                            VALUES ('''||V_NPANXX_RANGES||''', '''||V_NPA_NXX||''', ''0'', ''9999'', ''WST'', ''IND'', ''266'')';
        --dbms_output.put_line(v_sqlcmd);
        execute immediate v_sqlcmd;
    END LOOP;
    COMMIT;

EXCEPTION
  WHEN OTHERS THEN
                ROLLBACK; 
END;