## Anomaly Analysis
below are examples of anomalies from dataset.

1. An Insert Anomaly
   If a new product is added but no customer has ordered it yet, we cannot insert it into thr flat file without dummy customer/order data.
   example: there is no row for product like "Tablet" unless tied to a customer/order.

2. An Update Anomaly
   - Customer or sales rep details are repeated across multiple rows. If Anita Desai’s email changes, it must be updated in every row where she appears.
   Example: SR02, Anita Desai, anita@corp.com appears in many rows (ORD1027, ORD1131, ORD1035, etc.). Updating her email requires multiple changes, risking inconsistency.
   
3. Delete Anomaly
   - If the only order for a product is deleted, we lose product information entirely.
   Example: ORD1185 is the only order for product P008, Webcam. Deleting this order would erase all record of the Webcam product.

Q."Your manager argues that keeping everything in one table is simpler and normalization is over-engineering. Using specific examples from the dataset, defend or refute this position."

Ans. At first glance, keeping all information in a single flat table may seem simpler. However, this design quickly leads to anomalies and inefficiencies. The orders_flat.csv file demonstrates several such issues.

For example, customer details are repeated across multiple rows. Priya Sharma (C002) appears in many orders, with her email priya@gmail.com stored repeatedly. If her email changes, every row must be updated. Missing one row would cause inconsistent data — a clear update anomaly. By normalizing into a Customers table, Priya’s information is stored once, and all orders reference her via customer_id.

Similarly, product information is tied directly to orders. The product Webcam (P008) only appears in order ORD1185. If that order is deleted, the company loses all record of the Webcam product — a delete anomaly. In a normalized schema, products exist independently in a Products table, ensuring they remain even if no orders reference them.

Insert anomalies also occur. Suppose the company wants to add a new product, like a Tablet. In the flat file, it cannot be added unless tied to a customer and order. This forces artificial data entry. With normalization, the product can be added directly to the Products table without requiring dummy orders.

Normalization into Third Normal Form (3NF) eliminates these problems. Customers, products, and sales representatives are stored once, with relationships maintained through foreign keys. Orders and order items link these entities together, ensuring consistency and scalability. Queries become more reliable: for instance, calculating total sales per city or identifying top-selling products is straightforward without redundant data inflating results.

In short, normalization is not over-engineering. It is a necessary safeguard against anomalies, ensuring data integrity, reducing redundancy, and supporting the company’s growth with a clean, scalable database design.
