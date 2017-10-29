rm(list=ls())

getwd()

library(XLConnect)

library(sqldf)


Work_Book <- loadWorkbook("Northwind.xls")

Categories <- readWorksheet(Work_Book , sheet = "Categories")
Customers <- readWorksheet(Work_Book , sheet = "Customers")
Employees <- readWorksheet(Work_Book , sheet = "Employees")
Orders_Details <- readWorksheet(Work_Book , sheet = "Orders Details")

Orders <- readWorksheet(Work_Book , sheet = "Orders")
Product <- readWorksheet(Work_Book , sheet = "Product")
Shippers <- readWorksheet(Work_Book , sheet = "Shippers")
Suppliers <- readWorksheet(Work_Book , sheet = "Suppliers")

sqldf("SELECT * FROM Categories")
sqldf("SELECT Orders.OrderID, Customers.CompanyName, Orders.OrderDate
       FROM Orders
       INNER JOIN Customers
       USING(CustomerID)")

#SELECT DISTINCT COUNTRIES
sqldf("SELECT DISTINCT Country
       FROM Customers;")

#COUNT OF DISTINCT COUNTRIES
sqldf("SELECT COUNT(DISTINCT Country)
       FROM Customers;")

#SQL statement selects all the customers from the country "Mexico", in the "Customers" table
sqldf("SELECT * 
      FROM Customers
      WHERE Country = 'Mexico';")

#SQL statement selects all fields from "Customers" where country is "Germany" AND city is "Berlin"
sqldf("SELECT *
      FROM Customers
      WHERE Country = 'Germany' AND city = 'Berlin';")

#SQL statement selects all fields from "Customers" where country is NOT "Germany"
sqldf("SELECT *
      FROM Customers
      WHERE Country <> 'Germany';")

#SQL statement selects all fields from "Customers" where country is "Germany" AND 
#city must be "Berlin" OR "München" (use parenthesis to form complex expressions)

sqldf("SELECT *
       FROM Customers
       WHERE country = 'Germany' AND  (City = 'Berlin' OR City = 'München');")

#SQL statement selects all fields from "Customers" where country is NOT "Germany" and NOT "USA"
sqldf("SELECT *
       FROM Customers
       WHERE Country <> 'Germany' AND Country <> 'USA' ;")

#SQL statement selects all customers from the "Customers" table, sorted by the "Country" column
sqldf("SELECT * 
       FROM Customers
       ORDER By Country;")

#SQL statement selects all customers from the "Customers" table, sorted DESCENDING by the "Country" column
sqldf("SELECT * 
       FROM Customers
       ORDER BY Country DESC;")

#SQL statement selects all customers from the "Customers" table, sorted by the "Country" and the "CustomerName" column
sqldf("SELECT *
       FROM Customers
       ORDER BY Country,CompanyName;")

#SQL statement selects all customers from the "Customers" table, sorted ascending by the "Country" and 
#descending by the "CustomerName" column
sqldf("SELECT * 
       FROM Customers
       ORDER BY Country ASC , CompanyName DESC;")
       
#SQL statement updates the first customer (CustomerID = ALFKI) with a new contact person and a new city.
sqldf(c("UPDATE Customers
        SET CompanyName = 'Alfred Schmidt' , City = 'Frankfurt'
        WHERE CustomerID ='ALFKI'","SELECT *
        FROM Customers
        WHERE CustomerID = 'ALFKI'"))

#SQL statement will update the contactname to "Juan" for all records where country is "Mexico"
sqldf(c("UPDATE Customers
         SET ContactName = 'Juan'
         WHERE Country = 'Mexico'",
         "SELECT *
          FROM Customers
          WHERE ContactName = 'Juan'"))

#SQL statement finds the price of the cheapest product
sqldf("SELECT *,MIN(UnitPrice)
       FROM Product;")

#SQL statement finds the price of the most expensive product
sqldf("SELECT *,MAX(UnitPrice)
       FROM Product;")

#SQL statement finds the number of products
sqldf("SELECT COUNT(ProductID)
       FROM Product;")



sqldf("SELECT AVG(UnitPrice)
       FROM Product;")

# SQL statement finds the sum of the "Quantity" fields in the "OrderDetails" table
sqldf("SELECT SUM(Quantity)
       FROM Orders_Details;")

#SQL statement selects all customers with a CustomerName that starts with "a" and are at least 3 characters in length
sqldf("SELECT *
       FROM Customers
       WHERE CompanyName LIKE  'a_%_%';")


#SQL statement selects all customers with a ContactName that starts with "a" and ends with "o"
sqldf("SELECT *
       FROM Customers
      WHERE ContactName LIKE  'a%o';")

# SQL statement selects all customers with a CustomerName that does NOT start with "a"
sqldf("SELECT *
       FROM Customers
      WHERE ContactName NOT LIKE  'a%';")

#SQL statement (that contains an INNER JOIN), that selects records that have matching values in both tables
sqldf("SELECT O.OrderID,C.CompanyName,O.OrderDate
       FROM Orders AS O
       INNER JOIN Customers As C
       USING(CustomerID);")

sqldf("SELECT O.OrderID,C.CompanyName,O.OrderDate
       FROM Orders AS O
       LEFT JOIN Customers As C
      USING(CustomerID);")


       
#Self-Join within Customers Table representing two Company's from same City
sqldf("SELECT A.CompanyName AS Name1,B.CompanyName As Nam2,A.City, B.City
       FROM Customers AS A
       INNER JOIN Customers As B
       WHERE A.CustomerID <> B.CustomerID
       AND A.City = B.City
       ORDER By Name1;")

#Joins across 3 tables - Orders,Customers and Shippers
sqldf("SELECT O.OrderID,C.CompanyName,S.CompanyName
       FROM Orders AS O
       INNER JOIN Customers As C
       USING(CustomerID)
       INNER JOIN Shippers As S
       ON O.ShipVia = S.ShipperID;")

#SQL statement selects all the different cities (only distinct values) from "Customers" and "Suppliers":
# UNION - automatically takes only distinct values, to include duplciates use DISTINCT ALL
sqldf("SELECT City FROM Customers
       UNION
       SELECT City FROM Suppliers
       ORDER BY City")


sqldf("SELECT City FROM Customers
       UNION ALL
       SELECT City FROM Suppliers
       ORDER BY City")


#SQL statement lists the number of customers in each country
sqldf("SELECT COUNT(CustomerID), Country
       FROM Customers
       GROUP BY Country")

#SQL statement lists the number of customers in each country, sorted high to low
sqldf("SELECT COUNT(CustomerID) , Country
      FROM Customers
      GROUP BY Country
      ORDER BY COUNT(CUstomerID) DESC;")


#HAVING clause was added to SQL because the WHERE keyword could not be used with aggregate functions.

#SQL statement lists the number of customers in each country. Only include countries with more than 5 customers
sqldf("SELECT COUNT(CustomerID), Country
      FROM Customers
      GROUP BY Country
      HAVING COUNT(CustomerID) > 5 
      ORDER BY COUNT(CustomerID);")


#EXISTS operator is used to test for the existence of any record in a subquery.
# SQL statement returns TRUE and lists the suppliers with a product price less than 20

sqldf("SELECT DISTINCT S.CompanyName
       FROM Suppliers AS S
       INNER JOIN Product AS P
       ON S.SupplierID =  P. SupplierID
       WHERE P.UnitPrice < 20;")

#SQL statement returns TRUE and lists the productnames if it finds 
#ANY records in the OrderDetails table that quantity = 10:

sqldf("SELECT  P.ProductName
      FROM Product P
      INNER JOIN Orders_Details
      USING(ProductId)
      WHERE Quantity = 10
      GROUP BY P.ProductName;")


#SQL statement returns TRUE and lists the productnames if 
#ALL the records in the OrderDetails table has quantity = 10: 

sqldf("SELECT  P.ProductName
      FROM Product P
      INNER JOIN Orders_Details
      USING(ProductId)
      WHERE Quantity > 99
      GROUP BY P.ProductName;")


    
