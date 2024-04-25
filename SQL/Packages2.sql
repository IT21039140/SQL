create or replace PACKAGE AUDIT_STATUS_PACK AS 

 FUNCTION UPDATE_AUDIT_STATUS_MAINCASE(S_audit_status IN VARCHAR2,S_main_case_id IN NUMBER,S_assigned_div IN VARCHAR2) RETURN VARCHAR2;
 FUNCTION AUDIT_STATUS_MAINCASE_STATUS_VALIDATION(CASE_ID IN NUMBER) RETURN SYS_REFCURSOR;

END AUDIT_STATUS_PACK;
/


create or replace PACKAGE BODY AUDIT_STATUS_PACK AS

--FUNCTION UPDATE_AUDIT_STATUS_MAINCASE(audit_status IN VARCHAR2,main_case_id IN NUMBER) RETURN VARCHAR2 AS 
--status_reply VARCHAR2(50) := ''; 
--BEGIN
--UPDATE AUDIT_CASE_TBL SET OVERALL_AUDIT_STATUS = audit_status
--WHERE DOC_CASE_ID =main_case_id;
--dbms_output.put_line('Sucessfully : - ' || sql%rowcount);
--    if sql%rowcount > 0 then
--    dbms_output.put_line('Sucessfully update : - ');
--    commit;
--    status_reply := 'SUCCESS'; 
--     ELSE
--    dbms_output.put_line('Sucessfully FAIL : - '  );
--    status_reply := 'FAILS';
--     end if;
--    RETURN status_reply;
--END UPDATE_AUDIT_STATUS_MAINCASE;

FUNCTION UPDATE_AUDIT_STATUS_MAINCASE(S_audit_status IN VARCHAR2, S_main_case_id IN NUMBER, S_assigned_div IN VARCHAR2) RETURN VARCHAR2 AS
    cursor1 SYS_REFCURSOR;
    v_overall_incident_status VARCHAR2(50);
    v_incident_current_assigned_div VARCHAR2(50);
    v_main_case_id NUMBER;
    status_reply VARCHAR2(50) := '';
    status_name VARCHAR2(50);
BEGIN

    IF S_audit_status='2' THEN
      status_name:='DRAFT';
    ELSIF S_audit_status='3' THEN
      status_name:='FINAL';
    ELSE
      status_name:='';
    END IF;
    OPEN cursor1 FOR
        SELECT OVERALL_INCIDENT_STATUS, INCIDENT_CURRENT_ASSIGNED_DIV, MAIN_CASE_ID 
        FROM AUDIT_INCIDENT_TBL
        WHERE MAIN_CASE_ID = S_main_case_id;

    LOOP
        FETCH cursor1 INTO v_overall_incident_status, v_incident_current_assigned_div, v_main_case_id;
        EXIT WHEN cursor1%NOTFOUND;

        IF v_incident_current_assigned_div != S_assigned_div THEN
            status_reply := 'THE INCIDENT SHOULD BE ASSIGNED TO AUDIT';
            CLOSE cursor1;
            RETURN status_reply;
        END IF;
        IF v_overall_incident_status != S_audit_status THEN
            status_reply := 'ALL THE INCIDENT SHOULD BE IN ' || status_name || ' STATUS';
            CLOSE cursor1;
            RETURN status_reply;
        END IF;
    END LOOP;
    CLOSE cursor1;

     IF status_reply IS NULL OR status_reply = '' THEN
        UPDATE AUDIT_CASE_TBL SET OVERALL_AUDIT_STATUS = S_audit_status 
        WHERE DOC_CASE_ID = S_main_case_id;
        dbms_output.put_line('Successfully : - ' || sql%rowcount);
        IF sql%rowcount > 0 THEN
            dbms_output.put_line('Successfully update : - ');
            COMMIT;
            status_reply := 'SUCCESS'; 
        ELSE
            dbms_output.put_line('Successfully FAIL : - '  );
            status_reply := 'FAIL';
        END IF;
    END IF;
    RETURN status_reply;
END UPDATE_AUDIT_STATUS_MAINCASE;


FUNCTION AUDIT_STATUS_MAINCASE_STATUS_VALIDATION(CASE_ID IN NUMBER) RETURN SYS_REFCURSOR AS
    cur1 SYS_REFCURSOR;
    BEGIN
    OPEN cur1 FOR
    SELECT A.INCIDENT_CURRENT_ASSIGNED_DIV,A.LAST_NODE_ID,A.LAST_NODE_ELEMENT_ORDER,A.INCIDENT_ID,B.NODE_DESCRIPTION,A.OVERALL_INCIDENT_STATUS,C.OVERALL_AUDIT_STATUS
    FROM AUDIT_INCIDENT_TBL A
    LEFT JOIN AUDIT_CHECK_LIST_TBL B ON (A.LAST_NODE_ID = B.NODE_ID AND A.LAST_NODE_ELEMENT_ORDER = B.NODE_ELEMENT_ORDER)
    LEFT JOIN AUDIT_CASE_TBL C ON C.DOC_CASE_ID = A.MAIN_CASE_ID
    WHERE A.MAIN_CASE_ID = CASE_ID;
    RETURN cur1;
    END AUDIT_STATUS_MAINCASE_STATUS_VALIDATION;
    
    
    
--FUNCTION GET_ALL_THE_INCIDENT_FOR_MAIN_CASE_ID(I_main_case_id IN NUMBER)RETURN AUDIT_INSIDENT_TYPE AS
--FUNCTION AUDIT_STATUS_MAINCASE_STATUS_VALIDATION_I(CASE_ID IN NUMBER) RETURN AUDIT_INSIDENT_TYPE_LIST AS
--  CURSOR INCIDENT_CUR IS 
--    SELECT A.INCIDENT_CURRENT_ASSIGNED_DIV,A.AUDIT_STATUS,A.LAST_NODE_ID,A.LAST_NODE_ELEMENT_ORDER,A.INCIDENT_ID,B.NODE_DESCRIPTION
--    FROM AUDIT_INCIDENT_TBL A
--    INNER JOIN AUDIT_CHECK_LIST_TBL B ON (A.LAST_NODE_ID = B.NODE_ID AND A.LAST_NODE_ELEMENT_ORDER = B.NODE_ELEMENT_ORDER)
--    WHERE A.MAIN_CASE_ID = CASE_ID;
--    
--    AUDIT_INSIDENT_LIST AUDIT_INSIDENT_TYPE_LIST;
--    AUDIT_INSIDENT AUDIT_INSIDENT_TYPE;
--  BEGIN
--     FOR INCIDENT_CUR_REC IN INCIDENT_CUR LOOP
--        AUDIT_INSIDENT:= NEW  AUDIT_INSIDENT_TYPE(0,0,0,'','','','',0,0,'','','','',0,'',0,null,'',null,'','','','','','', '','','','','','',	'',	'',	0,0,0,0,0,'','','','','','',0,'','','',0,null,null,'',null,null,null,null);
--        
--        
--        
--    AUDIT_INSIDENT_LIST.EXTEND;
--        AUDIT_INSIDENT_LIST(AUDIT_INSIDENT_LIST.LAST):=AUDIT_INSIDENT;
--      END LOOP;
--
--
--END AUDIT_STATUS_MAINCASE_STATUS_VALIDATION_I;


END AUDIT_STATUS_PACK;
/