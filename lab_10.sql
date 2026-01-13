use infs_zawackit;
show tables;

#zadanie 1

use infs_zawackit;

create table order_logi (
ORDER_NUMBER varchar(255),
CHANGE_TIME datetime default current_timestamp,
NEW_STATUS_NAME varchar(234)
);

drop table order_logi;


DELIMITER //
CREATE TRIGGER order_record AFTER UPDATE
ON `ORDER` 
FOR EACH ROW
BEGIN
    insert into order_logi(ORDER_NUMBER, CHANGE_TIME, NEW_STATUS_NAME)
    VALUES (NEW.ORDER_NUMBER, now(), NEW.ORDER_STATUS);
END //
DELIMITER ;

DROP trigger order_record;

select * from `ORDER`;

UPDATE `ORDER`
SET ORDER_STATUS = 5
WHERE EMPLOYEE_ID = 7;

select * from `ORDER`;
select * from `order_logi`;

select * from ORDER_STATUS;

#####################
# rozwiazanie zad 1
#################################
DELIMITER //
CREATE TRIGGER status_after_update_2 AFTER UPDATE
ON `ORDER` 
FOR EACH ROW
BEGIN
    DECLARE statusname varchar(100);
    select STATUS_NAME into statusname from ORDER_STATUS
    where STATUS_ID = old.ORDER_STATUS;
    insert into status_change values (old.ORDER_ID, now(), statusname);
END //
DELIMITER ;





