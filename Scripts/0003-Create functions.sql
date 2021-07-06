create function "ResetDb"()
    returns void
as $$
    delete from "OrderItems";
    delete from "Orders";
    delete from "Customers";
    delete from "Categories";

    alter sequence "Categories_Id_seq" restart with 1;
    alter sequence "Orders_Id_seq" restart with 1;
    alter sequence "OrderItems_Id_seq" restart with 1;
$$ language sql;

create function "ScalarFunction"()
returns integer as $$
declare orderCount integer;
begin
    select count(*) into orderCount from "Orders";
    return orderCount;
end
$$ language plpgsql;
