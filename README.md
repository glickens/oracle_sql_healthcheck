# oracle_sql_healthcheck

SQL + PL/SQL healthcheck scripts with a Linux runner that generates timestamped reports.

This repo is meant to demonstrate:
- **SQL / PL/SQL fundamentals** (queries, schema inspection, DBMS_OUTPUT reporting)
- **UNIX/Linux scripting** (running scripts, saving output, timestamped reports)
- A realistic workflow used in ops + telecom environments

---

## Repo structure

- `sql/healthcheck.sql`  
  SQL summary checks (time, user, object counts)

- `plsql/generate_report.sql`  
  PL/SQL template report section using `DBMS_OUTPUT`

- `scripts/run_healthcheck.sh`  
  Linux runner that executes the SQL + PL/SQL scripts via `sqlplus` and writes a report file

---

## Requirements

- Oracle client tools installed
- `sqlplus` available in your PATH
- A valid Oracle connection string

---

## Run (Linux / macOS)

Make the script executable:

```bash
chmod +x scripts/run_healthcheck.sh

Run it (example connection string):

./scripts/run_healthcheck.sh user/pass@host:1521/service

The script writes a timestamped report file to:

reports/healthcheck_YYYYMMDD_HHMMSS.txt

What the report contains (example)

Report time and current schema user

Object counts by type (tables, views, procedures, etc.)

A PL/SQL “Report Section” block (template)

Notes

The SQL and PL/SQL scripts are written as templates that you can extend with real checks
(e.g., failed login counts, slow queries, error summaries, job status).

This repo is designed to mirror how teams automate operational checks in UNIX/Linux + Oracle environments.
