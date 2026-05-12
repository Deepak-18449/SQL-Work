
drop database sakila;
use sakila;

show tables;
select * from customer;

select first_name, customer_id, first_name from customer;

select * from payment;
select payment_id, amount from payment;

select customer_id, first_name, customer_id+10 from customer;  -- not case insensitive lan

select * from customer;

select * from customer where customer_id=7;

select * from customer where first_name='marion'