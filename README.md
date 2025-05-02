# 📚 PostgreSQL Bookstore Management Project

This project is a structured relational database designed using **PostgreSQL** for managing a fictional bookstore. It includes data for **customers**, **books**, and **orders**, with realistic datasets imported from CSV files.

## 🗂️ Project Structure

- `customers.csv`: Contains customer details (name, contact, location).
- `books.csv`: Contains book information (title, genre, author, price, stock).
- `orders.csv`: Contains order records (quantities, total amounts, dates).

## 🛠️ Features

- Create and manage normalized tables with appropriate data types and keys.
- Import data from CSV files using `COPY` statements.
- Perform business-focused SQL queries:
  - Most expensive books
  - Total revenue
  - Remaining stock after sales
  - Customer spending insights
  - Book sales by genre or author
  - And more...

## 📊 Sample SQL Queries

Here are some of the queries included:

- Retrieve all books in the “Fantasy” genre
- Calculate total revenue generated
- List customers who placed at least 2 orders
- Show the most frequently ordered book
- Calculate remaining stock after fulfilling orders

## 🔧 Technologies Used

- **PostgreSQL**
- SQL (DDL, DML, Joins, Aggregates, Subqueries)
- CSV for data import

## 📌 Use Cases

This project is suitable for:

- Practicing SQL for data analysts or database developers.
- Demonstrating database skills in job interviews or resumes.
- Learning data import and reporting using PostgreSQL.

