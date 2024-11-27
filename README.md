# Library Management API

## Description

This project is a RESTful API for managing a library system. It allows users to register, log in, manage authors, and books, and establish relationships between books and authors. The API utilizes JSON Web Tokens (JWT) for authentication and provides secure access to endpoints.

## Features

- User registration and authentication
- Create, update, and delete authors
- Create, update, and delete books
- Manage book-author relationships
- Token-based authentication with JWT
- Automatic deletion of expired tokens

## Technologies Used

- PHP
- Slim Framework
- MySQL
- JSON Web Tokens (JWT)
- PDO for database interactions

## Installation

### Prerequisites

- PHP 7.2 or higher
- Composer
- MySQL database
- A web server (e.g., Apache, Nginx)

### Steps

1. **Clone the repository:**

   ```bash
   git clone https://github.com/yourusername/library-management-api.git
   cd library-management-api
Install dependencies:

Make sure you have Composer installed, then run:

bash

Verify

Open In Editor
Edit
Copy code
composer install
Set up the database:

Create a MySQL database named library and run the following SQL commands to create the necessary tables:

sql

Verify

Open In Editor
Edit
Copy code
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE authors (
    authorid INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE books (
    bookid INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    authorid INT,
    FOREIGN KEY (authorid) REFERENCES authors(authorid) ON DELETE SET NULL
);

CREATE TABLE books_authors (
    collectionid INT AUTO_INCREMENT PRIMARY KEY,
    bookid INT,
    authorid INT,
    FOREIGN KEY (bookid) REFERENCES books(bookid) ON DELETE CASCADE,
    FOREIGN KEY (authorid) REFERENCES authors(authorid) ON DELETE CASCADE
);

CREATE TABLE jwt_tokens (
    id INT AUTO_INCREMENT PRIMARY KEY,
    token VARCHAR(255) NOT NULL,
    used TINYINT(1) DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
Configure database connection:

Edit the database connection settings in the PHP code where $servername, $username, $password, and $dbname are defined to match your MySQL configuration.

Usage
Running the API
To run the API, you can use the built-in PHP server or configure it with a web server like Apache or Nginx. To use the built-in server, run:

bash

Verify

Open In Editor
Edit
Copy code
php -S localhost:8000 -t public
You can now access the API at http://localhost:8000.

API Endpoints
Here are the available API endpoints:

User Registration
POST /user/register
Request Body:
json

Verify

Open In Editor
Edit
Copy code
{
  "username": "your_username",
  "password": "your_password"
}
Response:
json

Verify

Open In Editor
Edit
Copy code
{
  "status": "success",
  "token": null,
  "data": null
}
User Login
POST /user/login
Request Body:
json

Verify

Open In Editor
Edit
Copy code
{
  "username": "your_username",
  "password": "your_password"
}
Response:
json

Verify

Open In Editor
Edit
Copy code
{
  "status": "success",
  "token": "your_jwt_token",
  "data": null
}
Manage Authors
Create Author: POST /authors
Update Author: PUT /authors/update/{id}
Delete Author: DELETE /authors/delete/{id}
Manage Books
Create Book: POST /books
Update Book: PUT /books/update/{id}
Delete Book: DELETE /books/delete/{id}
Manage Book-Author Relations
Create Relation: POST /books_authors
Delete Relation: DELETE /books_authors/delete/{id}
Authentication
For endpoints that require authentication, include the JWT token in the request body:

json

Verify

Open In Editor
Edit
Copy code
{
  "token": "your_jwt_token"
}
Token Expiration
Tokens are valid for 1 hour. After expiration, users must log in again to receive a new token.
