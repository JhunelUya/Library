# Library Management API

This project is a RESTful API built with the Slim PHP framework that allows users to manage a library system. It includes functionalities for user registration, login, JWT authentication, and CRUD operations for authors and books. The API uses JWT tokens to authenticate and authorize users.

## Features

- User registration and login
- Token-based authentication with JWT
- Create, Update, and Delete Authors
- Create, Update, and Delete Books
- Create and Delete Book-Author relations
- Secure API with token validation and expiration handling

## Prerequisites

- PHP 7.4 or higher
- Composer (for managing dependencies)
- MySQL (or compatible database)
- Firebase JWT library

## Installation

### Step 1: Clone the Repository

```bash
git clone https://github.com/yourusername/library-api.git
cd library-api
Step 2: Install Dependencies
Make sure you have Composer installed, then run:

bash
Copy code
composer install
This will install the necessary dependencies, including the Slim framework and Firebase JWT.

Step 3: Configure the Database
Create a MySQL database named library. Set up the following tables: users, jwt_tokens, authors, books, and books_authors based on the structure of your application.

Step 4: Update Database Credentials
Update the database credentials in the index.php file.

php
Copy code
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "library";
Make sure the localhost, root, and library database values match your environment.

Step 5: Run the Application
Start the PHP built-in server:

bash
Copy code
php -S localhost:8080 -t public
The API should now be available at http://localhost:8080.

API Endpoints
User Registration
POST /user/register

Registers a new user. Requires a JSON body with username and password fields.

Example:

json
Copy code
{
  "username": "john_doe",
  "password": "securepassword123"
}
User Login
POST /user/login

Authenticates a user and returns a JWT token. Requires a JSON body with username and password fields.

Example:

json
Copy code
{
  "username": "john_doe",
  "password": "securepassword123"
}
Create Author
POST /authors

Adds a new author. Requires a JSON body with name and token (JWT token).

Example:

json
Copy code
{
  "name": "J.K. Rowling",
  "token": "your-jwt-token"
}
Update Author
PUT /authors/update/{id}

Updates an existing author's name. Requires id, name, and token in the request body.

Example:

json
Copy code
{
  "name": "J.K. Rowling (Updated)",
  "token": "your-jwt-token"
}
Delete Author
DELETE /authors/delete/{id}

Deletes an author by id. Requires token in the request body.

Example:

json
Copy code
{
  "token": "your-jwt-token"
}
Create Book
POST /books

Adds a new book. Requires title, author_id, and token.

Example:

json
Copy code
{
  "title": "Harry Potter",
  "author_id": 1,
  "token": "your-jwt-token"
}
Update Book
PUT /books/update/{id}

Updates an existing book's title and author. Requires id, title, author_id, and token.

Example:

json
Copy code
{
  "title": "Harry Potter (Updated)",
  "author_id": 1,
  "token": "your-jwt-token"
}
Delete Book
DELETE /books/delete/{id}

Deletes a book by id. Requires token.

Example:

json
Copy code
{
  "token": "your-jwt-token"
}
Create Book-Author Relation
POST /books_authors

Links a book and an author. Requires book_id, author_id, and token.

Example:

json
Copy code
{
  "book_id": 1,
  "author_id": 1,
  "token": "your-jwt-token"
}
Delete Book-Author Relation
DELETE /books_authors/delete/{id}

Deletes a book-author relation by id. Requires token.

Example:

json
Copy code
{
  "token": "your-jwt-token"
}
