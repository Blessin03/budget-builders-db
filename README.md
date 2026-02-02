# budget-builders-db

## Summary
Designed and implemented a relational database for a construction services company, with an emphasis on data modeling, normalization, and practical SQL queries supporting day-to-day business operations.

SQL queries are provided to support real-world operational needs such as reporting, data retrieval, and basic business analysis.

## Repository Structure
```
docs
  /evidence        # Supporting documentation and project evidence
  /original        # Original academic submissions (unchanged)
/sql               # SQL scripts (schema, queries, and data operations)
/tests             # Test queries and validation
LICENSE            # Project license
README.md          # Project overview and documentation
```

## Academic Baseline
This repository is based on an academic database project. All original submission materials are preserved unchanged in:
```
/doc/original
```

**Any enhancements, restructuring, or extensions are implemented outside of this directory to maintain academic integrity.**

## Run Order

I run the SQL files in this order on a fresh database:

1. sql/01_schema.sql
2. sql/04_seed.sql
3. sql/02_constraints.sql
4. sql/03_views.sql
5. sql/05_reports.sql

Run FK tests with tests/00_fk_integrity.sql.