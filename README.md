# E-Commerce-Database-Modeling

## Overview
This repository contains the design documentation for an E-Commerce database model. The model encompasses various entities that represent key components of an E-Commerce system. The included entities are:

**CUSTOMER:** Represents information about the customers using the platform. </br>
**PRODUCT:** Contains details about the products available for purchase. </br>
**ORDER:** Represents individual orders placed by customers. </br>
**PAYMENT:** Stores information related to payments made for orders. </br>
**SHIPPING:** Contains details about the shipping process for orders. </br>
**MERCHANT:** Represents the merchants or vendors providing products on the platform. </br>
**CAMPAIGN:** Stores information about marketing campaigns. </br>
**COMMENT: **Contains comments or reviews made by customers on products. </br>
**ADDRESS: **Represents physical addresses, which can be associated with customers, merchants, or orders. </br>
**CREDITCARD:** Stores credit card information for payment processing. </br>
**ORDERPRODUCT:** Solving the many to many relation between order and product entities, this associative entity was created.

## ER Diagram 

![Alt text](https://github.com/fozgur/E-Commerce-Database-Modeling/blob/main/ER%20Diagram.jpg?raw=true)

## Physical Design using Oracle Database

To implement the E-Commerce database model in Oracle, DDL commands which can be found in [here](https://github.com/fozgur/E-Commerce-Database-Modeling/blob/main/eCommerce%20Database.sql) are committed in Oracle via DBEaver.

## Insert Statements
For each table, SQL statements have been provided to insert a minimum of 5 rows, ensuring initial data for testing and development.

Please refer to the [eCommerce Database.sql](https://github.com/fozgur/E-Commerce-DatabaseModeling/blob/main/eCommerce%20Database.sql) file for detailed statements.

Note: Before executing these SQL statements, ensure you have set up an Oracle Database environment and adjusted the statements accordingly.
