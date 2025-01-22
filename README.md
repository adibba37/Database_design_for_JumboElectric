---

## JumboElectric Database Design

This repository contains the database schema for **JumboElectric**, an electrical shop based in The Gambia. The design is aimed at managing key aspects of the business, including inventory, sales, customers, suppliers, and employees.

### Key Features:
- **Products**: Store details of all electrical items sold in the shop, including prices, stock levels, and supplier information.
- **Suppliers**: Track the suppliers providing the products, with contact details.
- **Customers**: Manage customer information, including purchase history and contact details.
- **Sales**: Record all sales transactions and associate them with customers and products.
- **SalesDetails**: Capture specific product details for each sale, including quantity and price.
- **Employees**: Track employee information, including roles and contact details.

### Database Design:
The database is designed using Microsoft SQL Server (MSSQL), with a relational structure that ensures data integrity and easy querying. Key tables include:
- **Suppliers**
- **Products**
- **Customers**
- **Sales**
- **SalesDetails**
- **Employees**

### Relationships:

1. **Suppliers ↔ Products**:
   - **One-to-Many**: A supplier can supply multiple products, but each product is supplied by one supplier.
   - **Foreign Key**: `SupplierID` in the **Products** table references `SupplierID` in the **Suppliers** table.

2. **Customers ↔ Sales**:
   - **One-to-Many**: A customer can have many sales transactions, but each sale is linked to one customer.
   - **Foreign Key**: `CustomerID` in the **Sales** table references `CustomerID` in the **Customers** table.

3. **Sales ↔ SalesDetails**:
   - **One-to-Many**: A sale can have multiple products (each line item), but each line item belongs to one sale.
   - **Foreign Key**: `SaleID` in the **SalesDetails** table references `SaleID` in the **Sales** table.

4. **Products ↔ SalesDetails**:
   - **One-to-Many**: A product can appear in many sales transactions, but each sales detail record refers to one specific product.
   - **Foreign Key**: `ProductID` in the **SalesDetails** table references `ProductID` in the **Products** table.

5. **Employees ↔ Sales or Operations**:
   - If tracking employee sales or operations, you could introduce an `EmployeeID` in the **Sales** or other tables, establishing a relationship. For now, this is optional based on your business logic.

### ERD Concept:
- **Suppliers** → **Products** (One-to-Many)
- **Customers** → **Sales** (One-to-Many)
- **Sales** → **SalesDetails** (One-to-Many)
- **Products** → **SalesDetails** (One-to-Many)

---
