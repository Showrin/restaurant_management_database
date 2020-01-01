set serveroutput on;





--Trigger for checking whether one is chef or not

create or replace trigger chef_checking 
before insert or update on cooking
for each row 
declare
	test_designation employee.designation%type;
begin 
	select designation into test_designation from employee where employee_id = :new.chef_id;
	if test_designation != 'Chef' then
		raise_application_error(-20000, 'He/she is not a chef');
	end if;
end;
/





--Trigger for checking whether one is waiter or not

create or replace trigger waiter_checking 
before insert or update on table_record
for each row 
declare
	test_designation employee.designation%type;
begin 
	select designation into test_designation from employee where employee_id = :new.waiter_id;
	if test_designation != 'Waiter' then
		raise_application_error(-20000, 'He/she is not a waiter');
	end if;
end;
/





--Trigger for inserting finance table via oreder_record table

create or replace trigger financial_update 
after insert or update on order_record
for each row
declare
	test_ordering_date order_record.ordering_date%type;
	test_total_cost order_record.total_cost%type;
begin
	select record_date into test_ordering_date from finance where record_date = :new.ordering_date;
--exception for 1st selection
exception
	when no_data_found then
		insert into finance values(:new.ordering_date, 5000, :new.total_cost, 0);
end;
/





--Trigger for updating total_selling, order_record(total_cost), finace(income+profit) table via oredered_menu table

create or replace trigger total_selling_update 
after insert or update on ordered_menu
for each row
declare
	test_ordering_date order_record.ordering_date%type;
	test_base_price menu.base_price%type;
	test_selling_price menu.selling_price%type;
	test_profit menu.selling_price%type;
	test_menu_id menu.menu_id%type;
begin
	select ordering_date into test_ordering_date from order_record where order_id = :new.order_id;
	select base_price, selling_price into test_base_price, test_selling_price from menu where menu_id = :new.menu_id;
	select menu_id into test_menu_id from total_selling where menu_id = :new.menu_id;
	update total_selling set sold_quantity = (sold_quantity + :new.ordered_qty) where menu_id = :new.menu_id;
	update order_record set total_cost = total_cost + (test_selling_price * :new.ordered_qty) where order_id = :new.order_id;
	update finance set income = income + (test_selling_price * :new.ordered_qty) where record_date = test_ordering_date;
	test_profit := (test_selling_price - test_base_price) * :new.ordered_qty;
	update finance set profit = (profit + test_profit) where record_date = test_ordering_date;
--exception for 3rd selection
exception
	when no_data_found then
		insert into total_selling values(test_ordering_date, :new.menu_id, :new.ordered_qty);
		update order_record set total_cost = total_cost + (test_selling_price * :new.ordered_qty) where order_id = :new.order_id;
		update finance set income = income + (test_selling_price * :new.ordered_qty) where record_date = test_ordering_date;
		test_profit := (test_selling_price - test_base_price) * :new.ordered_qty;
		update finance set profit = (profit + test_profit) where record_date = test_ordering_date;
end;
/





--Trigger for checking table booking date

create or replace trigger check_booking 
before insert or update on table_booking
for each row
declare
	test_table_id table_record.table_id%type;
	test_booked_date table_booking.booked_date%type;
begin
	select table_id into test_table_id from table_booking where table_id = :new.table_id and booked_date = :new.booked_date;
	raise_application_error(-20001, 'This Table is already booked. Try other tables or other date');
--exception for 1st selection
exception
	when no_data_found then
		dbms_output.put_line('Your booking is confirmed. Thank You, Sir.');

end;
/





commit;


	
	
	