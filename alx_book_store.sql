CREATE DATABASE IF NOT EXISTS alx_book_store;

USE alx_book_store;

CREATE TABLE Books(
	book_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
		ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE Authors(
	author_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	author_name VARCHAR(215) NOT NULL
);

CREATE TABLE Customers(
	customer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215),
    address TEXT
);

CREATE TABLE Orders(
	order_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
		ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE Order_Details(
	orderdetailid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE,
    FOREIGN KEY (order_id) REFERENCES Orders(Order_id)
		ON DELETE SET NULL
        ON UPDATE CASCADE,
	FOREIGN KEY (book_id) REFERENCES Books(book_id)
		ON DELETE SET NULL
        ON UPDATE CASCADE
);