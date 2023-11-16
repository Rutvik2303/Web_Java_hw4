/***********************************************************
* Create the database named hw4, its tables, and a database user
************************************************************/

DROP DATABASE IF EXISTS hw4;

CREATE DATABASE hw4;

USE hw4;

CREATE TABLE User (
  UserID INT NOT NULL AUTO_INCREMENT,
  Email VARCHAR(50),
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Password VARCHAR(50),
  
  PRIMARY KEY(UserID) 
);

INSERT INTO User 
  (Email, FirstName, LastName, Password)
VALUES 
  ('bat@gmail.com', 'Bat', 'Man', 'bat'),
  ('spider@gmail.com', 'Spider', 'Man', 'spider'), 
  ('super@gmail.com', 'Super', 'Man', 'super');
  
  
  CREATE TABLE Book (
  BookID INT NOT NULL AUTO_INCREMENT,
    Cover VARCHAR(500),
    Title VARCHAR(50),
    Price float,
    PRIMARY KEY(BookID)
);

INSERT INTO Book 
  (Cover, Title, Price)
VALUES 
  ('https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F6%2F2016%2F09%2Fhpsorcstone.jpg&q=60', 'Harry Potter Philosophers Stone', 10.00),
  ('https://m.media-amazon.com/images/I/81THMAxo+pL._SL1500_.jpg', 'Harry Potter Chamber of Secrets', 15.00), 
  ('https://m.media-amazon.com/images/I/81lAPl9Fl0L._SL1500_.jpg', 'Harry Potter Prisoner of Azkaban', 20.00),
  ('https://m.media-amazon.com/images/I/91gZX7sjnpL._SL1500_.jpg','Harry Potter Goblet of Fire',25.00);

 
 -- Create student and grant privileges

DELIMITER //
CREATE PROCEDURE drop_user_if_exists()
BEGIN
    DECLARE userCount BIGINT DEFAULT 0 ;

    SELECT COUNT(*) INTO userCount FROM mysql.user
    WHERE User = 'student' and  Host = 'localhost';

    IF userCount > 0 THEN
        DROP USER student@localhost;
    END IF;
END ; //
DELIMITER ;

CALL drop_user_if_exists() ;

CREATE USER student@localhost IDENTIFIED BY 'sesame';

GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP
ON hw4.*
TO student@localhost;

  
USE hw4;
SELECT * FROM Book;