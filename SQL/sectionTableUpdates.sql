ALTER TABLE AUDIT_SECTION_TBL ADD RISK_CAL_CODE VARCHAR2(20);

UPDATE AUDIT_SECTION_TBL SET RISK_CAL_CODE = 'v_1';
COMMIT;

ALTER TABLE AUDIT_SECTION_TBL DROP CONSTRAINT AUDIT_SECTION_TBL_PK;

ALTER TABLE AUDIT_SECTION_TBL ADD CONSTRAINT AUDIT_SECTION_TBL_PK PRIMARY KEY (PARENT_NODE, PARENT_NODE_ORDER, YEAR);

INSERT INTO AUDIT_SECTION_TBL (PARENT_NODE, PARENT_NODE_ORDER, DIV_CODE, AUDIT_AREA, AUDIT_MODE, SECTION_DESCRIPTION, SECTION_AREA, YEAR, RISK_CAL_CODE)
SELECT PARENT_NODE, PARENT_NODE_ORDER, DIV_CODE, AUDIT_AREA, AUDIT_MODE, SECTION_DESCRIPTION, SECTION_AREA, '2024' AS YEAR, RISK_CAL_CODE
FROM AUDIT_SECTION_TBL;
COMMIT;


------audit case table-----6/12/23
ALTER TABLE AUDIT_CASE_TBL ADD AUDIT_MAIN_CASE_DEL_FLAG VARCHAR2(2);

UPDATE AUDIT_CASE_TBL SET AUDIT_MAIN_CASE_DEL_FLAG = '0';
COMMIT;

---add column to the incident tbl-------7/12/23
ALTER TABLE AUDIT_INCIDENT_TBL ADD OVERALL_RISK_VALUE FLOAT(126);