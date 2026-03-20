## ETL Decisions

### Decision 1 — Date Format Standardization
Problem: The raw data contained inconsistent date formats such as DD-MM-YYYY, MM/DD/YYYY, and text-based dates.
Resolution: All dates were converted into a standard ISO format (YYYY-MM-DD) before loading into the dim_date table. This ensures consistency and enables reliable time-based analysis.

---

### Decision 2 — Handling NULL Values
Problem: Some records had NULL values in important fields such as quantity and price, which would break aggregations.
Resolution: NULL quantities were replaced with 0 where appropriate, and rows with missing critical fields (like product or price) were either corrected or excluded. This ensured data integrity in the fact table.

---

### Decision 3 — Category Normalization
Problem: Product categories appeared in inconsistent casing (e.g., "Electronics", "electronics", "ELECTRONICS").
Resolution: All category values were standardized to lowercase during transformation. This prevents duplicate groupings and ensures accurate aggregation in analytical queries.
