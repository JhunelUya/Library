# Library Management System API

This Library Management System API is built using PHP and the Slim framework. It provides functionalities for user registration, authentication, and management of books and authors in a library. The API uses JWT (JSON Web Tokens) for secure access control and stores tokens in a MySQL database.

## Table of Contents

-   About the Project
-   Features
-   Requirements
-   Installation
-   API Endpoints
    -   User Registration
    -   User Login
    -   Create Author
    -   Update Author
    -   Delete Author
    -   Create Book
    -   Update Book
    -   Delete Book
    -   Create Book-Author Relations
    -   Delete Book-Author Relations

## About the Project

The Library Management System API allows users to manage a library's collection of books and authors efficiently. It enables users to register and log in securely while managing their sessions through JWTs. The API provides endpoints for CRUD (Create, Read, Update, Delete) operations on both authors and books, as well as the ability to create and delete relationships between books and authors. This project is designed to be a foundational framework for a more extensive library management system, allowing for future enhancements and integrations.

## Features

-   User registration and authentication
-   Token-based access control
-   Create, update, and delete authors
-   Create, update, and delete books
-   Manage book-author relationships
-   Token expiration and validation

## Requirements

-   PHP 7.2 or higher
-   Composer
-   MySQL
-   Slim Framework
-   Firebase JWT library

## Installation

1.  bashVerifyOpen In EditorEditCopy code1git clone <repository-url>2cd <repository-directory>
2.  bashVerifyOpen In EditorEditCopy code1composer install
3.  Set up your MySQL database:
    -   Create a database named **library**.
    -   sqlVerifyOpen In EditorEditCopy code1CREATE TABLE users (2 id INT AUTO\_INCREMENT PRIMARY KEY,3 username VARCHAR(255) NOT NULL UNIQUE,4 password VARCHAR(255) NOT NULL5);67CREATE TABLE authors (8 authorid INT AUTO\_INCREMENT PRIMARY KEY,9 name VARCHAR(255) NOT NULL10);1112CREATE TABLE books (13 bookid INT AUTO\_INCREMENT PRIMARY KEY,14 title VARCHAR(255) NOT NULL,15 authorid INT,16 FOREIGN KEY (authorid) REFERENCES authors(authorid)17);1819CREATE TABLE books\_authors (20 collectionid INT AUTO\_INCREMENT PRIMARY KEY,21 bookid INT,22 authorid INT,23 FOREIGN KEY (bookid) REFERENCES books(bookid),24 FOREIGN KEY (authorid) REFERENCES authors(authorid)25);2627CREATE TABLE jwt\_tokens (28 id INT AUTO\_INCREMENT PRIMARY KEY,29 token VARCHAR(512) NOT NULL,30 used TINYINT DEFAULT 0,31 created\_at DATETIME DEFAULT CURRENT\_TIMESTAMP32);
4.  Update database credentials in the code if necessary.

## API Endpoints

### User Registration

-   **POST** **/user/register**
-   jsonVerifyOpen In EditorEditCopy code1{2 "username": "your\_username",3 "password": "your\_password"4}
-   Response:
    -   jsonVerifyOpen In EditorEditCopy code1{2 "status": "success",3 "token": null,4 "data": null5}
    -   jsonVerifyOpen In EditorEditCopy code1{2 "status": "fail",3 "token": null,4 "data": {5 "title": "Username already exists."6 }7}

### User Login

-   **POST** **/user/login**
-   jsonVerifyOpen In EditorEditCopy code1{2 "username": "your\_username",3 "password": "your\_password"4}
-   Response:
    -   jsonVerifyOpen In EditorEditCopy code1{2 "status": "success",3 "token": "your\_jwt\_token",4 "data": null5}
    -   jsonVerifyOpen In EditorEditCopy code1{2 "status": "fail",3 "token": null,4 "data": {5 "title": "Authentication Failed"6 }7}

### Create Author

-   **POST** **/authors**
-   jsonVerifyOpen In EditorEditCopy code1{2 "name": "Author Name",3 "token": "your\_jwt\_token"4}
-   Response:
    -   jsonVerifyOpen In EditorEditCopy code1{2 "status": "success",3 "token": " new\_jwt\_token",4 "data": null5}

### Update Author

-   **PUT** **/authors/{authorid}**
-   jsonVerifyOpen In EditorEditCopy code1{2 "name": "Updated Author Name",3 "token": "your\_jwt\_token"4}
-   Response:
    -   jsonVerifyOpen In EditorEditCopy code1{2 "status": "success",3 "token": "new\_jwt\_token",4 "data": null5}
    -   jsonVerifyOpen In EditorEditCopy code1{2 "status": "fail",3 "token": null,4 "data": {5 "title": "Author not found."6 }7}

### Delete Author

-   **DELETE** **/authors/{authorid}**
-   jsonVerifyOpen In EditorEditCopy code1{2 "token": "your\_jwt\_token"3}
-   Response:
    -   jsonVerifyOpen In EditorEditCopy code1{2 "status": "success",3 "token": "new\_jwt\_token",4 "data": null5}
    -   jsonVerifyOpen In EditorEditCopy code1{2 "status": "fail",3 "token": null,4 "data": {5 "title": "Author not found."6 }7}

### Create Book

-   **POST** **/books**
-   jsonVerifyOpen In EditorEditCopy code1{2 "title": "Book Title",3 "authorid": "author\_id",4 "token": "your\_jwt\_token"5}
-   Response:
    -   jsonVerifyOpen In EditorEditCopy code1{2 "status": "success",3 "token": "new\_jwt\_token",4 "data": null5}

### Update Book

-   **PUT** **/books/{bookid}**
-   jsonVerifyOpen In EditorEditCopy code1{2 "title": "Updated Book Title",3 "authorid": "author\_id",4 "token": "your\_jwt\_token"5}
-   Response:
    -   jsonVerifyOpen In EditorEditCopy code1{2 "status": "success",3 "token": "new\_jwt\_token",4 "data": null5}
    -   jsonVerifyOpen In EditorEditCopy code1{2 "status": "fail",3 "token": null,4 "data": {5 "title": "Book not found."6 }7}

### Delete Book

-   **DELETE** **/books/{bookid}**
-   jsonVerifyOpen In EditorEditCopy code1{2 "token": "your\_jwt\_token"3}
-   Response:
    -   jsonVerifyOpen In EditorEditCopy code1{2 "status": "success",3 "token": "new\_jwt\_token",4 "data": null5}
    -   jsonVerifyOpen In EditorEditCopy code1{2 "status": "fail",3 "token": null,4 "data": {5 "title": "Book not found."6 }7}

### Create Book-Author Relations

-   **POST** **/books/authors**
-   jsonVerifyOpen In EditorEditCopy code1{2 "bookid": "book\_id",3 "authorid": "author\_id",4 "token": "your\_jwt\_token"5}
-   Response:
    -   jsonVerifyOpen In EditorEditCopy code1{2 "status": "success",3 "token": "new\_jwt\_token",4 "data": null5}

### Delete Book-Author Relations

-   **DELETE** **/books/authors**
-   jsonVerifyOpen In EditorEditCopy code1{2 "bookid": "book\_id",3 "authorid": "author\_id",4 "token": "your\_jwt\_token"5}
-   Response:
    -   jsonVerifyOpen In EditorEditCopy code1{2 "status": "success",3 "token": "new\_jwt\_token",4 "data": null5}
    -   jsonVerifyOpen In EditorEditCopy code1{2 "status": "fail",3 "token": null,4 "data": {5 "title": "Relation not found."6 }7}
