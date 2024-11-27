Library Management System API
Overview
This Library Management System API is built using PHP and the Slim Framework. It offers functionality for managing books, authors, and user authentication via JWT (JSON Web Tokens). It includes secure user registration, login, and CRUD operations for books and authors, as well as the ability to create and delete relationships between books and authors. This system is ideal for managing a library collection with a focus on scalability and security.

Table of Contents
About the Project
Features
Requirements
Installation
Database Setup
API Endpoints
User Registration
User Login
Create Author
Update Author
Delete Author
Create Book
Update Book
Delete Book
Create Book-Author Relations
Delete Book-Author Relations
License
About the Project
The Library Management System API enables users to interact with a library database through a RESTful interface. This API supports user registration and authentication using JWTs for secure access. The main focus of this project is to provide CRUD operations for managing authors and books, as well as managing the relationships between them. This API is designed to be extensible and can serve as the backend for a more complex library management system.

Features
User Registration & Authentication: Secure user registration and login with JWT-based token authentication.
CRUD Operations for Authors: Create, read, update, and delete author records in the system.
CRUD Operations for Books: Create, read, update, and delete books.
Manage Book-Author Relationships: Associate authors with books and manage those relationships.
Token Expiration & Validation: Expired tokens are automatically rejected to enforce security.
Requirements
PHP 7.2 or higher
Composer (Dependency Manager for PHP)
MySQL Database
Slim Framework 4.x
Firebase JWT (for token generation and validation)
Installation
1. Clone the repository
bash
Copy code
git clone <repository-url>
cd <repository-directory>
2. Install dependencies
Make sure Composer is installed on your system, then run:

bash
Copy code
composer install
3. Set up your MySQL database
Create a database called library:

sql
Copy code
CREATE DATABASE library;
Next, create the required tables:

sql
Copy code
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
4. Configure database credentials
Update the database credentials in your config.php file, ensuring that it connects to your MySQL database properly.

API Endpoints
User Registration
POST /user/register
Request Body:
json
Copy code
{
    "username": "your_username",
    "password": "your_password"
}
Response:
json
Copy code
{
    "status": "success",
    "token": null,
    "data": null
}
Error Response:
json
Copy code
{
    "status": "fail",
    "token": null,
    "data": {
        "title": "Username already exists."
    }
}
User Login
POST /user/login
Request Body:
json
Copy code
{
    "username": "your_username",
    "password": "your_password"
}
Response:
json
Copy code
{
    "status": "success",
    "token": "your_jwt_token",
    "data": null
}
Error Response:
json
Copy code
{
    "status": "fail",
    "token": null,
    "data": {
        "title": "Authentication Failed"
    }
}
Create Author
POST /authors
Request Body:
json
Copy code
{
    "name": "Author Name",
    "token": "your_jwt_token"
}
Response:
json
Copy code
{
    "status": "success",
    "token": "new_jwt_token",
    "data": null
}
Update Author
PUT /authors/{authorid}
Request Body:
json
Copy code
{
    "name": "Updated Author Name",
    "token": "your_jwt_token"
}
Response:
json
Copy code
{
    "status": "success",
    "token": "new_jwt_token",
    "data": null
}
Error Response:
json
Copy code
{
    "status": "fail",
    "token": null,
    "data": {
        "title": "Author not found."
    }
}
Delete Author
DELETE /authors/{authorid}
Request Body:
json
Copy code
{
    "token": "your_jwt_token"
}
Response:
json
Copy code
{
    "status": "success",
    "token": "new_jwt_token",
    "data": null
}
Error Response:
json
Copy code
{
    "status": "fail",
    "token": null,
    "data": {
        "title": "Author not found."
    }
}
Create Book
POST /books
Request Body:
json
Copy code
{
    "title": "Book Title",
    "authorid": "author_id",
    "token": "your_jwt_token"
}
Response:
json
Copy code
{
    "status": "success",
    "token": "new_jwt_token",
    "data": null
}
Update Book
PUT /books/{bookid}
Request Body:
json
Copy code
{
    "title": "Updated Book Title",
    "authorid": "author_id",
    "token": "your_jwt_token"
}
Response:
json
Copy code
{
    "status": "success",
    "token": "new_jwt_token",
    "data": null
}
Error Response:
json
Copy code
{
    "status": "fail",
    "token": null,
    "data": {
        "title": "Book not found."
    }
}
Delete Book
DELETE /books/{bookid}
Request Body:
json
Copy code
{
    "token": "your_jwt_token"
}
Response:
json
Copy code
{
    "status": "success",
    "token": "new_jwt_token",
    "data": null
}
Error Response:
json
Copy code
{
    "status": "fail",
    "token": null,
    "data": {
        "title": "Book not found."
    }
}
Create Book-Author Relations
POST /books/authors
Request Body:
json
Copy code
{
    "bookid": "book_id",
    "authorid": "author_id",
    "token": "your_jwt_token"
}
Response:
json
Copy code
{
    "status": "success",
    "token": "new_jwt_token",
    "data": null
}
Delete Book-Author Relations
DELETE /books/authors
Request Body:
json
Copy code
{
    "bookid": "book_id",
    "authorid": "author_id",
    "token": "your_jwt_token"
}
Response:
json
Copy code
{
    "status": "success",
    "token": "new_jwt_token",
    "data": null
}
Error Response:
json
Copy code
{
    "status": "fail",
    "token": null,
    "data": {
        "title": "Relation not found."
    }
}
