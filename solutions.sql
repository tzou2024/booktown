-- ### Order
-- 1. Find all subjects sorted by subject
SELECT subject FROM subjects ORDER BY subject;

-- 2. Find all subjects sorted by location
SELECT subject FROM subjects ORDER BY location;

-- ### Where
-- 3. Find the book "Little Women"
SELECT * FROM books WHERE title = 'Little Women';

-- 4. Find all books containing the word "Python"
SELECT * FROM books WHERE title LIKE '%Python%';

-- 5. Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjects WHERE location = 'Main St' ORDER BY subject;


-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
SELECT title FROM books WHERE subject_id = (SELECT id FROM subjects WHERE subject = 'Computers');

-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject

SELECT books.title, authors.first_name, authors.last_name, subjects.subject FROM books JOIN authors ON books.author_id = authors.id JOIN subjects ON books.subject_id = subjects.id;q

-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price

SELECT books.title, stock.cost FROM stock JOIN editions ON stock.isbn = editions.isbn JOIN books ON editions.book_id = books.id;

-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
SELECT books.title, editions.isbn, stock.retail, publishers.name FROM books JOIN editions ON books.id = editions.book_id JOIN stock ON editions.isbn = stock.isbn JOIN publishers ON editions.publisher_id = publishers.id WHERE books.title = 'Dune';

-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title
SELECT shipments.ship_date, books.title, customers.first_name, customers.last_name FROM shipments JOIN editions ON shipments.isbn = editions.isbn JOIN books ON editions.book_id = books.id JOIN customers ON shipments.customer_id = customers.id;

-- ### Grouping and Counting

-- 11. Get the COUNT of all books
SELECT count(*) FROM books;
-- 12. Get the COUNT of all Locations
SELECT count(location) FROM subjects;
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT location, count(location) FROM subjects GROUP BY location;
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT books.title, count(books.id) as editions FROM books JOIN editions ON books.id = editions.book_id GROUP BY books.title;