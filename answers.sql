

-- Question 1: Achieving 1NF (First Normal Form)

-- Create the new table in 1NF
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(50),
    PRIMARY KEY (OrderID, Product) -- Composite primary key to ensure uniqueness
);

-- Insert data into ProductDetail_1NF, splitting Products into separate rows
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES
    (101, 'John Doe', 'Laptop'),
    (101, 'John Doe', 'Mouse'),
    (102, 'Jane Smith', 'Tablet'),
    (102, 'Jane Smith', 'Keyboard'),
    (102, 'Jane Smith', 'Mouse'),
    (103, 'Emily Clark', 'Phone');

-- Verify the 1NF table
SELECT * FROM ProductDetail_1NF;

-- Question 2: Achieving 2NF (Second Normal Form)

-- Create the Orders table (for OrderID and CustomerName)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Create the OrderItems table (for OrderID, Product, Quantity)
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    PRIMARY KEY (OrderID, Product), -- Composite primary key
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) -- Links to Orders table
);

-- Insert data into Orders (unique OrderID and CustomerName)
INSERT INTO Orders (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

-- Insert data into OrderItems (OrderID, Product, Quantity)
INSERT INTO OrderItems (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;

-- Verify the 2NF tables
SELECT * FROM Orders;
SELECT * FROM OrderItems;