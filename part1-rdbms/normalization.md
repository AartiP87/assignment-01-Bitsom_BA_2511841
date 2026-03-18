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
