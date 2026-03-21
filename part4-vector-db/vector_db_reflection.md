## Vector DB Use Case

A traditional keyword-based database search would not be sufficient for a law firm attempting to search through large 500-page contracts using natural language queries. Keyword-based systems rely on exact word matching, which makes them limited when the wording in the document differs from the user’s query. For example, if a lawyer searches for “termination clauses,” the document might instead contain phrases like “conditions for ending the agreement” or “contract cancellation terms.” A keyword search may fail to retrieve these relevant sections because the exact words do not match.

A vector database addresses this limitation by enabling semantic search. Instead of relying on keywords, it converts both the contract text and the user query into embeddings—numerical vector representations that capture the meaning of the text. In this vector space, semantically similar content is positioned closer together, even if the wording is different.

In practice, the contract would be divided into smaller chunks such as paragraphs, and embeddings would be generated and stored in a vector database. When a lawyer submits a query, it is also converted into an embedding, and the system retrieves the most semantically similar chunks based on similarity scores.

This approach significantly improves search accuracy and relevance. It allows lawyers to quickly locate meaningful information without needing to guess exact keywords, making the system far more efficient and intelligent than traditional keyword-based search.
