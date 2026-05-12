select * from customer;
select * from customer where first_name in ('lisa' , 'patrica');

select * from customer where customer_id=2 or customer_id>7;


select * from customer where first_name='lisa' and store_id=2;

show tables;
select * from customer;
select * from customer where first_name='lisa' or store_id=2 and store_id=7;

show tables