CREATE DATABASE IF NOT EXISTS blog;

USE blog;

DROP TABLE IF EXISTS Authors;

CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Bio TEXT
);

INSERT INTO Authors (Name, Email, Bio) VALUES
('Jane Doe', 'jane.doe@example.com', 'An enthusiastic blogger who loves to write about technology and lifestyle.'),
('John Smith', 'john.smith@example.com', 'A passionate writer focused on politics and current events.'),
('Emily Johnson', 'emily.johnson@example.com', 'Lifestyle and travel enthusiast sharing personal stories and tips.');


DROP TABLE IF EXISTS Posts;

CREATE TABLE Posts (
    PostID INT PRIMARY KEY AUTO_INCREMENT,
    AuthorID INT,
    Title VARCHAR(255) NOT NULL,
    Content TEXT NOT NULL,
    PublishedDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

INSERT INTO Posts (AuthorID, Title, Content, PublishedDate) VALUES
(1, 'The Future of Technology', 'Content about upcoming technology trends...', '2023-01-01 10:00:00'),
(2, 'Political Changes and Their Impact', 'Discussion on recent political changes...', '2023-02-01 09:30:00'),
(3, 'Top 10 Travel Destinations for 2023', 'Explore the top travel destinations for this year...', '2023-03-05 15:20:00'),
(1, 'Sustainable Living and Technology', 'How technology can aid in living a sustainable lifestyle...', '2023-04-10 12:45:00');


DROP TABLE IF EXISTS Comments;

CREATE TABLE Subscribers (
    SubscriberID INT PRIMARY KEY AUTO_INCREMENT,
    Email VARCHAR(255) UNIQUE NOT NULL,
    SubscriptionDate DATETIME DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO Subscribers (Email, SubscriptionDate) VALUES
('subscriber1@example.com', '2023-01-15 09:00:00'),
('subscriber2@example.com', '2023-02-20 08:30:00'),
('subscriber3@example.com', '2023-03-25 14:00:00');
