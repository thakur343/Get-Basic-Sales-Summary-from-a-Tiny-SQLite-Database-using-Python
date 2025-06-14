# 🧾 Task 7: Get Basic Sales Summary from a Tiny SQLite Database using Python

## 📌 Objective

Use SQL within a Python script to retrieve and visualize simple sales summary information such as:

- Total quantity sold per product  
- Total revenue per product  

These insights will be displayed using Python's print statements and a basic bar chart.

---

## 🛠️ Tools & Technologies Used

- **Python**  
  - `sqlite3` for database access  
  - `pandas` for data handling  
  - `matplotlib` for plotting  

- **SQLite**  
  - No external setup required, built into Python

- **Editor Options**  
  - Jupyter Notebook or a `.py` script file

---

## 🗃️ Dataset

Create a small SQLite database file:  
**`sales_data.db`**  

With **one table** named `sales`, having at least the following fields:
- `product`
- `quantity`
- `price`

Example schema:

```sql
CREATE TABLE sales (
  id INTEGER PRIMARY KEY,
  product TEXT,
  quantity INTEGER,
  price REAL
);
```

---

## 📤 Deliverables

A Python script or notebook that:
1. Connects to `sales_data.db`
2. Executes 1–2 SQL queries
3. Loads result into a pandas DataFrame
4. Prints a sales summary table
5. Displays a bar chart of revenue per product

---

## 🧭 Step-by-Step Guide

### 1. Load SQLite Database

```python
import sqlite3
conn = sqlite3.connect("sales_data.db")
```

### 2. Run SQL Query

```python
query = """
SELECT 
    product, 
    SUM(quantity) AS total_qty, 
    SUM(quantity * price) AS revenue 
FROM sales 
GROUP BY product
"""
```

### 3. Load Data into Pandas

```python
import pandas as pd
df = pd.read_sql_query(query, conn)
```

### 4. Print Results

```python
print(df)
```

### 5. Plot Bar Chart

```python
import matplotlib.pyplot as plt
df.plot(kind='bar', x='product', y='revenue', legend=False)
plt.title("Revenue per Product")
plt.xlabel("Product")
plt.ylabel("Revenue")
plt.tight_layout()
plt.show()
```

### 6. (Optional) Save Chart

```python
plt.savefig("sales_chart.png")
```

---

## 🎯 Learning Outcomes

By completing this task, you will:

- Understand how to write and execute SQL queries in Python
- Practice importing SQL data into pandas
- Summarize sales data effectively
- Create a simple sales bar chart using `matplotlib`

---

## 📎 Sample Output (for reference)

```
   product  total_qty  revenue
0   Apple         10    200.0
1  Banana         15    150.0
2  Orange         12    180.0
```



