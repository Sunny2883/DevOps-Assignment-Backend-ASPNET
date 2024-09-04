# Book API Project

This project is a simple ASP.NET Core Web API that manages a collection of books using Entity Framework Core with PostgreSQL.

## Project Overview

The API allows you to retrieve a list of books from a PostgreSQL database. It uses Entity Framework Core for database operations and includes automatic migrations on startup.

## Prerequisites

- .NET 8.0 SDK or later
- PostgreSQL database server

## Setup and Run Instructions

1. Clone the repository to your local machine.

2. For development, update the connection string in `appsettings.Development.json`:
   ```json
   "ConnectionStrings": {
     "DefaultConnection": "Host=localhost;Database=your_database_name;Username=your_username;Password=your_password"
   }
   ```
   Replace `your_database_name`, `your_username`, and `your_password` with your PostgreSQL database details.

3. Open a terminal in the project directory and run the following commands:
   ```
   dotnet restore
   dotnet build
   dotnet run --environment Development
   ```

4. The application will start, automatically apply any pending migrations, and seed the database with sample data.

5. The API will be available at `http://localhost:5073` by default.

## API Endpoints

### Get All Books

- **URL**: `/api/books`
- **Method**: GET
- **Description**: Retrieves a list of all books in the database.
- **Sample Response**:
  ```json
  [
    {
      "id": 1,
      "title": "1984",
      "author": "George Orwell",
      "publicationYear": 1949
    },
    {
      "id": 2,
      "title": "To Kill a Mockingbird",
      "author": "Harper Lee",
      "publicationYear": 1960
    },
    {
      "id": 3,
      "title": "The Great Gatsby",
      "author": "F. Scott Fitzgerald",
      "publicationYear": 1925
    }
  ]
  ```

## Testing the API

You can test the API using tools like curl, Postman, or by accessing the Swagger UI at `http://localhost:5073/swagger` when running in development mode.

Example curl command:
```
curl -X GET "http://localhost:5073/api/books" -H "accept: application/json"
```

## Project Structure

- `Models/Book.cs`: Defines the Book entity.
- `Data/AppDbContext.cs`: Contains the database context and seeding logic.
- `Controllers/BooksController.cs`: Handles the API endpoints.
- `Program.cs`: Configures the application and services.
- `appsettings.json`: Contains application settings, including the database connection string.