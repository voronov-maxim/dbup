create view "OrderItemsView" as
	select o."Name", i."Product" from "Orders" o inner join "OrderItems" i on o."Id" = i."OrderId";
