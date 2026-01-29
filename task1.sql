-- Assignment 2, Task 1
PRAGMA foreign_keys = ON;

-- Branch (branchNo, bName, bStreetNo, bStreetName, bPostCode, bState, numberEmployees)
CREATE TABLE IF NOT EXISTS Branch (
  branchNo TEXT NOT NULL PRIMARY KEY,
  bName TEXT NOT NULL,
  bStreetNo TEXT,
  bStreetName TEXT,
  bPostCode TEXT NOT NULL,
  bState TEXT NOT NULL,
-- INTEGER type must be used for numberEmployees
  numberEmployees INTEGER NOT NULL CHECK(numberEmployees >= 0),
-- branchNo is a string comprising three digits. 
  CHECK (length(branchNo) = 3 AND branchNo GLOB '[0-9][0-9][0-9]'),
-- PostCode is a string comprising four digits.
  CHECK (length(bPostCode) = 4 AND bPostCode GLOB '[0-9][0-9][0-9][0-9]'),
-- State is a string with three or less letters.
  CHECK (length(bState) <= 3)
);

-- Publisher (publisherNo, pName, pStreetNo, pStreetName, pPostCode, pState,)
CREATE TABLE IF NOT EXISTS Publisher (
  publisherNo TEXT NOT NULL PRIMARY KEY,
  pName TEXT NOT NULL,
  pStreetNo TEXT,
  pStreetName TEXT,
  pPostCode TEXT NOT NULL,
  pState TEXT NOT NULL,
-- publisherNo is a string comprising one letter and two digits. 
  CHECK (length(publisherNo) = 3 AND publisherNo GLOB '[A-Za-z][0-9][0-9]'),
-- PostCode is a string comprising four digits.
  CHECK (length(pPostCode) = 4 AND pPostCode GLOB '[0-9][0-9][0-9][0-9]'),
-- State is a string with three or less letters.
  CHECK (length(pState) <= 3)
);

-- Author (authorID, aFirstName, aLastName)
CREATE TABLE IF NOT EXISTS Author (
  authorID TEXT NOT NULL PRIMARY KEY,
  aFirstName TEXT,
  aLastName TEXT,
-- authorID is a string comprising four digits.
  CHECK (length(authorID) = 4 AND authorID GLOB '[0-9][0-9][0-9][0-9]')
);

-- Book (ISBN, title, publisherNo, genre, retailPrice, paperback)
CREATE TABLE IF NOT EXISTS Book (
  ISBN TEXT NOT NULL PRIMARY KEY,
  title TEXT NOT NULL,
  publisherNo TEXT NOT NULL,
  genre TEXT,
-- INTEGER type must be used for retailPrice
  retailPrice INTEGER NOT NULL CHECK(retailPrice >= 0),
  paperback INTEGER NOT NULL CHECK(paperback IN (0,1)), 
-- Book(publisherNo) is dependent on Publisher (publisherNo). 
  FOREIGN KEY (publisherNo) REFERENCES Publisher(publisherNo),
-- ISBN is a string comprising 10 digits. 
  CHECK (length(ISBN) = 10 AND ISBN GLOB '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);

-- Wrote (ISBN, authorID)
CREATE TABLE IF NOT EXISTS Wrote (
  ISBN TEXT NOT NULL ,
  authorID TEXT NOT NULL,
  PRIMARY KEY (ISBN, authorID),
-- Wrote (ISBN) is dependent on Book (ISBN). 
  FOREIGN KEY (ISBN) REFERENCES Book(ISBN),
-- Wrote (authorID) is dependent on Author (authorID).
  FOREIGN KEY (authorID) REFERENCES Author(authorID)
);

--Inventory (ISBN, branchNo, quantityInStock)
CREATE TABLE IF NOT EXISTS Inventory (
  ISBN TEXT NOT NULL,
  branchNo TEXT NOT NULL,
-- INTEGER type must be used for quantityInStock
  quantityInStock INTEGER NOT NULL CHECK(quantityInStock >= 0),
  PRIMARY KEY (ISBN, branchNo),
-- Inventory (ISBN) is dependent on Book (ISBN).
  FOREIGN KEY (ISBN)   REFERENCES Book(ISBN),
-- Inventory (branchNo) is dependent on Branch (branchNo).
  FOREIGN KEY (branchNo) REFERENCES Branch(branchNo)
);