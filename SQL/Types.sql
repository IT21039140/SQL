

create or replace TYPE AUDIT_CASE_TYPE AS OBJECT 
(
  DOC_CASE_ID NUMBER(10,0),
  CASE_CREATED_DATE TIMESTAMP(6),
  CASE_CREATED_USER VARCHAR2(8 BYTE),
  CASE_LAST_ACTION_STATUS NUMBER(2,0),
  CASE_SPECIAL_COMMENT_VARCHAR VARCHAR2(1000 BYTE),
  CASE_LAST_ACTION_DATE TIMESTAMP(6),
  CASE_LAST_ACTION_USER VARCHAR2(8 BYTE),
  CASE_LAST_ACTION_USER_LEVEL NUMBER(4,0),
  LAST_NODE_ID NUMBER(8,0),
  CASE_CREATED_DIV VARCHAR2(5 BYTE),
  LAST_NODE_ELEMENT_ORDER NUMBER(3,0),
  CASE_CREATED_USER_LEVEL NUMBER(4,0),
  CURRENT_ASSIGNED_USER VARCHAR2(8 BYTE),
  CURRENT_ASSIGNED_USER_LEVEL NUMBER(4,0),
  CASE_SPECIAL_COMMENT BLOB,
  CASE_RESPONSIBLE_USER VARCHAR2(8 BYTE),
  AUDIT_AREA VARCHAR2(20 BYTE),
  RISK_CAL_CODE VARCHAR2(20 BYTE),
  AUDIT_MODE VARCHAR2(20 BYTE),
  YEAR NUMBER(4,0),
  COVER_FROM TIMESTAMP(6),
  COVER_TO TIMESTAMP(6),
  EXAM_PERIOD_FROM TIMESTAMP(6),
  EXAM_PERIOD_TO TIMESTAMP(6),
  AUDIT_DIV VARCHAR2(5 BYTE),
  CURRENT_ASSIGN_USER_NAME VARCHAR2(255 CHAR),
  CREATED_USER_NAME VARCHAR2(255 CHAR),
  AUDIT_DIV_DESC VARCHAR2(100 BYTE),
  OVERALL_AUDIT_STATUS VARCHAR2(2 BYTE)
);
/

create or replace TYPE AUDIT_CASE_TYPE_LIST AS TABLE OF AUDIT_CASE_TYPE;
/

create or replace TYPE AUDIT_COMMENT_TYPE AS OBJECT 
( 
  MAIN_CASE_ID NUMBER(10),
  COMMENT_TYPE VARCHAR2(20),
  COMMENT_USER_ID VARCHAR2(20),
  COMMENT_USER_DIV VARCHAR2(3),
  AUDIT_COMMENT BLOB,
  COMMENT_DATE TIMESTAMP,
  ACTION NUMBER(2),
  NEXT_USER VARCHAR2(20) 
);
/

create or replace TYPE AUDIT_COMMENT_TYPE_LIST AS TABLE OF AUDIT_COMMENT_TYPE;
/

create or replace TYPE AUDIT_COMMON_DETAILS AS OBJECT 
( 
  DOC_CASE_ID NUMBER(10),
  AUDIT_DIV VARCHAR2(5),
  COVER_FROM TIMESTAMP,
  COVER_TO TIMESTAMP,
  EXAM_PERIOD_FROM TIMESTAMP,
  EXAM_PERIOD_TO TIMESTAMP
);
/
create or replace TYPE AUDIT_COMMON_DETAILS_LIST AS TABLE OF AUDIT_COMMON_DETAILS;
/


create or replace TYPE AUDIT_SUMMARY_DATA AS OBJECT 
( 
  AUDIT_DIV VARCHAR2(5 BYTE),
  AUDIT_DIV_DESC VARCHAR2(100 BYTE),
  COVER_FROM TIMESTAMP(6),
  COVER_TO TIMESTAMP(6),
  EXAM_PERIOD_FROM TIMESTAMP(6),
  EXAM_PERIOD_TO TIMESTAMP(6),
  AUDIT_MODE VARCHAR2(20 BYTE),

  EXIT_MEETING_DATE TIMESTAMP(6),
  DRAFT_REPORT_ISSUED_DATE TIMESTAMP(6),
  RESPONSE_DATE TIMESTAMP(6),
  RESPONSE_RECEIVE_DATE TIMESTAMP(6),
  FINAL_REPORT_ISSUED_DATE TIMESTAMP(6),
  
  REVIEWER1 VARCHAR2(50 BYTE),
  REVIEWER2 VARCHAR2(50 BYTE),
  REVIEWER3 VARCHAR2(50 BYTE),
  REVIEWER4 VARCHAR2(50 BYTE),
  
  EXAMINER1 VARCHAR2(50 BYTE),
  EXAMINER2 VARCHAR2(50 BYTE),
  EXAMINER3 VARCHAR2(50 BYTE),
  EXAMINER4 VARCHAR2(50 BYTE),
  EXAMINER5 VARCHAR2(50 BYTE),
  EXAMINER6 VARCHAR2(50 BYTE),

  BR_MANAGER VARCHAR2(50 BYTE),
  ASST_MANAGER VARCHAR2(50 BYTE),
  STAFF_STR1 VARCHAR2(50 BYTE),
  STAFF_STR2 VARCHAR2(50 BYTE),
  STAFF_STR3 VARCHAR2(50 BYTE),
  STAFF_STR4 VARCHAR2(50 BYTE),
  STAFF_STR5 VARCHAR2(50 BYTE)
);
/

create or replace TYPE AUDIT_SUMMARY_DATA_LIST  AS TABLE OF AUDIT_SUMMARY_DATA;
/

-- updated on 15-12-2023
-- for UAT forcefully drop AUDIT_INSIDENT_TYPE and run
create or replace TYPE AUDIT_INSIDENT_TYPE AS OBJECT 
( 
  MAIN_CASE_ID NUMBER(10,0), 
	CHILD_CASE_ID NUMBER(10,0), 
	INCIDENT_ID NUMBER(10,0) , 
	AUDIT_STATUS VARCHAR2(5 BYTE), 
	IMPACT VARCHAR2(20 BYTE), 
	LIKELIHOOD VARCHAR2(20 BYTE), 
	OVERALL_RISK VARCHAR2(20 BYTE), 
	SAMPLE_COUNT NUMBER(10,0), 
	ISSUE_COUNT NUMBER(10,0), 
	POTENTIAL_IMPACT VARCHAR2(1000 BYTE), 
	RECOMMENDATION VARCHAR2(1000 BYTE), 
	ROOT_CAUSE VARCHAR2(200 BYTE), 
	DETAILS_ROOT_CAUSE VARCHAR2(1000 BYTE), 
	AGREE_WITH_AUDIT NUMBER(2,0), 
	RESPONSIBLE_OFFICER VARCHAR2(100 BYTE), 
	RECTIFIED NUMBER(2,0), 
	RECTIFY_DATE TIMESTAMP (6), 
	COMMENT_HEADING VARCHAR2(200 BYTE), 
	INCIDENT_COMMENT BLOB, 
	LAST_NODE1 VARCHAR2(20 BYTE), 
	LAST_NODE_ORDER1 VARCHAR2(20 BYTE), 
	LAST_NODE2 VARCHAR2(20 BYTE), 
	LAST_NODE_ORDER2 VARCHAR2(20 BYTE), 
	LAST_NODE3 VARCHAR2(20 BYTE), 
	LAST_NODE_ORDER3 VARCHAR2(20 BYTE), 
	LAST_NODE4 VARCHAR2(20 BYTE), 
	LAST_NODE_ORDER4 VARCHAR2(20 BYTE), 
	LAST_NODE5 VARCHAR2(20 BYTE), 
	LAST_NODE_ORDER5 VARCHAR2(20 BYTE), 
	INCIDENT_CREATED_USER VARCHAR2(8 BYTE), 
	INCIDENT_CURRENT_ASSIGNED_USER VARCHAR2(8 BYTE), 
	INCIDENT_CREATED_DIV VARCHAR2(5 BYTE), 
	INCIDENT_CURRENT_ASSIGNED_DIV VARCHAR2(5 BYTE), 
	HR NUMBER(2,0), 
	POLICIES_AND_PROCEDURE NUMBER(2,0), 
	PROCESS_AND_EXECUTION NUMBER(2,0), 
	IT NUMBER(2,0), 
	PERFORMANCE_MEASUREMENT NUMBER(2,0), 
	NODE_DESCRIPTION1 VARCHAR2(1000 BYTE),
	NODE_DESCRIPTION2 VARCHAR2(1000 BYTE),
	NODE_DESCRIPTION3 VARCHAR2(1000 BYTE),
	NODE_DESCRIPTION4 VARCHAR2(1000 BYTE),
	NODE_DESCRIPTION5 VARCHAR2(1000 BYTE),
  CASE_CREATED_USER VARCHAR2(8 BYTE),
  BR_COMMENT_FLAG NUMBER(2,0),
  LAST_NODE_ID VARCHAR2(20 BYTE),
  LAST_NODE_ELEMENT_ORDER VARCHAR2(20 BYTE),
	OVERALL_INCIDENT_STATUS VARCHAR2(2 BYTE),
  FOLLOW_UP_RECTIFIED NUMBER(2,0),
  FOLLOW_UP_RECTIFIED_DATE TIMESTAMP (6), 
  FOLLOW_UP_TARGET_DATE TIMESTAMP (6),
  FOLLOW_UP_RESPONSIBLE_OFFICER VARCHAR2(100 BYTE),
  TARGET_DATE TIMESTAMP(6),
  BR_COMMENT BLOB,
  FUR_COMMENT BLOB,
  FOLLOW_UP_COMMENT BLOB,
  OVERALL_RISK_VALUE FLOAT
);
/
create or replace TYPE AUDIT_INSIDENT_TYPE_LIST AS TABLE OF AUDIT_INSIDENT_TYPE;
/