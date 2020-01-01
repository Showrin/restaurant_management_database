--Inserting data to employee table

delete from employee;

insert into employee values (101, 'Showrin', 'Barua', 'Owner', '16-JUN-1997', '21, Jamal Khan, Chittagong', 'showrinece15@gmail.com', 60000);
insert into employee values (102, 'Mithun', 'Das', 'Manager', '01-JAN-1990', '32, A.k. Khan Road, Chittagong', 'mithun@gmail.com', 45000);
insert into employee values (103, 'Mamun', 'Sarkar', 'Accountant', '20-JUL-1993', 'Agrabad, Chittagong', 'mamun@gmail.com', 40000);
insert into employee values (104, 'Afrin', 'Jahan', 'Chef', '06-FEB-1990', '1/2, CDA, Chittagong', 'afrin@gmail.com', 30000);
insert into employee values (105, 'Farhan', 'Hoque', 'Chef', '23-NOV-1998', 'Potenga, Chittagong', 'farhan@gmail.com', 30000);
insert into employee values (106, 'Darry', 'Allen', 'Chef', '29-JAN-1992', '21, CDA, Chittagong', 'darry@gmail.com', 30000);
insert into employee values (107, 'Amin', 'Mia', 'Waiter', '16-SEP-1993', '01, Jamal Khan, Chittagong', 'amin@gmail.com', 15000);
insert into employee values (108, 'Moin', 'Hoque', 'Waiter', '10-DEC-1994', '33, Pathantuli, Chittagong', 'moin@gmail.com', 15000);
insert into employee values (109, 'Mehedi', 'Islam', 'Waiter', '30-MAR-1995', '11, Jamal Khan, Chittagong', 'mehedi@gmail.com', 15000);
insert into employee values (110, 'Sagor', 'Islam', 'Waiter', '20-APR-1998', '55, Port Colony, Chittagong', 'sagor@gmail.com', 15000);




--Inserting data to employee_contact table

delete from employee_contact;

insert into employee_contact values (101, '01521328875');
insert into employee_contact values (101, '0181771600');
insert into employee_contact values (102, '01816616999');
insert into employee_contact values (102, '01917718070');
insert into employee_contact values (103, '01521328875');
insert into employee_contact values (103, '0181771600');
insert into employee_contact values (104, '01816616999');
insert into employee_contact values (104, '01917718070');
insert into employee_contact values (105, '01521328875');
insert into employee_contact values (105, '0181771600');
insert into employee_contact values (106, '01816616999');
insert into employee_contact values (106, '01917718070');
insert into employee_contact values (107, '01521328875');
insert into employee_contact values (107, '0181771600');
insert into employee_contact values (108, '01816616999');
insert into employee_contact values (108, '01917718070');
insert into employee_contact values (109, '01521328875');
insert into employee_contact values (109, '0181771600');
insert into employee_contact values (110, '01816616999');
insert into employee_contact values (110, '01917718070');




--Inserting data to menu table

delete from menu;

insert into menu values (401, 'Mexican Pizza', 'Mexico', 220, 550, 50, 5);
insert into menu values (402, 'Chicken Shwarma', 'India', 60, 150, 50, 0);
insert into menu values (403, 'Oven Baked Pasta', 'Italy', 130, 350, 50, 0);
insert into menu values (404, 'Chaomin', 'Japan', 50, 120, 50, 0);
insert into menu values (405, 'Thai Soup', 'India', 50, 120, 50, 0);
insert into menu values (406, 'T Steak', 'Mexico', 200, 550, 50, 0);
insert into menu values (407, 'Hydrabadi Biriyani', 'India', 100, 220, 50, 0);
insert into menu values (408, 'Chichen Chese Burger', 'America', 60, 160, 50, 0);
insert into menu values (409, 'Chicken Subsandwitch', 'America', 60, 160, 50, 0);
insert into menu values (410, 'Cryspi Chicken Fry', 'Mexico', 220, 550, 50, 0);




--Inserting data to cooking table

delete from cooking;

insert into cooking values (104, 401, 0.5);
insert into cooking values (104, 402, 0.1);
insert into cooking values (104, 403, 0.5);
insert into cooking values (105, 404, 0.1);
insert into cooking values (105, 405, 0.1);
insert into cooking values (105, 406, 0.5);
insert into cooking values (105, 407, 0.5);
insert into cooking values (106, 408, 0.2);
insert into cooking values (106, 409, 0.5);
insert into cooking values (106, 410, 0.3);




--Inserting data to table_record table

delete from table_record;

insert into table_record values (701, 107, 8);
insert into table_record values (702, 108, 8);
insert into table_record values (703, 109, 4);
insert into table_record values (704, 109, 4);
insert into table_record values (705, 110, 4);
insert into table_record values (706, 110, 4);




--Inserting data to order_record & ordered_menu table together

delete from order_record;
delete from ordered_menu;
delete from finance;
delete from total_selling;


insert into order_record values (1001, sysdate, 704, 0);
insert into ordered_menu values (1001, 401, 2);
insert into ordered_menu values (1001, 402, 1);
insert into ordered_menu values (1001, 403, 1);

insert into order_record values (1002, sysdate, 701, 0);
insert into ordered_menu values (1002, 404, 3);
insert into ordered_menu values (1002, 405, 2);
insert into ordered_menu values (1002, 406, 1);
insert into ordered_menu values (1002, 407, 2);

insert into order_record values (1003, sysdate, 702, 0);
insert into ordered_menu values (1003, 409, 3);
insert into ordered_menu values (1003, 410, 2);
insert into ordered_menu values (1003, 401, 4);
insert into ordered_menu values (1003, 403, 2);

insert into order_record values (1004, sysdate, 706, 0);
insert into ordered_menu values (1004, 404, 3);
insert into ordered_menu values (1004, 406, 1);




--Inserting data to table_booking table

delete from table_booking;

insert into table_booking values (2001, 703, 'Anis', 'anis@gmail.com', '01521328875', sysdate, sysdate+2);
insert into table_booking values (2002, 701, 'Anis', 'anis@gmail.com', '01521328875', sysdate, sysdate+2);
insert into table_booking values (2003, 703, 'Masud', 'masud@gmail.com', '01521328875', sysdate, sysdate+3);
insert into table_booking values (2004, 705, 'Saykat', 'saykat@gmail.com', '01521328875', sysdate, sysdate+3);
insert into table_booking values (2005, 706, 'Noyon', 'noyon@gmail.com', '01521328875', sysdate, sysdate+2);






commit;