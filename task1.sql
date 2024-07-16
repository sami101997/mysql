create table shopping_history(
product varchar (50) not null,
quantity integer not null,
unit_price integer not null
);

--Drop table shopping_history

select * from shopping_history

insert into shopping_history values ('milk',3,10)
insert into shopping_history values ('bread',7,3)
insert into shopping_history values ('bread',5,2)

Select product, SUM (quantity * unit_price) as total_price from shopping_history Group by product order by product desc


