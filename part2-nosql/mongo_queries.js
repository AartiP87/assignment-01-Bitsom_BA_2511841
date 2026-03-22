// Connect to database (assumes you already selected DB)
const collection = db.products;

/*
OP1: insertMany() — insert all 3 documents
*/
collection.insertMany([
  {
    _id: 1,
    name: "Samsung 55-inch Smart TV",
    category: "Electronics",
    price: 45000,
    brand: "Samsung",
    warranty_years: 2,
    specs: {
      resolution: "4K",
      screen_size: "55 inch",
      voltage: "220V"
    },
    features: ["Smart TV", "WiFi", "HDR"]
  },
  {
    _id: 2,
    name: "Men's Denim Jacket",
    category: "Clothing",
    price: 2500,
    brand: "Levi's",
    size: ["S", "M", "L", "XL"],
    material: "Denim",
    color: "Blue",
    ratings: {
      average: 4.5,
      reviews: 120
    }
  },
  {
    _id: 3,
    name: "Organic Milk 1L",
    category: "Groceries",
    price: 60,
    brand: "Amul",
    expiry_date: new Date("2024-12-20"),
    nutritional_info: {
      calories: 150,
      fat: "8g",
      protein: "6g"
    },
    storage_instructions: ["Keep refrigerated", "Do not freeze"]
  }
]);

/*
OP2: find() — retrieve all Electronics products with price > 20000
*/
collection.find({
  category: "Electronics",
  price: { $gt: 20000 }
});

/*
OP3: find() — retrieve all Groceries expiring before 2025-01-01
*/
collection.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") }
});

/*
OP4: updateOne() — add a "discount_percent" field to a specific product
*/
collection.updateOne(
  { _id: 1 },
  {
    $set: { discount_percent: 10 }
  }
);

/*
OP5: createIndex() — create an index on category field and explain why
*/
collection.createIndex({ category: 1 });

/*
Explanation:
Creating an index on the "category" field improves query performance,
especially for frequent searches like filtering products by category
(e.g., Electronics, Clothing, Groceries). It reduces scan time and
makes retrieval faster.
*/
