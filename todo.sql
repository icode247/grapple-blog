CREATE DATABASE IF NOT EXISTS todo;

USE todo;

-- Dropping existing tables if they exist
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Todos;
DROP TABLE IF EXISTS Categories;

-- Creating Users table
CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL
);

-- Inserting sample users
INSERT INTO Users (Name, Email) VALUES
('Alice Johnson', 'alice.johnson@example.com'),
('Bob Smith', 'bob.smith@example.com'),
('Carol Davis', 'carol.davis@example.com');

-- Creating Categories table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Description TEXT
);

-- Inserting sample categories
INSERT INTO Categories (Name, Description) VALUES
('Personal', 'Tasks for personal development and activities.'),
('Work', 'Tasks related to work or professional activities.'),
('Home', 'Tasks for home maintenance and family.');

-- Creating Todos table
CREATE TABLE Todos (
    TodoID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    CategoryID INT,
    Title VARCHAR(255) NOT NULL,
    Description TEXT,
    DueDate DATETIME,
    Status ENUM('Pending', 'Completed') DEFAULT 'Pending',
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Inserting sample todos
INSERT INTO Todos (UserID, CategoryID, Title, Description, DueDate, Status) VALUES
(1, 1, 'Read a new book', 'Finish reading the new novel by favorite author.', '2023-03-01 00:00:00', 'Pending'),
(2, 2, 'Project deadline', 'Complete the project report and submit it.', '2023-03-15 00:00:00', 'Pending'),
(3, 3, 'Repair the garage door', 'Call the repair service and schedule a visit.', '2023-02-20 00:00:00', 'Completed');
