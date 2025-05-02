-- Name: Ahsan Sheeraz
-- Github: https://github.com/ahsansheeraz
-- Linkedin: https://pk.linkedin.com/in/ahsansherraz

-- Create Tables

CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);

CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);

CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;


-- Import Data into Books Table
COPY Books(Book_ID, Title, Author, Genre, Published_Year, Price, Stock) 
FROM 'F:\Data analyst projects\SQL\SQL PROJECT-1\Books.csv' 
CSV HEADER;

-- Import Data into Customers Table
COPY Customers(Customer_ID, Name, Email, Phone, City, Country) 
FROM 'F:\Data analyst projects\SQL\SQL PROJECT-1\Customers.csv' 
CSV HEADER;

-- Import Data into Orders Table
COPY Orders(Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount) 
FROM 'F:\Data analyst projects\SQL\SQL PROJECT-1\Orders.csv' 
CSV HEADER;


-- 1) Retrieve all books in the "Fiction" genre:

SELECT * 
FROM books
WHERE genre = 'Fiction';


-- ) Find books published after the year 1950:

SELECT * 
FROM books
WHERE published_year > 1950;

-- ) List all customers from the Canada:

SELECT * 
FROM customers
WHERE country = 'Canada';

-- ) Show orders placed in November 2023:
SELECT * 
FROM orders
WHERE order_date >= '2023-11-01' AND order_date < '2023-12-01';


-- ) Retrieve the total stock of books available:

SELECT SUM(stock) AS total_stock
FROM books;

-- ) Find the details of the most expensive book:

SELECT * 
FROM books
ORDER BY price DESC
LIMIT 1;

-- ) Show all customers who ordered more than 1 quantity of a book:

select * from orders where quantity>1;

-- ) Retrieve all orders where the total amount exceeds $20:

SELECT * 
FROM orders
WHERE total_amount > 20;

-- ) List all genres available in the Books table:

SELECT DISTINCT genre 
FROM books;


-- ) Find the book with the lowest stock:

SELECT * 
FROM books
ORDER BY stock ASC
LIMIT 1;

-- ) Calculate the total revenue generated from all orders:

SELECT SUM(total_amount) AS total_revenue
FROM orders;


-- Advance Questions : 

-- ) Retrieve the total number of books sold for each genre:

SELECT b.genre, SUM(o.quantity) AS total_books_sold
FROM orders o
JOIN books b ON o.book_id = b.book_id
GROUP BY b.genre
ORDER BY total_books_sold DESC;


-- ) Find the average price of books in the "Fantasy" genre:

SELECT AVG(price) AS average_fantasy_price
FROM books
WHERE genre = 'Fantasy';


-- ) List customers who have placed at least 2 orders:
 
SELECT c.customer_id, c.name, COUNT(o.order_id) AS order_count
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
HAVING COUNT(o.order_id) >= 2;


-- ) Find the most frequently ordered book:

SELECT b.book_id, b.title, SUM(o.quantity) AS total_quantity_ordered
FROM orders o
JOIN books b ON o.book_id = b.book_id
GROUP BY b.book_id, b.title
ORDER BY total_quantity_ordered DESC
LIMIT 1;

-- ) Show the top 3 most expensive books of 'Fantasy' Genre :

SELECT book_id, title, price
FROM books
WHERE genre = 'Fantasy'
ORDER BY price DESC
LIMIT 3;

-- ) Retrieve the total quantity of books sold by each author:

SELECT b.author, SUM(o.quantity) AS total_books_sold
FROM orders o
JOIN books b ON o.book_id = b.book_id
GROUP BY b.author;

-- ) List the cities where customers who spent over $30 are located:

SELECT DISTINCT c.city
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.total_amount > 30;

-- ) Find the customer who spent the most on orders:

SELECT c.customer_id, c.name, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC
LIMIT 1;

--) Calculate the stock remaining after fulfilling all orders:

SELECT 
    b.book_id,
    b.title,
    b.stock,
    COALESCE(SUM(o.quantity), 0) AS order_quantity,
    b.stock - COALESCE(SUM(o.quantity), 0) AS remaining_stock
FROM books b
LEFT JOIN orders o ON b.book_id = o.book_id
GROUP BY b.book_id, b.title, b.stock
order by b.book_id;





