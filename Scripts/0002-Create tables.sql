create table "Categories"
(
    "Id" integer not null default nextval('"Categories_Id_seq"'),
    "Name" character varying(128) not null,
    "ParentId" integer,
    "DateTime" timestamp without time zone,
    constraint "PK_Categories" primary key ("Id"),
    constraint "FK_Categories_Categories" foreign key ("ParentId") references "Categories"("Id")
);

create table "Customers"
(
    "Address" character varying(256),
    "Country" character(2) not null,
    "Id" integer not null,
    "Name" character varying(128) not null,
    "Sex" integer,
    constraint "PK_Customer" primary key ("Country", "Id")
);

create table "Orders"
(
    "AltCustomerCountry" character(2),
    "AltCustomerId" integer,
    "CustomerCountry" character(2) not null,
    "CustomerId" integer not null,
    "Date" timestamp with time zone,
    "Dummy" integer null,
    "Id" integer not null default nextval('"Orders_Id_seq"'),
    "Name" character varying(256) not null,
    "Status" integer not null,
    constraint "PK_Orders" primary key ("Id"),
    constraint "FK_Orders_AltCustomers" foreign key ("AltCustomerCountry", "AltCustomerId") references "Customers"("Country", "Id"),
    constraint "FK_Orders_Customers" foreign key ("CustomerCountry", "CustomerId") references "Customers"("Country", "Id")
);

create table "OrderItems"
(
    "Count" integer,
    "Id" integer not null default nextval('"OrderItems_Id_seq"'),
    "OrderId" integer not null,
    "Price" decimal(18, 2),
    "Product" character varying(256) not null,
    constraint "PK_OrderItem" primary key ("Id"),
    constraint "FK_OrderItem_Order" foreign key ("OrderId") references "Orders"("Id")
);
