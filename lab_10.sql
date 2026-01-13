use infs_zawackit;
show tables;

#zadanie 1

use infs_zawackit;

create table order_logi (
ORDER_NUMBER varchar(255),
CHANGE_TIME datetime default current_timestamp,
NEW_STATUS_NAME varchar(234)
);





DELIMITER //
CREATE TRIGGER status_after_update_2 AFTER UPDATE
ON `ORDER` 
FOR EACH ROW
BEGIN
    DECLARE statusname varchar(100);
    select STATUS_NAME into statusname from ORDER_STATUS
    where STATUS_ID = old.ORDER_STATUS;
    insert into order_logi values (old.ORDER_ID, now(), statusname);
END //
DELIMITER ;

UPDATE `ORDER`
SET ORDER_STATUS = 5
WHERE EMPLOYEE_ID = 7;

select * from `ORDER`;
select * from `order_logi`;

select * from ORDER_STATUS;




