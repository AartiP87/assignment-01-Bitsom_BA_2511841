-- Customers
CREATE TABLE Customers (
  customer_id VARCHAR(10) PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  city VARCHAR(50) NOT NULL
);

-- Products
CREATE TABLE Products (
  product_id VARCHAR(10) PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  category VARCHAR(50) NOT NULL,
  unit_price DECIMAL(10,2) NOT NULL
);

-- Sales Representatives
CREATE TABLE Sales_Reps (
  sales_rep_id VARCHAR(10) PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  office_address VARCHAR(200) NOT NULL
);

-- Orders
CREATE TABLE Orders (
  order_id VARCHAR(10) PRIMARY KEY,
  customer_id VARCHAR(10) NOT NULL,
  sales_rep_id VARCHAR(10) NOT NULL,
  order_date DATE NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
  FOREIGN KEY (sales_rep_id) REFERENCES Sales_Reps(sales_rep_id)
);

-- Order Items
CREATE TABLE Order_Items (
  order_id VARCHAR(10),
  product_id VARCHAR(10),
  quantity INT NOT NULL,
  PRIMARY KEY (order_id, product_id),
  FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
