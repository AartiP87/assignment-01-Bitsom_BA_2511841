-- =========================
-- DIMENSION TABLES
-- =========================

CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE,
    day INT,
    month INT,
    year INT
);

CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

-- =========================
-- FACT TABLE
-- =========================

CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY,
    date_id INT,
    store_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    total_amount DECIMAL(10,2),

    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- =========================
-- INSERT CLEANED DATA
-- =========================

-- Dates (standardized YYYY-MM-DD)
INSERT INTO dim_date VALUES
(1, '2024-01-01', 1, 1, 2024),
(2, '2024-01-02', 2, 1, 2024),
(3, '2024-02-01', 1, 2, 2024),
(4, '2024-02-05', 5, 2, 2024);

-- Stores
INSERT INTO dim_store VALUES
(1, 'Store A', 'Mumbai'),
(2, 'Store B', 'Delhi'),
(3, 'Store C', 'Bangalore');

-- Products (category standardized to lowercase)
INSERT INTO dim_product VALUES
(1, 'Laptop', 'electronics'),
(2, 'Phone', 'electronics'),
(3, 'Shirt', 'apparel'),
(4, 'Shoes', 'apparel');

-- Fact table (cleaned: no NULLs, consistent pricing, computed totals)
INSERT INTO fact_sales VALUES
(1, 1, 1, 1, 2, 50000, 100000),
(2, 1, 2, 2, 3, 20000, 60000),
(3, 2, 1, 3, 5, 1000, 5000),
(4, 2, 3, 4, 2, 3000, 6000),
(5, 3, 2, 1, 1, 52000, 52000),
(6, 3, 3, 2, 4, 21000, 84000),
(7, 3, 1, 3, 6, 1200, 7200),
(8, 4, 2, 4, 3, 3200, 9600),
(9, 4, 3, 1, 2, 51000, 102000),
(10, 4, 1, 2, 1, 22000, 22000);
