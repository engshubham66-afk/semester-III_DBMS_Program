-- 1. Verify basic connectivity and server time
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') AS server_time FROM dual;

-- 2. Confirm you are running Oracle 23ai / 26ai
SELECT version_full FROM v$instance;