show databases;
use infs_zawackit;
show tables;

#zadanie 1
select e.EMPLOYEE_NAME, e.FIRST_NAME, e.LAST_NAME, e.pensja
, dense_rank() over(order by e.pensja desc) as ranking
FROM EMPLOYEE e;

#zadanie 2
select e.EMPLOYEE_NAME, e.FIRST_NAME, e.LAST_NAME, e.pensja
, sum(e.pensja) over() as pensja_globalna
FROM EMPLOYEE e;

#zadanie 3
select e.LAST_NAME, p.PRODUCT_NAME, o.ORDER_NUMBER
,sum(op.AMOUNT * op.SELL_PRICE) over 
(partition by o.EMPLOYEE_ID order by o.ORDER_ID) as suma_skumulowana
, sum(op.AMOUNT * op.SELL_PRICE) over
(partition by o.ORDER_ID) as suma_zamowienia
from `ORDER` o
join ORDER_POSITION op ON o.ORDER_ID=op.ORDER_ID
join EMPLOYEE e ON o.EMPLOYEE_ID=e.EMPLOYEE_NAME
join PRODUCT p ON p.PRODUCT_ID=op.PRODUCT_ID;



#zadanie 4
select count(op.PRODUCT_ID) over(partition by o.ORDER_DATE, p.PRODUCT_ID), o.ORDER_DATE , LAST_NAME, PRODUCT_NAME, SELL_PRICE FROM `ORDER_POSITION` op
JOIN `ORDER` o on o.ORDER_ID=op.ORDER_ID
JOIN EMPLOYEE e ON o.EMPLOYEE_ID=e.EMPLOYEE_NAME
join PRODUCT p ON p.PRODUCT_ID=op.PRODUCT_ID
order by o.ORDER_DATE, p.PRODUCT_NAME;

bez 6

1,2,3,4,5,7 do zrobienia




show databases;
use infs_zawackit;
show tables;

#zadanie 1
select e.EMPLOYEE_NAME, e.FIRST_NAME, e.LAST_NAME, e.pensja
, dense_rank() over(order by e.pensja desc) as ranking
FROM EMPLOYEE e;

#zadanie 2
select e.EMPLOYEE_NAME, e.FIRST_NAME, e.LAST_NAME, e.pensja
, sum(e.pensja) over() as pensja_globalna
FROM EMPLOYEE e;

#zadanie 3
select e.LAST_NAME, p.PRODUCT_NAME, o.ORDER_NUMBER
,sum(op.AMOUNT * op.SELL_PRICE) over 
(partition by o.EMPLOYEE_ID order by o.ORDER_ID) as suma_skumulowana
, sum(op.AMOUNT * op.SELL_PRICE) over
(partition by o.ORDER_ID) as suma_zamowienia
from `ORDER` o
join ORDER_POSITION op ON o.ORDER_ID=op.ORDER_ID
join EMPLOYEE e ON o.EMPLOYEE_ID=e.EMPLOYEE_NAME
join PRODUCT p ON p.PRODUCT_ID=op.PRODUCT_ID;



#zadanie 4
select count(op.PRODUCT_ID) over(partition by o.ORDER_DATE, p.PRODUCT_ID), o.ORDER_DATE , LAST_NAME, PRODUCT_NAME, SELL_PRICE FROM `ORDER_POSITION` op
JOIN `ORDER` o on o.ORDER_ID=op.ORDER_ID
JOIN EMPLOYEE e ON o.EMPLOYEE_ID=e.EMPLOYEE_NAME
join PRODUCT p ON p.PRODUCT_ID=op.PRODUCT_ID
order by o.ORDER_DATE, p.PRODUCT_NAME;

#57






