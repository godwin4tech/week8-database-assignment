# Week 8 Assignment – Database Management System

## 📌 Question Chosen
**Question 1: Build a Complete Database Management System (MySQL)**

## 📖 Description
This project is an **E-commerce Store database schema** that demonstrates:
- Well-structured tables
- Constraints: PRIMARY KEY, FOREIGN KEY, NOT NULL, UNIQUE
- Relationships:
  - One-to-One: customers ↔ customer_profiles
  - One-to-Many: customers → orders → order_items
  - Many-to-Many: products ↔ categories

## 🚀 How to Run
1. Download or clone this repository.  
2. Open MySQL Workbench or terminal.  
3. Run the script:
   ```bash
   mysql -u root -p < ecommerce_schema.sql
