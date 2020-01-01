drop table ordered_menu;
drop table order_record;
drop table table_booking;
drop table table_record;
drop table employee_contact;
drop table cooking;
drop table total_selling;
drop table finance;
drop table employee;
drop table menu;



create table employee 
(
	employee_id integer not null,
	f_name varchar(30),
	l_name varchar(30),
	designation varchar(30),
	dob date,
	address varchar(100),
	email varchar(30),
	salary integer default 5000,
	primary key (employee_id)
);


create table employee_contact
(
	employee_id integer not null,
	contact varchar(12),
	foreign key (employee_id) references employee(employee_id) on delete cascade
);



create table table_record
(
	table_id integer not null,
	waiter_id integer not null,
	capacity integer default 4,
	primary key (table_id),
	foreign key (waiter_id) references employee(employee_id) on delete cascade
);



create table menu
(
	menu_id integer not null,
	menu_name varchar(30),
	origin varchar(30),
	base_price integer,
	selling_price integer,
	per_day_qty integer default 50,
	discount integer default 0,
	primary key (menu_id)
);



create table cooking
(
	chef_id integer not null,
	menu_id integer not null,
	needed_hours number(3,2) default 0.1,
	foreign key (chef_id) references employee(employee_id) on delete cascade,
	foreign key (menu_id) references menu(menu_id) on delete cascade
);



create table finance
(
	record_date date not null,
	cash integer default 5000,
	income integer default 0,
	profit integer default 0,
	primary key (record_date)
);



create table total_selling
(
	record_date date not null,
	menu_id integer not null,
	sold_quantity integer default 0,
	foreign key (record_date) references finance(record_date) on delete cascade,
	foreign key (menu_id) references menu(menu_id) on delete cascade
);



create table table_booking
(
	booking_id integer not null,
	table_id integer not null,
	booker_name varchar(30),
	booker_email varchar(30),
	booker_contact varchar(30),
	booking_date date,
	booked_date date,
	primary key (booking_id),
	foreign key (table_id) references table_record(table_id) on delete cascade
);



create table order_record
(
	order_id integer not null,
	ordering_date date not null,
	table_id integer not null,
	total_cost integer default 0,
	primary key (order_id),
	foreign key (table_id) references table_record(table_id) on delete cascade
);



create table ordered_menu
(
	order_id integer not null,
	menu_id integer not null,
	ordered_qty integer default 0,
	foreign key (order_id) references order_record(order_id) on delete cascade,
	foreign key (menu_id) references menu(menu_id) on delete cascade
);



commit;
