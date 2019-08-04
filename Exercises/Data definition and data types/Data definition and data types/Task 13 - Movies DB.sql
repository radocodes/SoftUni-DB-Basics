CREATE DATABASE Movies

CREATE TABLE Directors
(
Id INT PRIMARY KEY IDENTITY NOT NULL,
DirectorName NVARCHAR(50) NOT NULL,
Notes NVARCHAR(MAX),
)

CREATE TABLE Genres
(
Id INT PRIMARY KEY IDENTITY NOT NULL,
GenreName NVARCHAR(50) NOT NULL,
Notes NVARCHAR(MAX)
)

CREATE TABLE Categories
(
Id INT PRIMARY KEY IDENTITY NOT NULL,
CategoryName NVARCHAR(50) NOT NULL,
Notes NVARCHAR(MAX)
)

CREATE TABLE Movies
(
Id INT PRIMARY KEY IDENTITY NOT NULL,
Title NVARCHAR(50) NOT NULL,
DirectorId INT NOT NULL,
CopyRightYear INT,
Length NUMERIC(5,2),
GenreId INT NOT NULL,
CategoryId INT,
Rating NUMERIC(4,2),
Notes NVARCHAR(MAX)
)

INSERT INTO Directors (DirectorName, Notes)
VALUES 
('Francis Ford Coppola', 'The godfather'),
('Quentin Tarantino', 'Kill Bill'),
('Robert Zemeckis', 'Forrest Gump'),
('Christopher Nolan', 'Interstellar'),
('George Lucas', 'Star wars')

INSERT INTO Genres(GenreName, Notes)
VALUES
('Horror', 'Scary stuff'),
('Action', 'Action movie'),
('Drama', 'Tears, man'),
('Thriller', 'Killings'),
('Comedy', 'Laugh')

INSERT INTO Categories(CategoryName, Notes)
VALUES 
('Scary', 'very scarry'),
('Fun', 'funny stuff'),
('Bad movies', 'wasted money'),
('Awful movies', 'should be banned'),
('Great', 'should be watched a million times')

INSERt INTO Movies (Title, DirectorId, CopyrightYear, Length, GenreId, CategoryId, Rating, Notes)
VALUES 
('Forrest Gump', 3, 1997, 180, 3, 5, 10, 'perfect'),
('Interstellar', 4, 2014, 186, 2, 5, 10, 'great movie'),
('Kill bill', 2, 2001, 179, 1, 2, 9, 'blood everywhere'),
('The godfather', 1, 1974, 189, 3, 5, 10, 'the best'),
('Star wars', 5, 1976, 201, 2, 2, 8, 'let the force be with you')
