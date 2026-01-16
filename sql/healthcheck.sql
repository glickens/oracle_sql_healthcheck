-- sql/healthcheck.sql
-- Basic database health summary (Oracle-friendly templates)

SET PAGESIZE 200
SET LINESIZE 200
SET FEEDBACK ON
SET HEADING ON

PROMPT ============================
PROMPT Database Healthcheck Report
PROMPT ============================

PROMPT Report time:
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') AS report_time FROM dual;

PROMPT
PROMPT Current user:
SELECT USER AS current_user FROM dual;

PROMPT
PROMPT Object counts by type (current schema):
SELECT object_type, COUNT(*) AS cnt
FROM user_objects
GROUP BY object_type
ORDER BY cnt DESC;
