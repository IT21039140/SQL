create or replace PACKAGE AUDIT_CASE_PACK AS 

  FUNCTION GET_AUDIT_SEARCH_DATA(s_audit_area IN VARCHAR2, s_audit_mode IN VARCHAR2,s_year IN NUMBER,s_overall_audit_status IN VARCHAR2)RETURN AUDIT_CASE_TYPE_LIST;

  FUNCTION GET_SEARCHED_AUDIT_CASE (s_audit_area IN VARCHAR2, s_audit_mode IN VARCHAR2,s_year IN NUMBER,s_overall_audit_status IN VARCHAR2,s_audit_div IN VARCHAR2,s_refNum IN VARCHAR2) RETURN AUDIT_CASE_TYPE_LIST;

  FUNCTION REMOVE_MAIN_CASE(main_case_id IN NUMBER)RETURN VARCHAR2;
END AUDIT_CASE_PACK;
/


create or replace PACKAGE BODY AUDIT_CASE_PACK AS

  FUNCTION GET_AUDIT_SEARCH_DATA(s_audit_area IN VARCHAR2, s_audit_mode IN VARCHAR2,s_year IN NUMBER,s_overall_audit_status IN VARCHAR2)RETURN AUDIT_CASE_TYPE_LIST AS
  CURSOR MAIN_CASE_CUR IS
    SELECT * FROM AUDIT_CASE_TBL WHERE AUDIT_AREA=s_audit_area AND AUDIT_MODE=s_audit_mode AND YEAR=s_year;
  
  CURSOR MAIN_CASE_WITH_STATUS_CUR IS
    SELECT * FROM AUDIT_CASE_TBL WHERE AUDIT_AREA=s_audit_area AND AUDIT_MODE=s_audit_mode AND YEAR=s_year AND OVERALL_AUDIT_STATUS=s_overall_audit_status;
  
   CURSOR MAIN_CASE_WITH_WITH_CUR IS
    SELECT * FROM AUDIT_CASE_TBL WHERE AUDIT_AREA=s_audit_area AND AUDIT_MODE=s_audit_mode AND YEAR=s_year AND OVERALL_AUDIT_STATUS=s_overall_audit_status;
  
    AUDIT_CASE_LIST AUDIT_CASE_TYPE_LIST;
    AUDIT_CASE AUDIT_CASE_TYPE;
    
  BEGIN
    
  
    AUDIT_CASE_LIST:=NEW AUDIT_CASE_TYPE_LIST();
    
    IF(s_overall_audit_status IS NULL) THEN
      FOR MAIN_CASE_CUR_REC IN MAIN_CASE_CUR LOOP
        AUDIT_CASE:=NEW AUDIT_CASE_TYPE(0,null,'',0,'',null,'',0,0,'',0,0,'',0,null,'','','','',0,null,null,null,null,'','','','','');
        
        AUDIT_CASE.DOC_CASE_ID := MAIN_CASE_CUR_REC.DOC_CASE_ID;
        AUDIT_CASE.CASE_CREATED_DATE := MAIN_CASE_CUR_REC.CASE_CREATED_DATE;
        AUDIT_CASE.CASE_CREATED_USER := MAIN_CASE_CUR_REC.CASE_CREATED_USER;
        AUDIT_CASE.CASE_LAST_ACTION_STATUS := MAIN_CASE_CUR_REC.CASE_LAST_ACTION_STATUS;
       
        AUDIT_CASE.CASE_SPECIAL_COMMENT_VARCHAR := MAIN_CASE_CUR_REC.CASE_SPECIAL_COMMENT_VARCHAR;
        AUDIT_CASE.CASE_LAST_ACTION_DATE := MAIN_CASE_CUR_REC.CASE_LAST_ACTION_DATE;
        AUDIT_CASE.CASE_LAST_ACTION_USER := MAIN_CASE_CUR_REC.CASE_LAST_ACTION_USER;
        AUDIT_CASE.CASE_LAST_ACTION_USER_LEVEL := MAIN_CASE_CUR_REC.CASE_LAST_ACTION_USER_LEVEL;
        
        AUDIT_CASE.LAST_NODE_ID := MAIN_CASE_CUR_REC.LAST_NODE_ID;
        AUDIT_CASE.CASE_CREATED_DIV := MAIN_CASE_CUR_REC.CASE_CREATED_DIV;
        AUDIT_CASE.LAST_NODE_ELEMENT_ORDER := MAIN_CASE_CUR_REC.LAST_NODE_ELEMENT_ORDER;
        AUDIT_CASE.CASE_CREATED_USER_LEVEL := MAIN_CASE_CUR_REC.CASE_CREATED_USER_LEVEL;
        
        AUDIT_CASE.CURRENT_ASSIGNED_USER := MAIN_CASE_CUR_REC.CURRENT_ASSIGNED_USER;
        AUDIT_CASE.CURRENT_ASSIGNED_USER_LEVEL := MAIN_CASE_CUR_REC.CURRENT_ASSIGNED_USER_LEVEL;
        AUDIT_CASE.CASE_SPECIAL_COMMENT := MAIN_CASE_CUR_REC.CASE_SPECIAL_COMMENT;
        AUDIT_CASE.CASE_RESPONSIBLE_USER := MAIN_CASE_CUR_REC.CASE_RESPONSIBLE_USER;
        
        AUDIT_CASE.AUDIT_AREA := MAIN_CASE_CUR_REC.AUDIT_AREA;
        AUDIT_CASE.RISK_CAL_CODE := MAIN_CASE_CUR_REC.RISK_CAL_CODE;
        AUDIT_CASE.AUDIT_MODE := MAIN_CASE_CUR_REC.AUDIT_MODE;
        AUDIT_CASE.YEAR := MAIN_CASE_CUR_REC.YEAR;
        
        AUDIT_CASE.COVER_FROM := MAIN_CASE_CUR_REC.COVER_FROM;
        AUDIT_CASE.COVER_TO := MAIN_CASE_CUR_REC.COVER_TO;
        AUDIT_CASE.EXAM_PERIOD_FROM := MAIN_CASE_CUR_REC.EXAM_PERIOD_FROM;
        AUDIT_CASE.EXAM_PERIOD_TO := MAIN_CASE_CUR_REC.EXAM_PERIOD_TO;
        
        AUDIT_CASE.AUDIT_DIV := MAIN_CASE_CUR_REC.AUDIT_DIV;
        AUDIT_CASE.CURRENT_ASSIGN_USER_NAME := MAIN_CASE_CUR_REC.CURRENT_ASSIGN_USER_NAME;
        AUDIT_CASE.CREATED_USER_NAME := MAIN_CASE_CUR_REC.CREATED_USER_NAME;
        AUDIT_CASE.AUDIT_DIV_DESC := MAIN_CASE_CUR_REC.AUDIT_DIV_DESC;
        AUDIT_CASE.OVERALL_AUDIT_STATUS := MAIN_CASE_CUR_REC.OVERALL_AUDIT_STATUS;
        
        DBMS_OUTPUT.PUT_LINE('overall_audit_status' || MAIN_CASE_CUR_REC.OVERALL_AUDIT_STATUS);
    
        
        ---OTHER DATA GOSE HERE--
        
        AUDIT_CASE_LIST.EXTEND;
        AUDIT_CASE_LIST(AUDIT_CASE_LIST.LAST):=AUDIT_CASE;
        
      END LOOP;
    ELSE
        FOR MAIN_CASE_WITH_STATUS_CUR_REC IN MAIN_CASE_WITH_STATUS_CUR LOOP
          AUDIT_CASE:=NEW AUDIT_CASE_TYPE(0,null,'',0,'',null,'',0,0,'',0,0,'',0,null,'','','','',0,null,null,null,null,'','','','','');

          AUDIT_CASE.DOC_CASE_ID := MAIN_CASE_WITH_STATUS_CUR_REC.DOC_CASE_ID;
          AUDIT_CASE.CASE_CREATED_DATE := MAIN_CASE_WITH_STATUS_CUR_REC.CASE_CREATED_DATE;
          AUDIT_CASE.CASE_CREATED_USER := MAIN_CASE_WITH_STATUS_CUR_REC.CASE_CREATED_USER;
          AUDIT_CASE.CASE_LAST_ACTION_STATUS := MAIN_CASE_WITH_STATUS_CUR_REC.CASE_LAST_ACTION_STATUS;
          
          AUDIT_CASE.CASE_SPECIAL_COMMENT_VARCHAR := MAIN_CASE_WITH_STATUS_CUR_REC.CASE_SPECIAL_COMMENT_VARCHAR;
          AUDIT_CASE.CASE_LAST_ACTION_DATE := MAIN_CASE_WITH_STATUS_CUR_REC.CASE_LAST_ACTION_DATE;
          AUDIT_CASE.CASE_LAST_ACTION_USER := MAIN_CASE_WITH_STATUS_CUR_REC.CASE_LAST_ACTION_USER;
          AUDIT_CASE.CASE_LAST_ACTION_USER_LEVEL := MAIN_CASE_WITH_STATUS_CUR_REC.CASE_LAST_ACTION_USER_LEVEL;
          AUDIT_CASE.LAST_NODE_ID := MAIN_CASE_WITH_STATUS_CUR_REC.LAST_NODE_ID;
          
          AUDIT_CASE.CASE_CREATED_DIV := MAIN_CASE_WITH_STATUS_CUR_REC.CASE_CREATED_DIV;
          AUDIT_CASE.LAST_NODE_ELEMENT_ORDER := MAIN_CASE_WITH_STATUS_CUR_REC.LAST_NODE_ELEMENT_ORDER;
          AUDIT_CASE.CASE_CREATED_USER_LEVEL := MAIN_CASE_WITH_STATUS_CUR_REC.CASE_CREATED_USER_LEVEL;
          AUDIT_CASE.CURRENT_ASSIGNED_USER := MAIN_CASE_WITH_STATUS_CUR_REC.CURRENT_ASSIGNED_USER;
          AUDIT_CASE.CURRENT_ASSIGNED_USER_LEVEL := MAIN_CASE_WITH_STATUS_CUR_REC.CURRENT_ASSIGNED_USER_LEVEL;
          
          AUDIT_CASE.CASE_SPECIAL_COMMENT := MAIN_CASE_WITH_STATUS_CUR_REC.CASE_SPECIAL_COMMENT;
          AUDIT_CASE.CASE_RESPONSIBLE_USER := MAIN_CASE_WITH_STATUS_CUR_REC.CASE_RESPONSIBLE_USER;
          AUDIT_CASE.AUDIT_AREA := MAIN_CASE_WITH_STATUS_CUR_REC.AUDIT_AREA;
          AUDIT_CASE.RISK_CAL_CODE := MAIN_CASE_WITH_STATUS_CUR_REC.RISK_CAL_CODE;
          
          AUDIT_CASE.AUDIT_MODE := MAIN_CASE_WITH_STATUS_CUR_REC.AUDIT_MODE;
          AUDIT_CASE.YEAR := MAIN_CASE_WITH_STATUS_CUR_REC.YEAR;
          AUDIT_CASE.COVER_FROM := MAIN_CASE_WITH_STATUS_CUR_REC.COVER_FROM;
          AUDIT_CASE.COVER_TO := MAIN_CASE_WITH_STATUS_CUR_REC.COVER_TO;
          
          AUDIT_CASE.EXAM_PERIOD_FROM := MAIN_CASE_WITH_STATUS_CUR_REC.EXAM_PERIOD_FROM;
          AUDIT_CASE.EXAM_PERIOD_TO := MAIN_CASE_WITH_STATUS_CUR_REC.EXAM_PERIOD_TO;
          AUDIT_CASE.AUDIT_DIV := MAIN_CASE_WITH_STATUS_CUR_REC.AUDIT_DIV;
          AUDIT_CASE.CURRENT_ASSIGN_USER_NAME := MAIN_CASE_WITH_STATUS_CUR_REC.CURRENT_ASSIGN_USER_NAME;
          
          AUDIT_CASE.CREATED_USER_NAME := MAIN_CASE_WITH_STATUS_CUR_REC.CREATED_USER_NAME;
          AUDIT_CASE.AUDIT_DIV_DESC := MAIN_CASE_WITH_STATUS_CUR_REC.AUDIT_DIV_DESC;
          AUDIT_CASE.OVERALL_AUDIT_STATUS := MAIN_CASE_WITH_STATUS_CUR_REC.OVERALL_AUDIT_STATUS;
          
          DBMS_OUTPUT.PUT_LINE('overall_audit_status' || MAIN_CASE_WITH_STATUS_CUR_REC.OVERALL_AUDIT_STATUS);
      
          AUDIT_CASE_LIST.EXTEND;
          AUDIT_CASE_LIST(AUDIT_CASE_LIST.LAST) := AUDIT_CASE;
    
        END LOOP;
    END IF;
    -- TODO: Implementation required for FUNCTION AUDIT_CASE_PACK.GET_AUDIT_SEARCH_DATA
    RETURN AUDIT_CASE_LIST;
  END GET_AUDIT_SEARCH_DATA;
  
  
  
FUNCTION GET_SEARCHED_AUDIT_CASE (s_audit_area IN VARCHAR2, s_audit_mode IN VARCHAR2,s_year IN NUMBER,s_overall_audit_status IN VARCHAR2,s_audit_div IN VARCHAR2, s_refNum IN VARCHAR2) RETURN AUDIT_CASE_TYPE_LIST AS
  CURSOR MAIN_CASE_CUR IS
    SELECT *
    FROM AUDIT_CASE_TBL
    WHERE AUDIT_AREA = s_audit_area
    AND AUDIT_MODE = s_audit_mode
    AND YEAR = s_year
    AND (s_overall_audit_status IS NULL OR OVERALL_AUDIT_STATUS = s_overall_audit_status)
    AND (s_audit_div IS NULL OR AUDIT_DIV = s_audit_div)
    AND (s_refNum IS NULL OR AUDIT_REPORT_REF_NUM=s_refNum);
    
    AUDIT_CASE_LIST AUDIT_CASE_TYPE_LIST;
    AUDIT_CASE AUDIT_CASE_TYPE;
BEGIN

  AUDIT_CASE_LIST := AUDIT_CASE_TYPE_LIST();
   FOR MAIN_CASE_CUR_REC IN MAIN_CASE_CUR LOOP
        AUDIT_CASE:=NEW AUDIT_CASE_TYPE(0,null,'',0,'',null,'',0,0,'',0,0,'',0,null,'','','','',0,null,null,null,null,'','','','','');
        
        AUDIT_CASE.DOC_CASE_ID := MAIN_CASE_CUR_REC.DOC_CASE_ID;
        AUDIT_CASE.CASE_CREATED_DATE := MAIN_CASE_CUR_REC.CASE_CREATED_DATE;
        AUDIT_CASE.CASE_CREATED_USER := MAIN_CASE_CUR_REC.CASE_CREATED_USER;
        AUDIT_CASE.CASE_LAST_ACTION_STATUS := MAIN_CASE_CUR_REC.CASE_LAST_ACTION_STATUS;
       
        AUDIT_CASE.CASE_SPECIAL_COMMENT_VARCHAR := MAIN_CASE_CUR_REC.CASE_SPECIAL_COMMENT_VARCHAR;
        AUDIT_CASE.CASE_LAST_ACTION_DATE := MAIN_CASE_CUR_REC.CASE_LAST_ACTION_DATE;
        AUDIT_CASE.CASE_LAST_ACTION_USER := MAIN_CASE_CUR_REC.CASE_LAST_ACTION_USER;
        AUDIT_CASE.CASE_LAST_ACTION_USER_LEVEL := MAIN_CASE_CUR_REC.CASE_LAST_ACTION_USER_LEVEL;
        
        AUDIT_CASE.LAST_NODE_ID := MAIN_CASE_CUR_REC.LAST_NODE_ID;
        AUDIT_CASE.CASE_CREATED_DIV := MAIN_CASE_CUR_REC.CASE_CREATED_DIV;
        AUDIT_CASE.LAST_NODE_ELEMENT_ORDER := MAIN_CASE_CUR_REC.LAST_NODE_ELEMENT_ORDER;
        AUDIT_CASE.CASE_CREATED_USER_LEVEL := MAIN_CASE_CUR_REC.CASE_CREATED_USER_LEVEL;
        
        AUDIT_CASE.CURRENT_ASSIGNED_USER := MAIN_CASE_CUR_REC.CURRENT_ASSIGNED_USER;
        AUDIT_CASE.CURRENT_ASSIGNED_USER_LEVEL := MAIN_CASE_CUR_REC.CURRENT_ASSIGNED_USER_LEVEL;
        AUDIT_CASE.CASE_SPECIAL_COMMENT := MAIN_CASE_CUR_REC.CASE_SPECIAL_COMMENT;
        AUDIT_CASE.CASE_RESPONSIBLE_USER := MAIN_CASE_CUR_REC.CASE_RESPONSIBLE_USER;
        
        AUDIT_CASE.AUDIT_AREA := MAIN_CASE_CUR_REC.AUDIT_AREA;
        AUDIT_CASE.RISK_CAL_CODE := MAIN_CASE_CUR_REC.RISK_CAL_CODE;
        AUDIT_CASE.AUDIT_MODE := MAIN_CASE_CUR_REC.AUDIT_MODE;
        AUDIT_CASE.YEAR := MAIN_CASE_CUR_REC.YEAR;
        
        AUDIT_CASE.COVER_FROM := MAIN_CASE_CUR_REC.COVER_FROM;
        AUDIT_CASE.COVER_TO := MAIN_CASE_CUR_REC.COVER_TO;
        AUDIT_CASE.EXAM_PERIOD_FROM := MAIN_CASE_CUR_REC.EXAM_PERIOD_FROM;
        AUDIT_CASE.EXAM_PERIOD_TO := MAIN_CASE_CUR_REC.EXAM_PERIOD_TO;
        
        AUDIT_CASE.AUDIT_DIV := MAIN_CASE_CUR_REC.AUDIT_DIV;
        AUDIT_CASE.CURRENT_ASSIGN_USER_NAME := MAIN_CASE_CUR_REC.CURRENT_ASSIGN_USER_NAME;
        AUDIT_CASE.CREATED_USER_NAME := MAIN_CASE_CUR_REC.CREATED_USER_NAME;
        AUDIT_CASE.AUDIT_DIV_DESC := MAIN_CASE_CUR_REC.AUDIT_DIV_DESC;
        AUDIT_CASE.OVERALL_AUDIT_STATUS := MAIN_CASE_CUR_REC.OVERALL_AUDIT_STATUS;
        
        DBMS_OUTPUT.PUT_LINE('overall_audit_status' || MAIN_CASE_CUR_REC.OVERALL_AUDIT_STATUS);
    
        
        ---OTHER DATA GOSE HERE--
        
        AUDIT_CASE_LIST.EXTEND;
        AUDIT_CASE_LIST(AUDIT_CASE_LIST.LAST):=AUDIT_CASE;
        
    END LOOP;
  
  RETURN AUDIT_CASE_LIST;
END GET_SEARCHED_AUDIT_CASE;


FUNCTION REMOVE_MAIN_CASE(main_case_id IN NUMBER)RETURN VARCHAR2 AS---newly added end of 7-12-2023-
updateStatus VARCHAR2(10) := '';
BEGIN
    UPDATE AUDIT_CASE_TBL
    SET AUDIT_MAIN_CASE_DEL_FLAG = 1
    WHERE DOC_CASE_ID = main_case_id;

    -- Check the number of rows affected
    IF sql%rowcount > 0 THEN
        dbms_output.put_line('Successfully updated: - ');
        COMMIT;
        updateStatus := 'SUCCESS';
    ELSE
        dbms_output.put_line('Update failed: No rows affected');
        updateStatus := 'FAIL';
    END IF;

    RETURN updateStatus;
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Exception occurred: ' || SQLERRM);
        updateStatus := 'ERROR';
        RETURN updateStatus;
END REMOVE_MAIN_CASE;

END AUDIT_CASE_PACK;
/



create or replace PACKAGE AUDIT_STATUS_PACK AS 

 FUNCTION UPDATE_AUDIT_STATUS_MAINCASE(S_audit_status IN VARCHAR2,S_main_case_id IN NUMBER,S_assigned_div IN VARCHAR2) RETURN VARCHAR2;
-- FUNCTION AUDIT_STATUS_MAINCASE_STATUS_VALIDATION(CASE_ID IN NUMBER) RETURN SYS_REFCURSOR;
 


END AUDIT_STATUS_PACK;
/
create or replace PACKAGE BODY AUDIT_STATUS_PACK AS



--- need some changes to do
FUNCTION UPDATE_AUDIT_STATUS_MAINCASE(S_audit_status IN VARCHAR2, S_main_case_id IN NUMBER, S_assigned_div IN VARCHAR2) RETURN VARCHAR2 AS
    cursor1 SYS_REFCURSOR;
    cursor2 SYS_REFCURSOR;
    v_overall_incident_status VARCHAR2(50);
    v_incident_current_assigned_div VARCHAR2(50);
    v_main_case_id NUMBER;
    status_reply VARCHAR2(1000) := '';
    status_name VARCHAR2(50);
    v_incident_id NUMBER;
BEGIN

    IF S_audit_status='1' THEN--newly added 6/12/2023
      status_name:='INITIAL';
    ELSIF S_audit_status='2' THEN
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
            status_reply := 'false';

        END IF;
    END LOOP;
    CLOSE cursor1;
    --new changes--
    IF status_reply = 'false' THEN
     
        status_reply := 'THESE INCIDENTS SHOULD BE IN THE STATUS OF ' || status_name || ': ';

        
        OPEN cursor2 FOR
            SELECT INCIDENT_ID FROM AUDIT_INCIDENT_TBL
            WHERE MAIN_CASE_ID = S_main_case_id AND TO_NUMBER(OVERALL_INCIDENT_STATUS) < TO_NUMBER(S_audit_status);

        
        LOOP
            FETCH cursor2 INTO v_incident_id;
            EXIT WHEN cursor2%NOTFOUND;
            status_reply := status_reply || v_incident_id || ', ';
        END LOOP;

        CLOSE cursor2;

        
        IF LENGTH(status_reply) > 0 THEN
            status_reply := RTRIM(status_reply, ', ');
        END IF;
    END IF;
    
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


END AUDIT_STATUS_PACK;
/



create or replace PACKAGE AUDIT_RISK_PACK AS ---new package 7-12-2023------

  FUNCTION GET_RISCK_CAL_VALUE(column_name IN VARCHAR2, R_cal_code IN VARCHAR2)RETURN VARCHAR2;
  

END AUDIT_RISK_PACK;
/
create or replace PACKAGE BODY AUDIT_RISK_PACK AS

  FUNCTION GET_RISCK_CAL_VALUE(column_name IN VARCHAR2, R_cal_code IN VARCHAR2)RETURN VARCHAR2 AS
     v_sql_string VARCHAR2(1000);
      v_result FLOAT;
      new_cal_name VARCHAR(50);
  BEGIN
  
    IF column_name='Low'THEN
      new_cal_name:='LOW_VAL';
    ELSIF column_name ='Medium' THEN
      new_cal_name:='MEDIUM_VAL';
    ELSIF column_name='High' THEN
      new_cal_name:='HIGH_VAL';
    ELSIF column_name='Extreme' THEN
      new_cal_name:='EXTREME_VAL';
    END IF;
      
      v_sql_string := 'SELECT ' || new_cal_name || ' FROM AUDIT_OVERALL_RISK_CAL_DETAILS WHERE GENERATED_CODE = :1';

      
      EXECUTE IMMEDIATE v_sql_string INTO v_result USING R_cal_code;

      
      RETURN TO_CHAR(v_result);
  EXCEPTION
      WHEN OTHERS THEN
          
          DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
          RETURN NULL;
  END GET_RISCK_CAL_VALUE;

END AUDIT_RISK_PACK;
/





create or replace PACKAGE AUDIT_CHILD_CASE_PACK AS -- new pack---6/12/2023
  
  FUNCTION GET_SECTION_DESCRIPTION(i_child_case_id IN NUMBER) RETURN VARCHAR2;
  

END AUDIT_CHILD_CASE_PACK;
/
create or replace PACKAGE BODY AUDIT_CHILD_CASE_PACK AS

  FUNCTION GET_SECTION_DESCRIPTION(i_child_case_id IN NUMBER) RETURN VARCHAR2 AS
    v_last_node_id NUMBER;
    v_last_node_element_order NUMBER;
    v_year NVARCHAR2(20);
    v_section_description VARCHAR2(1000);
    BEGIN
  -- Retrieve LAST_NODE_ID, LAST_NODE_ELEMENT_ORDER, and YEAR from AUDIT_CHILD_CASE_TBL
      SELECT LAST_NODE_ID, LAST_NODE_ELEMENT_ORDER, YEAR
      INTO v_last_node_id, v_last_node_element_order, v_year
      FROM AUDIT_CHILD_CASE_TBL
      WHERE CHILD_CASE_ID = i_child_case_id;

  -- Retrieve SECTION_DESCRIPTION from AUDIT_SECTION_TBL
      SELECT SECTION_DESCRIPTION
      INTO v_section_description
      FROM AUDIT_SECTION_TBL
      WHERE PARENT_NODE = v_last_node_id 
        AND PARENT_NODE_ORDER = v_last_node_element_order 
        AND YEAR = v_year;

    RETURN v_section_description;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        RETURN NULL; -- Or handle the exception as required
      WHEN OTHERS THEN
      -- Handle other exceptions if necessary
      RAISE;
END GET_SECTION_DESCRIPTION;

END AUDIT_CHILD_CASE_PACK;
/



create or replace PACKAGE DASHBOARD_PACK AS 

  
  FUNCTION GET_DASHBOARD (currentUser IN VARCHAR2, VIW NUMBER) RETURN DASHBOARD_CASES;
  FUNCTION UPDATE_MAIN_CASE(main_case_id IN NUMBER,i_audit_div IN VARCHAR2,i_cover_from IN TIMESTAMP,i_cover_to IN TIMESTAMP,exam_p_from IN TIMESTAMP,exam_p_to IN TIMESTAMP) RETURN VARCHAR2;
  

END DASHBOARD_PACK;
/


create or replace PACKAGE BODY DASHBOARD_PACK AS
  FUNCTION GET_DASHBOARD (currentUser IN VARCHAR2, VIW NUMBER) RETURN DASHBOARD_CASES AS
    CURSOR MAIN_CUR IS 
      SELECT DOC_CASE_ID,CASE_CREATED_DIV,CASE_LAST_ACTION_DATE,AUDIT_AREA,AUDIT_MODE,CASE_CREATED_DATE,CASE_LAST_ACTION_STATUS,AUDIT_DIV,AUDIT_DIV_DESC
      FROM AUDIT_CASE_TBL
      WHERE (
      CASE_CREATED_USER = currentUser AND
      AUDIT_MAIN_CASE_DEL_FLAG!=1
     
      )
      
      ORDER By DOC_CASE_ID ASC;
      
      
      
    CURSOR CASE_ASSIGNED_CUR IS 
      SELECT DISTINCT MAIN_CASE_ID,CASE_CREATED_DIV,CASE_LAST_ACTION_DATE,(SELECT ac.AUDIT_AREA FROM AUDIT_CASE_TBL ac WHERE ac.DOC_CASE_ID = MAIN_CASE_ID  ) AS AUDIT_AREA , (SELECT ac.AUDIT_MODE FROM AUDIT_CASE_TBL ac WHERE ac.DOC_CASE_ID = MAIN_CASE_ID  ) AS AUDIT_MODE ,CASE_CREATED_DATE,CASE_LAST_ACTION_STATUS,(SELECT ac.AUDIT_DIV_DESC FROM AUDIT_CASE_TBL ac WHERE ac.DOC_CASE_ID = MAIN_CASE_ID  ) AS AUDIT_DIV_DESC
      FROM AUDIT_CHILD_CASE_TBL
      WHERE CURRENT_ASSIGNED_USER = currentUser AND CASE_LAST_ACTION_STATUS != 3 AND CASE_CREATED_USER != currentUser ORDER By MAIN_CASE_ID ASC;
   
--    
    CURSOR CASE_INCI_CUR IS
        SELECT DISTINCT it.MAIN_CASE_ID,it.CHILD_CASE_ID,ct.CASE_CREATED_DIV,ct.CASE_LAST_ACTION_DATE,ct.AUDIT_AREA,ct.AUDIT_MODE,ct.CASE_CREATED_DATE,ct.CASE_LAST_ACTION_STATUS,ct.AUDIT_DIV, ct.AUDIT_DIV_DESC
        FROM AUDIT_INCIDENT_TBL it , AUDIT_CASE_TBL ct, AUDIT_CHILD_CASE_TBL cc
        WHERE it.MAIN_CASE_ID = ct.DOC_CASE_ID AND it.INCIDENT_CURRENT_ASSIGNED_USER = currentUser AND ct.CASE_CREATED_USER != currentUser AND cc.CHILD_CASE_ID = it.CHILD_CASE_ID AND cc.CURRENT_ASSIGNED_USER != it.INCIDENT_CURRENT_ASSIGNED_USER AND ct.AUDIT_MAIN_CASE_DEL_FLAG!=1
        ORDER By it.MAIN_CASE_ID ASC ;
 
    CURSOR PENDING_MAIN_CUR IS 
      SELECT DOC_CASE_ID,CASE_CREATED_DIV,CASE_LAST_ACTION_DATE,AUDIT_AREA,AUDIT_MODE,CASE_CREATED_DATE,CASE_LAST_ACTION_STATUS,AUDIT_DIV,AUDIT_DIV_DESC
      FROM AUDIT_CASE_TBL
      WHERE CASE_LAST_ACTION_USER = currentUser AND CURRENT_ASSIGNED_USER != currentUser AND CASE_LAST_ACTION_STATUS != 3 AND AUDIT_MAIN_CASE_DEL_FLAG!=1 ORDER By DOC_CASE_ID ASC;
      
    DCS DASHBOARD_CASES;
    DC DASHBOARD_CASE;
  BEGIN
    DCS:=NEW DASHBOARD_CASES();
    IF(VIW=0)THEN
      FOR MAIN_CUR_REC IN MAIN_CUR LOOP
        DC:= NEW  DASHBOARD_CASE(0, '', NULL, 0, 0, NULL, '', 0,'','');
        DC.DOC_CASE_ID:=MAIN_CUR_REC.DOC_CASE_ID;
        DC.CASE_CREATED_DIV:=MAIN_CUR_REC.CASE_CREATED_DIV;
        DC.CASE_LAST_ACTION_DATE:=MAIN_CUR_REC.CASE_LAST_ACTION_DATE;
        DC.AUDIT_AREA:=MAIN_CUR_REC.AUDIT_AREA;
        DC.AUDIT_MODE:=MAIN_CUR_REC.AUDIT_MODE;
        DC.CASE_CREATED_DATE:=MAIN_CUR_REC.CASE_CREATED_DATE;
        DC.CASE_LAST_ACTION_STATUS:=MAIN_CUR_REC.CASE_LAST_ACTION_STATUS;
        DC.AUDIT_DIV := MAIN_CUR_REC.AUDIT_DIV;
        DC.AUDIT_DIV_DESC:=MAIN_CUR_REC.AUDIT_DIV_DESC;
        DC.CASE_STAT:=1; -- created by me
        
        DCS.EXTEND;
        DCS(DCS.LAST):=DC;
      END LOOP;
      
       FOR CASE_ASSIGNED_CUR_REC IN CASE_ASSIGNED_CUR LOOP
        DC:= NEW  DASHBOARD_CASE(0, '', NULL, 0, 0, NULL, '', 0,'','');
        DC.DOC_CASE_ID:=CASE_ASSIGNED_CUR_REC.MAIN_CASE_ID;
        DC.CASE_CREATED_DIV:=CASE_ASSIGNED_CUR_REC.CASE_CREATED_DIV;
        DC.CASE_LAST_ACTION_DATE:=CASE_ASSIGNED_CUR_REC.CASE_LAST_ACTION_DATE;
        DC.AUDIT_AREA:=CASE_ASSIGNED_CUR_REC.AUDIT_AREA;
        DC.AUDIT_MODE:=CASE_ASSIGNED_CUR_REC.AUDIT_MODE;
        DC.CASE_CREATED_DATE:=CASE_ASSIGNED_CUR_REC.CASE_CREATED_DATE;
        DC.CASE_LAST_ACTION_STATUS:=CASE_ASSIGNED_CUR_REC.CASE_LAST_ACTION_STATUS;
        DC.AUDIT_DIV_DESC:=CASE_ASSIGNED_CUR_REC.AUDIT_DIV_DESC;
        DC.CASE_STAT:=0;
        
        DCS.EXTEND;
        DCS(DCS.LAST):=DC;
      END LOOP;
      FOR CASE_INCI_CUR_REC IN CASE_INCI_CUR LOOP
        DC:= NEW  DASHBOARD_CASE(0, '', NULL, 0, 0, NULL, '', 0,'','');
        DC.DOC_CASE_ID:=CASE_INCI_CUR_REC.MAIN_CASE_ID;
        DC.CASE_CREATED_DIV:=CASE_INCI_CUR_REC.CASE_CREATED_DIV;
        DC.CASE_LAST_ACTION_DATE:=CASE_INCI_CUR_REC.CASE_LAST_ACTION_DATE;
        DC.AUDIT_AREA:=CASE_INCI_CUR_REC.AUDIT_AREA;
        DC.AUDIT_MODE:=CASE_INCI_CUR_REC.AUDIT_MODE;
        DC.CASE_CREATED_DATE:=CASE_INCI_CUR_REC.CASE_CREATED_DATE;
        DC.CASE_LAST_ACTION_STATUS:=CASE_INCI_CUR_REC.CASE_LAST_ACTION_STATUS;
        DC.AUDIT_DIV_DESC:=CASE_INCI_CUR_REC.AUDIT_DIV_DESC;
        DC.CASE_STAT:=0;
        
        DCS.EXTEND;
        DCS(DCS.LAST):=DC;
      END LOOP;
    END IF;
    IF(VIW=1)THEN
    FOR PENDING_MAIN_CUR_REC IN PENDING_MAIN_CUR LOOP
        DC:= NEW  DASHBOARD_CASE(0, '', NULL, 0, 0, NULL, '', 0,'','');
        DC.DOC_CASE_ID:=PENDING_MAIN_CUR_REC.DOC_CASE_ID;
        DC.CASE_CREATED_DIV:=PENDING_MAIN_CUR_REC.CASE_CREATED_DIV;
        DC.CASE_LAST_ACTION_DATE:=PENDING_MAIN_CUR_REC.CASE_LAST_ACTION_DATE;
        DC.AUDIT_AREA:=PENDING_MAIN_CUR_REC.AUDIT_AREA;
        DC.AUDIT_MODE:=PENDING_MAIN_CUR_REC.AUDIT_MODE;
        DC.CASE_CREATED_DATE:=PENDING_MAIN_CUR_REC.CASE_CREATED_DATE;
        DC.CASE_LAST_ACTION_STATUS:=PENDING_MAIN_CUR_REC.CASE_LAST_ACTION_STATUS;
        DC.AUDIT_DIV := PENDING_MAIN_CUR_REC.AUDIT_DIV;
        DC.AUDIT_DIV_DESC:=PENDING_MAIN_CUR_REC.AUDIT_DIV_DESC;
      --  DC.CASE_STAT:=1;
        
        DCS.EXTEND;
        DCS(DCS.LAST):=DC;
    
    END LOOP;
    END IF;
    
    RETURN DCS;
  END GET_DASHBOARD ;


  FUNCTION UPDATE_MAIN_CASE(main_case_id IN NUMBER,i_audit_div IN VARCHAR2,i_cover_from IN TIMESTAMP,i_cover_to IN TIMESTAMP,exam_p_from IN TIMESTAMP,exam_p_to IN TIMESTAMP) RETURN VARCHAR2 AS
   updateStatus VARCHAR2(10) := ''; 
    BEGIN
     UPDATE AUDIT_CASE_TBL
     SET COVER_FROM=i_cover_from, COVER_TO=i_cover_to, EXAM_PERIOD_FROM=exam_p_from, EXAM_PERIOD_TO=exam_p_to, AUDIT_DIV= i_audit_div
     WHERE DOC_CASE_ID=main_case_id ;
  
  --commit;
     dbms_output.put_line('Sucessfully 123 : - ' || sql%rowcount);
    if sql%rowcount > 0 then
   dbms_output.put_line('Sucessfully updated : - ');
   commit;
    updateStatus := 'SUCESS'; 
   ELSE
   dbms_output.put_line('Sucessfully FAIL : - '  );
   updateStatus := 'FAIL';
  end if;
    
    
    RETURN updateStatus;
  END UPDATE_MAIN_CASE;  
  
  
END DASHBOARD_PACK;
/