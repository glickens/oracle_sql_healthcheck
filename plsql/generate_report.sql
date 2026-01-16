-- plsql/generate_report.sql
-- Generates a small report block using DBMS_OUTPUT (template)

SET SERVEROUTPUT ON;

DECLARE
  v_now VARCHAR2(19);
BEGIN
  v_now := TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS');

  DBMS_OUTPUT.PUT_LINE('============================');
  DBMS_OUTPUT.PUT_LINE('PL/SQL Report Section');
  DBMS_OUTPUT.PUT_LINE('============================');
  DBMS_OUTPUT.PUT_LINE('Generated at: ' || v_now);

  -- Template: add SELECT...INTO checks later
  DBMS_OUTPUT.PUT_LINE('Status: OK (template)');
END;
/
