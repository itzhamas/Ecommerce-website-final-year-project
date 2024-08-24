# E-Commerce Project

## Overview

This is a simple e-commerce application built using Spring Boot and various other technologies. The project provides a user-friendly interface for customers to browse products, add them to a shopping cart, and place orders. It also includes an admin panel for managing products, categories, users, and orders.

## Features

### User Features
- **User Registration & Login**: Users can register and log in to the application.
- **Product Browsing**: Users can navigate through the main pages to browse products, with the ability to view items from the showcase or filter by categories, all supported by pagination.
- **Product Search**: Users can search for products based on specific criteria, such as product name, category, or other attributes.
- **Shopping Cart**: Users can add products to their shopping cart, view the cart, and remove items as needed.
- **Order Placement**: Users can place orders for the items in their cart. Once an order is successfully placed, the user will receive an order confirmation via email.
- **Account Management**: Users can update their account details, change their password, and view their past orders.

### Admin Features
- **Product Management**: Admins can add new products, update existing products, or delete products from the database.
- **Category Management**: Admins can manage product categories, including adding new categories or modifying existing ones.
- **User Management**: Admins have the ability to manage users, including adding, modifying, or deleting user accounts.
- **Order Management**: Admins can view and manage orders placed by users.
- **Vendor & Delivery Management**: Admins can manage vendor information and delivery options available to users.

## Technologies Used
- **Spring Boot**: Framework for building the application.
- **Spring Data JPA / Hibernate**: ORM for database interaction.
- **Spring Security**: Provides authentication and authorization for the application.
- **MySQL**: Database for storing application data.
- **Thymeleaf**: Templating engine for rendering views.
- **Bootstrap**: Front-end framework for responsive design.
- **CSS & JavaScript**: For custom styling and interactivity.
- **Maven**: Build automation tool.
- **JUnit**: Testing framework for unit tests.
- **Lombok**: To reduce boilerplate code in the application.
- **SQL Queries**: Used for complex queries that are not handled by JPA.

## Installation & Setup
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/ecommerce-project.git

2. **Navigate to the Project Directory:**:
   ```bash
   cd ecommerce-project
3. **Build the Project:**:
   ```bash
   mvn clean install
4. **Configure the Database**:
   ```bash
   spring.datasource.url=jdbc:mysql://localhost:3306/yourdbname
    spring.datasource.username=yourusername
    spring.datasource.password=yourpassword
