






-------------------------- Select Operation ----------------------------------


--Showing all menus name and price in the restaurant

select menu_name, selling_price
from menu;




--Showing all employees employee_id, f_name, l_name in the restaurant

select employee_id, f_name, l_name
from employee;




--Showing all mexican menus name and price in the restaurant

select menu_name, selling_price
from menu where origin = 'Mexico';



--Showing total menus sold in 21-NOV-2018 by using ordered_menu table

select count(distinct(menu_id)) as total_sold_menus 
from ordered_menu;




--Showing salary of waiters with 5% bonus

select f_name, salary + (salary*(5/100)) as salary_with_bonus 
from employee 
where designation = 'Waiter';




--Showing employees name and designation except chef and waiter

select f_name, designation
from employee 
where designation != 'Waiter' and designation != 'Chef';




--Showing menu name and price which are in between 300-600

select menu_name, selling_price 
from menu
where selling_price between 300 and 600;




--Showing employees id and f_name where the name ended by 'in'

select employee_id, f_name
from employee 
where f_name like '%in';




--Showing employees according to their salary in descending order

select employee_id, f_name, salary
from employee
order by salary desc;




--Showing menu name, base and selling price ordered by base and selling price

select menu_name, base_price, selling_price
from menu 
order by base_price desc, selling_price desc;






-------------------------- Aggregate Functions ----------------------------------


--Showing amount of money to pay to the employees in a single month

select sum(salary) as total_money_to_pay
from employee;




--Showing the highest salary

select max(salary) as Highest_salary
from employee;




--Showing the lowest salary

select min(salary) as Lowest_salary
from employee;




--Showing total number of menu in the restarant

select count(menu.menu_id) as total_menu
from menu;




--Showing the average of the selling price of all menus

select avg(selling_price) as Average_price
from menu;




--Showing the distinct customer name whoo booked table

select count(distinct(booker_name)) as booker_name
from table_booking;




--Showing total table of same capacity 

select capacity, count(table_id) as total_table
from table_record
group by capacity;




--Showing total employee number of same designation and the number must be greater than 2 and salary less than 60000  

select designation, count(employee_id) as total_employee
from employee
where salary < 60000
group by designation
having count(employee_id) > 2;






-------------------------- Subquery and Set Operation ----------------------------------


--Showing table id, waiter id and capacity booked for 2 days after today

select table_id, waiter_id, capacity
from table_record
where table_id in ( select table_id
	            from table_booking
		    where trunc(booked_date) = trunc(sysdate + 2));




--Showing table id, waiter id and capacity booked for 2 days after today aor which capacity is 8

select table_id, waiter_id, capacity
from table_record
where capacity = 8
union all
select table_id, waiter_id, capacity
from table_record
where table_id in ( select table_id
	            from table_booking
		    where trunc(booked_date) = trunc(sysdate + 2));




--Showing table id, waiter id and capacity booked for 2 days after today or which capacity is 8 without duplication

select table_id, waiter_id, capacity
from table_record
where capacity = 8
union
select table_id, waiter_id, capacity
from table_record
where table_id in ( select table_id
	            from table_booking
		    where trunc(booked_date) = trunc(sysdate + 2));




--Showing table id, waiter id and capacity booked for 2 days after today and which capacity is 8

select table_id, waiter_id, capacity
from table_record
where capacity = 8
intersect
select table_id, waiter_id, capacity
from table_record
where table_id in ( select table_id
	            from table_booking
		    where trunc(booked_date) = trunc(sysdate + 2));




--Showing table id, waiter id and capacity which are not booked for 2 days after today

select table_id, waiter_id, capacity
from table_record
minus
select table_id, waiter_id, capacity
from table_record
where table_id in ( select table_id
	            from table_booking
		    where trunc(booked_date) = trunc(sysdate + 2));






-------------------------- Join Operation ----------------------------------


--Showing booker name, table id, capacity and booked date of tables booked for 2 days after today (Join)

select b.booker_name, table_id, r.capacity, b.booked_date
from table_booking b join table_record r
using (table_id)
where trunc(booked_date) = trunc(sysdate + 2);




--Showing booker name, table id, capacity and booked date of all booked tables (Natural Join)

select b.booker_name, table_id, r.capacity, b.booked_date
from table_booking b natural join table_record r;




--Showing record date, profit, menu id and sold quantity  after doing cross join between finance and total selling (cross join)

select f.record_date, s.menu_id, s.sold_quantity, f.profit
from finance f cross join total_selling s;




--Showing order id, table id, capacity, total cost after doing left outer join between finance and total selling (left outer join)

select o.order_id, t.table_id, t.capacity, o.total_cost
from order_record o left outer join table_record t
on o.table_id = t.table_id;




--Showing order id, table id, capacity, total cost after doing right outer join between finance and total selling (right outer join)

select o.order_id, t.table_id, t.capacity, o.total_cost
from order_record o right outer join table_record t
on o.table_id = t.table_id;




--Showing order id, table id, capacity, total cost after doing full outer join between finance and total selling (full outer join)

select o.order_id, t.table_id, t.capacity, o.total_cost
from order_record o full outer join table_record t
on o.table_id = t.table_id;




--Showing chef id, name, salary using only employee table and self join (self join)

select employee_id, e1.f_name, e2.salary
from employee e1 join employee e2
using (employee_id)
where e2.designation = 'Chef';






-------------------------- PL/SQL ----------------------------------

set serveroutput on;




--Showing highest salary (Simple Block)

declare 
	highest_salary employee.salary%type;
begin
	select max(salary) into highest_salary from employee;
	dbms_output.put_line('The highest salary is : ' || highest_salary);
end;
/




--Showing origin of menu (loop using Cursor)

declare 
	cursor origin_taker is 
		select menu_name, origin from menu;
	row_holder origin_taker%rowtype;
begin
	open origin_taker;
	loop
		fetch origin_taker into row_holder;
		exit when origin_taker%notfound;
		dbms_output.put_line('Menu Name: ' || row_holder.menu_name || ' and Origin: ' || row_holder.origin);
	end loop;
	close origin_taker;
end;
/




--Showing origin of menu (while loop using Cursor)

declare 
	cursor origin_taker is 
		select menu_name, origin from menu;
	row_holder origin_taker%rowtype;
begin
	open origin_taker;
	while origin_taker%rowcount < 6
	loop
		fetch origin_taker into row_holder;
		dbms_output.put_line('Menu Name: ' || row_holder.menu_name || ' and Origin: ' || row_holder.origin);
	end loop;
	close origin_taker;
end;
/




--Showing origin of menu (for loop using Cursor)

declare 
	cursor origin_taker is 
		select menu_name, origin from menu;
begin
	for loop_counter in origin_taker
	loop
		dbms_output.put_line('Menu Name: ' || loop_counter.menu_name || ' and Origin: ' || loop_counter.origin);
	end loop;
end;
/




--Showing average of salary after incremented by a percentage using function

create or replace function average_salary(increment number) return number is
	test_average number;
begin
	select avg(salary + salary * increment) into test_average from employee;
	return (test_average);
end;
/

begin
	dbms_output.put_line('Avaerage Salary after increment: ' || average_salary(5));
end;
/




--Showing average of salary after incremented by a percentage using function

create or replace function test_avg return number is
	test_average number;
begin
	select avg(e.salary) into test_average from employee e; 

	return test_average;
end;
/


create or replace function test_min return integer is
	test_min integer;
begin
	select min(e.salary)into test_min from employee e;  
	return test_min;
end;
/



create or replace function test_max return integer is
	test_max integer;
begin
	select max(e.salary)into test_max from employee e;  
	return test_max;
end;
/



begin
	dbms_output.put_line('Avaerage Salary after increment: ' || test_avg);
	dbms_output.put_line('Avaerage Salary after increment: ' || test_min);
	dbms_output.put_line('Avaerage Salary after increment: ' || test_max);
end;
/


select e.f_name, c.contact 
from employee e join employee_contact c 
using(employee_id);



