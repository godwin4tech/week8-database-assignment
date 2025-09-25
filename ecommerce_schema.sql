-- ecommerce_schema.sql
-- Week 8 Assignment (Database Management System)

CREATE DATABASE ecommerce_store;
USE ecommerce_store;

-- Customers table
CREATE TABLE customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(255) NOT NULL UNIQUE,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL
);

-- Customer profiles (One-to-One with customers)
CREATE TABLE customer_profiles (
  customer_id INT PRIMARY KEY,
  date_of_birth DATE,
  gender ENUM('male','female','other'),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Products table
CREATE TABLE products (
  product_id INT AUTO_INCREMENT PRIMARY KEY,
  sku VARCHAR(64) NOT NULL UNIQUE,
  name VARCHAR(255) NOT NULL,
  price DECIMAL(10,2) NOT NULL
);

-- Categories table
CREATE TABLE categories (
  category_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE
);

-- Product-Categories (Many-to-Many)
CREATE TABLE product_categories (
  product_id INT NOT NULL,
  category_id INT NOT NULL,
  PRIMARY KEY (product_id, category_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id),
  FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Orders table (One-to-Many: customer -> orders)
CREATE TABLE orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT NOT NULL,
  order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  total DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Order items (One-to-Many: order -> items)
CREATE TABLE order_items (
  order_item_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  line_total DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Payments table (One-to-Many: order -> payments)
CREATE TABLE payments (
  payment_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT NOT NULL,
  amount DECIMAL(10,2) NOT NULL,
  method ENUM('card','paypal','bank') NOT NULL,
  status ENUM('pending','completed','failed') DEFAULT 'pending',
  paid_at DATETIME,
  FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
