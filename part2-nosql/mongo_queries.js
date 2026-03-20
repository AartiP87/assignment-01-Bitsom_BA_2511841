// OP1: insertMany() — insert all 3 documents
db.products.insertMany([
  {
    product_id: "E1001",
    name: "Smartphone XYZ",
    category: "Electronics",
    price: 25000,
    brand: "TechBrand",
    specifications: {
      ram: "8GB",
      storage: "128GB",
      battery: "5000mAh"
    },
    warranty_years: 2,
    available: true
  },
  {
    product_id: "G2001",
    name: "Organic Milk",
    category: "Groceries",
    price: 60,
    expiry_date: new Date("2024-12-20"),
    brand: "FreshFarm",
    quantity: {
      value: 1,
      unit: "liter"
    },
    storage_instructions: ["Keep refrigerated", "Consume within 2 days after opening"]
  },
  {
    product_id: "C3001",
    name: "Men's Casual Shirt",
    category: "Clothing",
    price: 1200,
    brand: "FashionHub",
    sizes_available: ["S", "M", "L", "XL"],
    material: "Cotton",
    color_options: ["Blue", "Black"],
    ratings: [
      { user: "Amit", rating: 4 },
      { user: "Rahul", rating: 5 }
    ]
  }
]);

// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});

// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") }
});

// OP4: updateOne() — add a "discount_percent" field
db.products.updateOne(
  { product_id: "E1001" },
  { $set: { discount_percent: 10 } }
);

// OP5: createIndex() — create index on category field
db.products.createIndex({ category: 1 });

// Explanation:
// Creating an index on the "category" field improves query performance
// because many queries (like filtering Electronics or Groceries)
// frequently use this field. Indexing reduces search time by avoiding
// full collection scans.
