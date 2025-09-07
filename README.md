# Database SQL Project

A lightweight, but robust MySQL schema and routines that model HR job postings, applications, evaluations, and audit logging.

## Purpose
A small HR/job-application MySQL schema with:
- user/employee/evaluator management
- job postings and applications (live and history)
- evaluation scoring and selection
- triggers for auditing and application rules

## Schema & main objects
- Database and tables defined in [pre-functionality-phase/create.sql](pre-functionality-phase/create.sql).
- Initial seed / sample data in [pre-functionality-phase/insertfinal.sql](pre-functionality-phase/insertfinal.sql).

Key stored routines and functions:
- [`ManageApplication`](stored/manage_application.sql) — create / activate / cancel applications
- [`evaluate`](stored/evaluate.sql) — evaluate an application and insert into evaluations
- [`GetEvaluationGrade`](stored/evaluation_stored.sql) — fetch evaluation grade
- [`getHistoryByRange`](stored/historybyrange.sql) — query apps_history by score range
- [`GenerateHistory`](stored/generate_history.sql) — bulk-generate apps_history rows
- [`applicationByEvaluation`](stored/applicationbyeval.sql) — list historical applications for an evaluator
- [`applicationWinner`](stored/applicationwinner.sql) — pick winning candidate for a job
- [`CalculateScore`](stored/calculategrade.sql) — scoring function used by evaluators

Triggers:
- Application business rules in [triggers/applicationstriggers.sql](/triggers/applicationstriggers.sql) (e.g. submission/cancellation date checks).
- Audit/logging triggers in [triggers/triggerslog.sql](/triggers/triggerslog.sql).

## Quick deploy
1. Create the DB and schema:
   mysql -u <user> -p < pre-functionality-phase/create.sql
2. Load stored procedures/functions:
   mysql -u <user> -p < stored/*.sql
3. Load triggers:
   mysql -u <user> -p < triggers/*.sql
4. Insert sample data:
   mysql -u <user> -p < pre-functionality-phase/insertfinal.sql
