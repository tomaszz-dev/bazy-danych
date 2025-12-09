show databases;
use infs_zawackit;
use company_2025;
show tables;
CREATE TABLE CATEGORY AS
SELECT * FROM company_2025.CATEGORY;

#zad 1

SELECT * FROM CLIENT c
inner join `ORDER` o on c.CLIENT_ID=o.CLIENT_ID;

select count(CLIENT_ID) from CLIENT;
select count(distinct CLIENT_ID) from `ORDER`;

#pkt1
SELECT * FROM CLIENT c
left join `ORDER` o on c.CLIENT_ID=o.CLIENT_ID
WHERE o.CLIENT_ID is Null;
#sposob 2
SELECT CLIENT_ID, FULL_NAME from CLIENT 
where CLIENT_ID not in
(select CLIENT_ID from `ORDER`);

#pk2
SELECT * FROM INVENTORY inv
right join UNIT_OF_MEASUREMENT uom on inv.UNIT_ID=uom.UNIT_ID
WHERE inv.UNIT_ID is Null;

#pkt3
SELECT * from PRODUCT;
select * from ORDER_POSITION;

SELECT p.PRODUCT_ID, abs(avg(SELL_PRICE - PURCHASE_PRICE)) as srednia_roznica
FROM PRODUCT p
INNER JOIN ORDER_POSITION op ON op.PRODUCT_ID = p.PRODUCT_ID
group by p.PRODUCT_ID
ORDER BY srednia_roznica desc;


#ZAD 2
SELECT DISTINCT d.DEPARTMENT_NAME FROM DEPARTMENT d
left join EMPLOYEE e on d.DEPARTMENT_ID=e.DEPARTMENT_ID;

select * from `ORDER_POSITION`;

#pkt2


SELECT
SUM(op.AMOUNT * op.SELL_PRICE)
FROM DEPARTMENT d
inner join EMPLOYEE e on d.DEPARTMENT_ID=e.DEPARTMENT_ID
inner join `ORDER` o on e.EMPLOYEE_NAME=o.EMPLOYEE_ID
inner join ORDER_POSITION op on o.ORDER_ID=op.ORDER_ID
group by d.DEPARTMENT_ID;

#pkt 3

SELECT
SUM(op.AMOUNT * op.SELL_PRICE)
FROM DEPARTMENT d
inner join EMPLOYEE e on d.DEPARTMENT_ID=e.DEPARTMENT_ID
inner join `ORDER` o on e.EMPLOYEE_NAME=o.EMPLOYEE_ID
inner join ORDER_POSITION op on o.ORDER_ID=op.ORDER_ID
inner join ORDER_STATUS os on os.STATUS_ID=OP.STATUS_ID
group by d.DEPARTMENT_ID;

#ZADANIE 3

SELECT concat(e.FIRST_NAME, ' ' ,e.LAST_NAME) as employee,
group_concat(c.FULL_NAME)
FROM EMPLOYEE e
inner join `ORDER` o on e.EMPLOYEE_NAME=o.EMPLOYEE_ID
inner join CLIENT c on o.CLIENT_ID=c.CLIENT_ID
group by 1;

#PKT 1

SELECT concat(PRODUCT_NAME,' ','(', DESCRIPTION, ')') FROM PRODUCT
group by 1;

#pkt 2
select * from PRODUCT;
SELECT concat_ws(',', PRODUCT_ID, CATEGORY_ID, PRODUCT_NAME, PURCHASE_PRICE, DESCRIPTION)
FROM PRODUCT;

#pkt 3
select * from DEPARTMENT;

SELECT concat(e.FIRST_NAME,' ', e.LAST_NAME) as employee,
group_concat(d.DEPARTMENT_NAME)
FROM EMPLOYEE e
inner join DEPARTMENT d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
group by 1;

#pkt 4
SELECT concat(CATEGORY_NAME),
group_concat(p.PRODUCT_NAME)
FROM CATEGORY c
inner join PRODUCT p ON c.CATEGORY_ID=p.CATEGORY_ID
group by 1;

#zadanie 4 #pkt 1
SELECT ORDER_ID,
IF(ORDER_STATUS IN (3, 4, 7, 10), 'zakończone', 'inny') AS Status_Opis
FROM `ORDER`;

select * from `ORDER`;


#pkt 2
SELECT p.PRODUCT_NAME,
CASE
WHEN i.AMOUNT = 0 THEN 'brak'
WHEN i.AMOUNT > 0 AND i.AMOUNT < 10 THEN 'mala ilosc'
WHEN i.AMOUNT >= 10 AND i.AMOUNT <= 30 THEN 'srednia ilosc'
WHEN i.AMOUNT > 30 THEN 'duza ilosc'
ELSE 'nieznana'
END AS dostepnosc
FROM PRODUCT p
JOIN INVENTORY i ON p.PRODUCT_ID = i.PRODUCT_ID;

#pkt 3
SELECT
FULL_NAME,
IFNULL(TAX_IDENTIFIER, 'indywidualny')
FROM CLIENT;

#ZADANIE 5
#PKT 1
select * from CLIENT_ADDRESS;

SELECT CITY, SUBSTR(POSTAL_CODE,1,2) FROM CLIENT_ADDRESS;


#PKT 2

SELECT DISTINCT CITY, substr(POSTAL_CODE, 4,2) AS 'kod dla miasta' FROM CLIENT_ADDRESS;


#pkt 3 
