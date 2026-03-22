## Vector DB Use Case

A traditional keyword-based database search would not be sufficient for a system that allows lawyers to query 500-page contracts using natural language. Keyword search depends on exact word matches, which makes it ineffective when different terms are used to express the same concept. For example, a search for "termination clauses" may miss relevant sections labeled as "contract cancellation" or "end of agreement." This lack of semantic understanding can lead to incomplete or inaccurate results.

In contrast, a vector database enables semantic search by representing text as numerical embeddings that capture meaning and context. Both the contract content and user queries are converted into vectors, allowing the system to compare them based on similarity rather than exact wording. This means that even if the query and document use different vocabulary, the system can still retrieve relevant information.

In this use case, the vector database would store embeddings of smaller chunks of the contracts, making it easier to search large documents efficiently. When a lawyer submits a query, its embedding is compared with stored embeddings to find the most relevant sections. This approach significantly improves accuracy, speed, and usability, making it ideal for handling complex legal documents.
