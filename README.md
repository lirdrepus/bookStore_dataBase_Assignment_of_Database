Assignment Submitted on Sep 28, 2025

You are required to create a database for the fictitious bookstore Oktomook. The database is based on the following model.  

THE OKTOMOOK RELATIONAL MODEL: 

Branch (branchNo, bName, bStreetNo, bStreetName, bPostCode, bState, numberEmployees) 

Publisher (publisherNo, pName, pStreetNo, pStreetName, pPostCode, pState,) 

Author (authorID, aFirstName, aLastName) 

Book (ISBN, title, publisherNo, genre, retailPrice, paperback) 

Wrote (ISBN, authorID) 

Inventory (ISBN, branchNo, quantityInStock) 


Write an SQL script that builds a database to match the relational model. These SQL statements in the script must be provided in the correct order. 

Notes for the relational model:

Primary keys are denoted by bold and underline.

Foreign keys 

•	Book(publisherNo) is dependent on Publisher (publisherNo). 

•	Wrote (ISBN) is dependent on Book (ISBN). 

•	Wrote (authorID) is dependent on Author (authorID). 

•	Inventory (ISBN) is dependent on Book (ISBN).

•	Inventory (branchNo) is dependent on Branch (branchNo). 

 

Other constraints and remarks 

•	branchNo is a string comprising three digits. 

•	ISBN is a string comprising 10 digits. 

•	publisherNo is a string comprising one letter and two digits. 

•	authorID is a string comprising four digits.

•	PostCode is a string comprising four digits.

•	State is a string with three or less letters.•	INTEGER type must be used for retailPrice, numberEmployees and quantityInStock. 
