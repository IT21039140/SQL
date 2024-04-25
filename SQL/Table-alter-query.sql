-----for AUDIT_CASE_TBL-------
ALTER TABLE AUDIT_CASE_TBL
    ADD RM_OVERALL_COMMENT BLOB,
        CURRENT_ASSIGNED_DIV VARCHAR2(5 BYTE),
        RM_OVERALL_COMMENT_STRING VARCHAR2(255 CHAR),
        OVERALL_RISK_CODE VARCHAR2(20 BYTE),
        OVERALL_RISK VARCHAR2(20 BYTE);


----for AUDIT_CHECK_LIST_TBL-------
ALTER TABLE AUDIT_CHECK_LIST_TBL
    ADD MAIN_AUDIT_AREA VARCHAR2(200 BYTE),
        PROCESS_EXAMINED VARCHAR2(200 BYTE),
        INCIDENT_COMMENTS_TEMPLATE CLOB,
        POTENTIAL_IMPACT VARCHAR2(1000 BYTE),
        RECOMMENDATIONS VARCHAR2(1000 BYTE);

----for AUDIT_COMMENT_TBL ------
ALTER TABLE AUDIT_COMMENT_TBL
    ADD NEXT_USER_DIV VARCHAR2(3 BYTE);

UPDATE AUDIT_DOC_TBL SET DEL_FLAG='0';

----for AUDIT_INCIDENT_LOG-----
ALTER TABLE AUDIT_INCIDENT_LOG
    ADD MAIN_CASE_ID NUMBER(10,0),
        CHILD_CASE_ID NUMBER(10,0),
        INCIDENT_ID NUMBER(10,0),
        AUDIT_STATUS VARCHAR2(5 BYTE),
        IMPACT VARCHAR2(20 BYTE), 
        LIKELIHOOD VARCHAR2(20 BYTE),
        OVERALL_RISK VARCHAR2(20 BYTE),
        SAMPLE_COUNT NUMBER(10,0),
        ISSUE_COUNT NUMBER(10,0),
        POTENTIAL_IMPACT VARCHAR2(4000 BYTE),
        RECOMMENDATION VARCHAR2(4000 BYTE),
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
        TARGET_DATE TIMESTAMP (6),
        DEL_FLAG NUMBER(2,0),
        LAST_NODE_ID VARCHAR2(20 BYTE),
        LAST_NODE_ELEMENT_ORDER VARCHAR2(20 BYTE),
        AUDIT_SECTION VARCHAR2(20 BYTE),
        BR_COMMENT_FLAG NUMBER(2,0),
        FYI NUMBER(2,0),
        OVERALL_INCIDENT_STATUS VARCHAR2(2 BYTE),
        FOLLOW_UP_RECTIFIED NUMBER(2,0),
        FOLLOW_UP_RECTIFIED_DATE TIMESTAMP (6),
        FOLLOW_UP_TARGET_DATE TIMESTAMP (6),
        FOLLOW_UP_RESPONSIBLE_OFFICER VARCHAR2(100 BYTE),
        BR_COMMENT BLOB,
        FUR_COMMENT BLOB,
        FOLLOW_UP_COMMENT BLOB,
        RM_COMMENT BLOB,
        OVERALL_RISK_VALUE FLOAT(126),
        LAST_MODIFIED_DIV VARCHAR2(255 CHAR),
        LAST_MODIFIED_LEVEL VARCHAR2(255 CHAR),
        CHANGES_FOR_AUDIT_COMMENT VARCHAR2(255 CHAR),
        FOLLOW_UP_AGREED NUMBER(10,0),
        QA_COMMENT BLOB;

----- for INCIDENT_TBL-------
ALTER TABLE AUDIT_INCIDENT_TBL
    ADD YEAR VARCHAR2(255 CHAR),
        FOLLOW_UP_AGREED NUMBER,
        CHANGES_FOR_AUDIT_COMMENT VARCHAR2(4000 BYTE),
        QA_COMMENT BLOB;

ALTER TABLE AUDIT_REPORT_SUMMARY
    ADD STAFF_STR6 VARCHAR2(50 BYTE),
        STAFF_STR7 VARCHAR2(50 BYTE),
        STAFF_STR8 VARCHAR2(50 BYTE),
        STAFF_STR9 VARCHAR2(50 BYTE),
        STAFF_STR10 VARCHAR2(50 BYTE);



