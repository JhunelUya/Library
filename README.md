# Library Management System API

This Library Management System API is built using PHP and the Slim framework. It provides functionalities for user registration, authentication, and management of books and authors in a library. The API uses JWT (JSON Web Tokens) for secure access control and stores tokens in a MySQL database.

## Table of Contents
- [About the Project](#about-the-project)
- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [API Endpoints](#api-endpoints)
  - [User Registration](#user-registration)
  - [User Login](#user-login)
  - [Create Author](#create-author)
  - [Update Author](#update-author)
  - [Delete Author](#delete-author)
  - [Create Book](#create-book)
  - [Update Book](#update-book)
  - [Delete Book](#delete-book)
  - [Create Book-Author Relations](#create-book-author-relations)
  - [Delete Book-Author Relations](#delete-book-author-relations)
- [Project Information](#project-information)
- [Contact Information](#contact-information)

## About the Project

The Library Management System API allows users to manage a library's collection of books and authors efficiently. It enables users to register and log in securely while managing their sessions through JWTs. The API provides endpoints for CRUD (Create, Read, Update, Delete) operations on both authors and books, as well as the ability to create and delete relationships between books and authors. This project is designed to be a foundational framework for a more extensive library management system, allowing for future enhancements and integrations.

## Features
- User registration and authentication
- Token-based access control
- Create, update, and delete authors
- Create, update, and delete books
- Manage book-author relationships
- Token expiration and validation

## Requirements
- PHP 7.2 or higher
- Composer
- MySQL
- Slim Framework
- Firebase JWT library

## Installation

1. Clone the repository:
    ```bash
    git clone <repository-url>
    cd <repository-directory>
    ```

2. Install dependencies using Composer:
    ```bash
    composer install
    ```

3. Set up your MySQL database:
    - Create a database named `library`.
    - Create the following tables:

    ```sql
    CREATE TABLE users (
        id INT AUTO_INCREMENT PRIMARY KEY,
        username VARCHAR(255) NOT NULL UNIQUE,
        password VARCHAR(255) NOT NULL
    );

    CREATE TABLE authors (
        authorid INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255) NOT NULL
    );

    CREATE TABLE books (
        bookid INT AUTO_INCREMENT PRIMARY KEY,
        title VARCHAR(255) NOT NULL,
        authorid INT,
        FOREIGN KEY (authorid) REFERENCES authors(authorid)
    );

    CREATE TABLE books_authors (
        collectionid INT AUTO_INCREMENT PRIMARY KEY,
        bookid INT,
        authorid INT,
        FOREIGN KEY (bookid) REFERENCES books(bookid),
        FOREIGN KEY (authorid) REFERENCES authors(authorid)
    );

    CREATE TABLE jwt_tokens (
        id INT AUTO_INCREMENT PRIMARY KEY,
        token VARCHAR(512) NOT NULL,
        used TINYINT DEFAULT 0,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP
    );
    ```

4. Update database credentials in the code if necessary.

## API Endpoints

### User Registration
- **POST** `/user/register`
- Request Body:
    ```json
    {
        "username": "your_username",
        "password": "your_password"
    }
    ```
- Response:
    - Success:
      ```json
      {
          "status": "success",
          "token": null,
          "data": null
      }
      ```
    - Fail:
      ```json
      {
          "status": "fail",
          "token": null,
          "data": {
              "title": "Username already exists."
          }
      }
      ```

### User Login
- **POST** `/user/login`
- Request Body:
    ```json
    {
        "username": "your_username",
        "password": "your_password"
    }
    ```
- Response:
    - Success:
      ```json
      {
          "status": "success",
          "token": "your_jwt_token",
          "data": null
      }
      ```
    - Fail:
      ```json
      {
          "status": "fail",
          "token": null,
          "data": {
              "title": "Authentication Failed"
          }
      }
      ```

### Create Author
- **POST** `/authors`
- Request Body:
    ```json
    {
        "name": "Author Name",
        "token": "your_jwt_token"
    }
    ```
- Response:
    - Success:
      ```json
      {
          "status": "success",
          "token": "new_jwt_token",
          "data": null
      }
      ```

### Update Author
- **PUT** `/authors/{authorid}`
- Request Body:
    ```json
    {
        "name": "Updated Author Name",
        "token": "your_jwt_token"
    }
    ```
- Response:
    - Success:
      ```json
      {
          "status": "success",
          "token": "new_jwt_token",
          "data": null
      }
      ```
    - Fail:
      ```json
      {
          "status": "fail",
          "token": null,
          "data": {
              "title": "Author not found."
          }
      }
      ```

### Delete Author
- **DELETE** `/authors/{authorid}`
- Request Body:
    ```json
    {
        "token": "your_jwt_token"
    }
    ```
- Response:
    - Success:
      ```json
      {
          "status": "success",
          "token": "new_jwt_token",
          "data": null
      }
      ```
    - Fail:
      ```json
      {
          "status": "fail",
          "token": null,
          "data": {
              "title": "Author not found."
          }
      }
      ```

### Create Book
- **POST** `/books`
- Request Body:
    ```json
    {
        "title": "Book Title",
        "authorid": "author_id",
        "token": "your_jwt_token"
    }
    ```
- Response:
    - Success:
      ```json
      {
          "status": "success",
          "token": "new_jwt_token",
          "data": null
      }
      ```

### Update Book
- **PUT** `/books/{bookid}`
- Request Body:
    ```json
    {
        "title": "Updated Book Title",
        "authorid": "author_id",
        "token": "your_jwt_token"
    }
    ```
- Response:
    - Success:
      ```json
      {
          "status": "success",
          "token": "new_jwt_token",
          "data": null
      }
      ```
    - Fail:
      ```json
      {
          "status": "fail",
          "token": null,
          "data": {
              "title": "Book not found."
          }
      }
      ```

### Delete Book
- **DELETE** `/books/{bookid}`
- Request Body:
    ```json
    {
        "token": "your_jwt_token"
    }
    ```
- Response:
    - Success:
      ```json
      {
          "status": "success",
          "token": "new_jwt_token",
          "data": null
      }
      ```
    - Fail:
      ```json
      {
          "status": "fail",
          "token": null,
          "data": {
              "title": "Book not found."
          }
      }
      ```

### Create Book-Author Relations
- **POST** `/books/authors`
- Request Body:
    ```json
    {
        "bookid": "book_id",
        "authorid": "author_id",
        "token": "your_jwt_token"
    }
    ```
- Response:
    - Success:
      ```json
      {
          "status": "success",
          "token": "new_jwt_token",
          "data": null
      }
      ```

### Delete Book-Author Relations
- **DELETE** `/books/authors`
- Request Body:
    ```json
    {
        "bookid": "book_id",
        "authorid": "author_id",
        "token": "your_jwt_token"
    }
    ```
- Response:
    - Success:
      ```json
      {
          "status": "success",
          "token": "new_jwt_token",
          "data": null
      }
      ```
    - Fail:
      ```json
      {
          "status": "fail",
          "token": null,
          "data": {
              "title": "Relation not found."
          }
      }
      ```

## Project Information

This project is developed as part of a midterm requirement for the ITPC 115 (System Integration and Architecture) subject, showcasing the ability to build secure API endpoints and manage user and data operations efficiently.

## Contact Information

- Developer: Jhunel M. Uya(Kuyep)
- Email: uy4s1nk1t@gmail.com
