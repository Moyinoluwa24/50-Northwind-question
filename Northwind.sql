-- Create a report that shows the CategoryName and Description from the categories table sorted by CategoryName.
select categoryname, description 
from categories
order by categoryname;

-- Create a report that shows the ContactName, CompanyName, ContactTitle and Phone number from the customers table sorted by Phone.
select ContactName, CompanyName, ContactTitle, Phone
from customers
order by phone;

/* Create a report that shows the capitalized FirstName and capitalized LastName renamed as FirstName and Lastname respectively and HireDate from 
the employees table sorted from the newest to the oldest employee.*/
select 
  UPPER(firstName) as First_name,
  ucase(lastName) as last_name,
  HireDate
from employees
order by HireDate desc;
 
/*Create a report that shows the top 10 OrderID, OrderDate, ShippedDate, CustomerID, Freight from the orders table sorted
by Freight in descending order.*/
select OrderID, OrderDate, ShippedDate, CustomerID, Freight
from orders
order by freight desc;

-- Create a report that shows all the CustomerID in lowercase letter and renamed as ID from the customers table.
select lower(CustomerID) as ID
from customers;

/*Create a report that shows the CompanyName, Fax, Phone, Country, HomePage from the suppliers table sorted by the
Country in descending order then by CompanyName in ascending order.*/
select CompanyName, Fax, Phone, Country, HomePage
from suppliers 
order by country desc, CompanyName asc;

-- Create a report that shows CompanyName, ContactName of all customers from ‘Buenos Aires' only.
select CompanyName, ContactName
from customers
where ContactName like '%Buenos Aires%';

-- Create a report showing ProductName, UnitPrice, QuantityPerUnit of products that are out of stock.
select ProductName, UnitPrice, QuantityPerUnit
from products
where QuantityPerUnit like '%out of stock%';

-- Create a report showing all the ContactName, Address, City of all customers not from Germany, Mexico, Spain.
select ContactName, Address, City
from customers 
where country not in ('germany','mexico','spain');

-- Create a report showing OrderDate, ShippedDate, CustomerID, Freight of all orders placed on 21 May 1996.
select OrderDate, ShippedDate, CustomerID, Freight
from orders
where OrderDate= 1996-05-21;

-- Create a report showing FirstName, LastName, Country from the employees not from United States.
select FirstName, LastName, Country
from employees 
where Country != 'United states';

-- Create a report that shows the EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate from all orders shipped later than the required date.
select o.EmployeeID,o.OrderID, o.CustomerID, o.RequiredDate, o.ShippedDate 
from orders o
where o.ShippedDate > o.requireddate;

-- Create a report that shows the City, CompanyName, ContactName of customers from cities starting with A or B.
select City, CompanyName, ContactName
from customers
where city like 'A%'or'B%';

-- Create a report showing all the even numbers of OrderID from the orders table.
select orderID
from orders
where orderID %2=0;

-- Create a report that shows all the orders where the freight cost more than $500.
select *
from orders
where Freight > 500;

-- Create a report that shows the ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel of all products that are up for reorder.
select  ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel
from products
where UnitsInStock <= ReorderLevel;

-- Create a report that shows the CompanyName, ContactName number of all customer that have no fax number
select CompanyName, ContactName
from customers
where Fax = null;

-- Create a report that shows the FirstName, LastName of all employees that do not report to anybody.
select FirstName, LastName
from employees
where EmployeeID;

-- Create a report showing all the odd numbers of OrderID from the orders table.
select *
from orders
where OrderID %2<>0;

-- Create a report that shows the CompanyName, ContactName, Fax of all customers that do not have Fax number and sorted by ContactName.
select CompanyName, ContactName, Fax 
from customers
where fax = null
order by ContactName desc;

-- Create a report that shows the City, CompanyName, ContactName of customers from cities that has letter L in the name sorted by ContactName.
select City, CompanyName, ContactName
from customers 
where city like '%L%'
order by contactName asc;

-- Create a report that shows the FirstName, LastName, BirthDate of employees born in the 1950s.
select FirstName, LastName, BirthDate
from employees
where BirthDate =1950; 

-- Create a report that shows the FirstName, LastName, the year of Birthdate as birth year from the employees table.
select FirstName, LastName, date_format(Birthdate, '%Y') as birthyear
from employees;


/*Create a report showing OrderID, total number of Order ID as NumberofOrders from the orderdetails table grouped by
OrderID and sorted by NumberofOrders in descending order. HINT: you will need to use a Groupby statement.*/
SELECT OrderID, COUNT(*) as NumberofOrders
FROM `order details`
GROUP BY OrderID
ORDER BY NumberofOrders DESC;

/*Create a report that shows the SupplierID, ProductName, CompanyName from all product Supplied by Exotic Liquids, Specialty Biscuits, Ltd., Escargots
 Nouveaux sorted by the supplier ID*/
 select SupplierID, ProductName, CompanyName
 from products
 cross join shippers
 where companyName like 'exoctic Liquids, Specialty Biscuits, Ltd., Escargots Nouveaux'
 order by SupplierID asc;
 
/*Create a report that shows the ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress of all orders
with ShipPostalCode beginning with "98124".*/
select ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress
from  orders
where ShipPostalCode = 98124;

-- Create a report that shows the ContactName, ContactTitle, CompanyName of customers that the has no "Sales" in their ContactTitle.
select ContactName, ContactTitle, CompanyName
from customers
where ContactTitle != 'sales';

-- Create a report that shows the LastName, FirstName, City of employees in cities other "Seattle";
select LastName, FirstName, City 
from employees
where city!= 'Seattle';

-- Create a report that shows the CompanyName, ContactTitle, City, Country of all customers in any city in Mexico or other cities in Spain other than Madrid.
select CompanyName, ContactTitle, City, Country
from customers
where (Country = 'Mexico' AND City != '')
OR (Country = 'Spain' AND City != 'Madrid');
 
-- Create a select statement that outputs the following:
select concat(firstname, ' ', lastname, 'can be reached on',' ','x',extension) as contactinfo
from employees;

-- Create a report that shows the ContactName of all customers that do not have letter A as the second alphabet in their Contactname.
SELECT concat(firstname, ' ', lastname) as fullname
FROM employees
WHERE concat(firstname, ' ', lastname) not like'_A%';

/*Create a report that shows the average UnitPrice rounded to the next whole number, total price of UnitsInStock and maximum number of orders from the
products table. All saved as AveragePrice, TotalStock and MaxOrder respectively.*/
 select round(avg(UnitPrice)) as AveragePrice, sum(unitsinstock) as TotalStock, max(unitsonorder) as MaxOrder
 from products;

 /*Create a report that shows the SupplierID, CompanyName, CategoryName, ProductName and UnitPrice from the products,
suppliers and categories table. */
SELECT s.SupplierID,s.CompanyName,c.CategoryName,p.ProductName,p.UnitPrice
FROM products p
INNER JOIN suppliers s ON p.SupplierID = s.SupplierID
INNER JOIN categories c ON p.CategoryID = c.CategoryID;

/*Create a report that shows the CustomerID, sum of Freight, from the orders table with sum of freight greater $200, grouped
by CustomerID. HINT: you will need to use a Groupby and a Having statement. */
select CustomerID, sum(Freight) as sum_of_freight
from orders
group by CustomerID 
having CustomerID > '$200';

/*Create a report that shows the OrderID ContactName, UnitPrice, Quantity, Discount from the order details, orders and
customers table with discount given on every purchase. */
SELECT orders.OrderID, customers.ContactName,`order details`.UnitPrice,`order details`.Quantity,`order details`.Discount
FROM `order details`
INNER JOIN orders ON `order details`.OrderID = orders.OrderID
INNER JOIN customers ON orders.CustomerID = customers.CustomerID
WHERE `order details`.Discount;

/*Create a report that shows the EmployeeID, the LastName and FirstName as employee, and the LastName and FirstName of
who they report to as manager from the employees table sorted by Employee ID. HINT: This is a SelfJoin. */
select A.EmployeeID,concat(a.firstname, ' ',a.LastName) as employee, concat(b.firstname, ' ',b.lastname) as Manager, a.title as tittle 
from employees a
left join employees b on b.EmployeeID= a.ReportsTo
order by b.EmployeeID;

/*Create a report that shows the average, minimum and maximum UnitPrice of all products as AveragePrice, MinimumPrice
and MaximumPrice respectively. */
select avg(unitprice) as AveragePrice , min(unitprice) as  MinimumPrice, max(unitprice) as MaximumPrice
from `Order Details`;

/*Create a view named CustomerInfo that shows the CustomerID, CompanyName, ContactName, ContactTitle, Address, City,
Country, Phone, OrderDate, RequiredDate, ShippedDate from the customers and orders table. HINT: Create a View. */
create view customerInfo as
select customers.customerid,customers.CompanyName, customers.ContactName, customers.ContactTitle, customers.Address, customers.City,customers.Country,
customers.Phone, orders.OrderDate, orders.RequiredDate,orders.ShippedDate
from customers 
join orders ON customers.customerID = orders.CustomerID;

-- Change the name of the view you created from customerinfo to customer details.
rename table customerInfo to customer_details;

/*Create a view named ProductDetails that shows the ProductID, CompanyName, ProductName, CategoryName, Description,
QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued from the supplier, products and
categories tables. HINT: Create a View*/
create view ProductDetails as 
select products.ProductID, suppliers.CompanyName, products.ProductName, categories.CategoryName,categories.Description,products.QuantityPerUnit, 
products.UnitPrice,products.UnitsInStock,products.UnitsOnOrder, products.ReorderLevel,products.Discontinued
from suppliers 
join products on suppliers.supplierID = products.supplierID
join categories on products.categoryid = categories.categoryID;

-- Drop the customer details view.
drop view customer_details;

-- Create a report that fetch the first 5 character of categoryName from the category tables and renamed as ShortInfo
select left(categoryname,5) as shortinfo
from categories;

/* Create a copy of the shipper table as shippers_duplicate. Then insert a copy of shippers data into the new table HINT: Create
a Table, use the LIKE Statement and INSERT INTO statement.*/
create table shippers_duplicate like shippers;

-- Create a select statement that outputs the following from the shippers_duplicate Table:
select *
from shippers_duplication;

-- Create a report that shows the CompanyName and ProductName from all product in the Seafood category.
select  CompanyName,ProductName
from products
cross join categories
where categoryName ='seafood';

-- Create a report that shows the CategoryID, CompanyName and ProductName from all product in the categoryID 5.
select CategoryID, CompanyName, ProductName
from products
cross join shippers
where CategoryID = 5;

-- Delete the shippers_duplicate table.
drop table shippers_duplicate;

/*Create a select statement that ouputs the following from the employees table. NB: The age might differ depending on the year you are attempting this query*/
select lastname, firstname, title, timestampdiff(year, birthdate, '%2024-%07-%17') as age
from employees;

/*Create a report that the CompanyName and total number of orders by customer renamed as number of orders since 
Decemeber 31, 1994. Show number of Orders greater than 10.*/
select c.CompanyName,COUNT(o.OrderID) AS number_of_orders
from customers c
inner join orders o on c.CustomerID = o.CustomerID
where  o.OrderDate >= '1994-12-31'
group by c.CompanyName
having number_of_orders > 10;

-- Create a select statement that ouputs the following from the product table
select concat(productname, ' ','weighs', ' ', quantityperunit, ' ', 'and cost', ' ', '$',unitprice) as productinfo
from products;
