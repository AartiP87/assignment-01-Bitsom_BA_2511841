-- =========================
-- DROP TABLES (Safe Reset)
-- =========================
DROP TABLE IF EXISTS Order_Items;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Sales_Reps;

-- =========================
-- TABLE: Customers
-- =========================
CREATE TABLE Customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_city VARCHAR(50) NOT NULL
);

-- =========================
-- TABLE: Products
-- =========================
CREATE TABLE Products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

-- =========================
-- TABLE: Sales_Reps
-- =========================
CREATE TABLE Sales_Reps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100) NOT NULL,
    office_address VARCHAR(200) NOT NULL
);

-- =========================
-- TABLE: Orders
-- =========================
CREATE TABLE Orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10) NOT NULL,
    sales_rep_id VARCHAR(10) NOT NULL,
    order_date DATE NOT NULL,
    CONSTRAINT fk_customer
        FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_sales_rep
        FOREIGN KEY (sales_rep_id) REFERENCES Sales_Reps(sales_rep_id)
        ON DELETE CASCADE
);

-- =========================
-- TABLE: Order_Items
-- =========================
CREATE TABLE Order_Items (
    order_id VARCHAR(10) NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    PRIMARY KEY (order_id, product_id),
    CONSTRAINT fk_order
        FOREIGN KEY (order_id) REFERENCES Orders(order_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_product
        FOREIGN KEY (product_id) REFERENCES Products(product_id)
        ON DELETE CASCADE
);

-- =========================
-- INSERT DATA: Customers
-- =========================
INSERT INTO Customers (customer_id, customer_name, customer_email, customer_city) VALUES
('C101','Amit Sharma','amit@gmail.com','Mumbai'),
('C102','Priya Singh','priya@gmail.com','Delhi'),
('C103','Rahul Jain','rahul@gmail.com','Pune'),
('C104','Neha Kapoor','neha@gmail.com','Mumbai'),
('C105','Vikas Mehta','vikas@gmail.com','Bangalore');

-- =========================
-- INSERT DATA: Products
-- =========================
INSERT INTO Products (product_id, product_name, category, unit_price) VALUES
('P101','Laptop','Electronics',60000.00),
('P102','Smartphone','Electronics',20000.00),
('P103','Table','Furniture',5000.00),
('P104','Chair','Furniture',2000.00),
('P105','Headphones','Accessories',1500.00);

-- =========================
-- INSERT DATA: Sales_Reps
-- =========================
INSERT INTO Sales_Reps (sales_rep_id, sales_rep_name, sales_rep_email, office_address) VALUES
('SR001','Raj Verma','raj@gmail.com','Delhi Office'),
('SR002','Anita Shah','anita@gmail.com','Mumbai HQ'),
('SR003','Karan Patel','karan@gmail.com','Pune Office'),
('SR004','Simran Kaur','simran@gmail.com','Delhi Office'),
('SR005','Arjun Nair','arjun@gmail.com','Bangalore Office');

-- =========================
-- INSERT DATA: Orders
-- =========================
INSERT INTO Orders (order_id, customer_id, sales_rep_id, order_date) VALUES
('ORD001','C101','SR002','2024-01-01'),
('ORD002','C102','SR001','2024-01-02'),
('ORD003','C103','SR003','2024-01-03'),
('ORD004','C104','SR002','2024-01-04'),
('ORD005','C105','SR005','2024-01-05');

-- =========================
-- INSERT DATA: Order_Items
-- =========================
INSERT INTO Order_Items (order_id, product_id, quantity) VALUES
('ORD001','P101',1),
('ORD001','P105',2),
('ORD002','P102',1),
('ORD003','P103',3),
('ORD004','P104',4);
