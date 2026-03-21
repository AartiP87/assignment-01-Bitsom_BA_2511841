## Storage Systems

The system uses a combination of a Data Lake, Data Warehouse, and Vector Database to support different requirements. A Data Lake is used to store raw and diverse data such as electronic health records, ICU vitals, and doctor notes. This is important because the data includes structured, semi-structured, and unstructured formats, and the lake allows flexible storage at scale.

A Data Warehouse is used for reporting purposes, such as generating monthly insights on bed occupancy and department costs. Since this data needs to be clean, structured, and optimized for fast querying, the warehouse enables efficient analytical processing.

A Vector Database is used to support natural language queries by doctors. Patient records and clinical notes are converted into embeddings and stored in this database. This allows semantic search, enabling doctors to ask questions in plain English and retrieve relevant patient history even if exact keywords are not used.

For real-time ICU data, a streaming system (such as Kafka) is used along with fast storage to process and store continuous vital signals. This ensures low-latency monitoring and alerting.

## OLTP vs OLAP Boundary

The OLTP system consists of operational systems such as electronic health records and hospital management systems, where data is continuously created and updated. These systems prioritize fast transactions and real-time updates.

The OLAP system begins once data is ingested into the Data Lake and then transformed into the Data Warehouse. At this stage, the focus shifts to analytics, reporting, and machine learning. The warehouse is used for historical analysis, while the data lake feeds AI models and advanced processing pipelines.

Thus, the boundary lies at the data ingestion layer, where transactional data is extracted and moved into analytical storage systems for further processing.

## Trade-offs

One significant trade-off in this design is between flexibility and complexity. While using multiple systems (Data Lake, Warehouse, Vector DB, streaming pipeline) provides scalability and supports diverse use cases, it also increases system complexity and maintenance overhead.

To mitigate this, the architecture can adopt a unified Data Lakehouse approach or use managed cloud services that integrate storage and processing. Additionally, proper data governance, monitoring, and automation can reduce operational complexity while maintaining performance and scalability.
