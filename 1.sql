CREATE DATABASE IF NOT EXISTS LEARNFIRST;
SHOW DATABASES;
USE LEARNFIRST;

CREATE TABLE Worker(
  WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  FIRST_NAME VARCHAR(25),
  LAST_NAME VARCHAR(25),
  SALARY INT(15),
  JOINING_DATE DATETIME,
  DEPARTMENT VARCHAR(25)
);

INSERT INTO Worker (WORKER_ID , FIRST_NAME, LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT) VALUES 
(001,'Monika', 'Arora',100000,'14-02-20 09.00.00','HR'),
(002,'Niharika','Verma', 80000 , '14-06-11 09.00.00','Admin'),
(003,'Vishal','Singhal','3000000','14-02-20 09.00.00','HR'),
(004,'Amit','Jain','5000000','14-02-20 09.00.00','Admin'),
(005,'Utkarsh','Kaushik','7000000','14-06-20 09.00.00','Admin'),
(006,'Keshav','Baghla','400000','14-04-20 09.00.00','Account'),
(007,'Ashwin','Singhal','70000','22-05-20 05.00.00','HR'),
(008,'Iyer','Idli','500000','02-07-20 09.00.00','Account');

Select * from worker;
Select First_NAME,SALARY FROM WORKER;
SELECT NOW();
SELECT 55+34;
SELECT ucase('heheheh');
Select * from worker where SALARY > 4000000 ;
Select * from worker where SALARY between 80000 and 500000 ;
SELECT * FROM WORKER WHERE DEPARTMENT IN ('HR' , 'ADMIN');
SELECT * FROM WORKER WHERE FIRST_NAME LIKE 'A%';
SELECT * FROM WORKER WHERE FIRST_NAME LIKE '__H___';
SELECT * FROM WORKER WHERE FIRST_NAME LIKE '%A_';
SELECT * FROM WORKER ORDER BY SALARY ASC;
SELECT DISTINCT DEPARTMENT FROM WORKER;
SELECT DEPARTMENT, COUNT(DEPARTMENT) FROM WORKER GROUP BY DEPARTMENT;  
SELECT DEPARTMENT, AVG(SALARY) FROM WORKER GROUP BY DEPARTMENT;  
SELECT COUNT(DEPARTMENT), DEPARTMENT FROM worker GROUP BY DEPARTMENT HAVING COUNT(DEPARTMENT)>2;


CREATE TABLE BONUS(
    WORKER_REF_ID INT,
    BONUS_AMOUNT INT(10),
    BONUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID) 
         REFERENCES Worker(Worker_id)
         ON DELETE CASCADE
);

INSERT INTO BONUS 
   (WORKER_REF_ID , BONUS_AMOUNT , BONUS_DATE) VALUES
       (001,5000,'16-02-20'),
       (002,4000,'16-06-11'),
       (003, 6000,'16-02-20'),
       (001,4500,'16-02-20'),
       (002,3500,'16-06-11');
       
CREATE TABLE TITLE(
      WORKER_REF_ID INT,
      WORKER_TITLE VARCHAR(25),
      AFFECTED_FROM DATETIME,
      Foreign key (WORKER_REF_ID)
        REFERENCES WORKER(WORKER_ID) 
         ON DELETE CASCADE
);

INSERT INTO TITLE ( WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
          (001,'Manager','2016-02-20 00:00:00'),
          (002,'Executive','2016-06-20 00:00:00'),
          (008,'Executive','2016-06-11 00:00:00'),
          (005,'Manager','2016-06-20 00:00:00'),
          (004,'Asst. Manager','2016-02-11 00:00:00'),
          (007,'Executive','2016-06-11 00:00:00'),
          (006,'Lead','2016-06-20 00:00:00'),
          (003,'Lead','2016-06-11 00:00:00');
		
		
-- UPDATE CUSTOMER SET ADDRESS="Mumbai",GENDER ="M" WHERE ID=121;-- 
-- SET SQL_SAFE_UPDATES=0;
-- UPDATE CUSTOMER SET PINCODE =110000
-- UPDATE CUSTOMER SET PINCODE =110000+1
-- Delete from customer where id=1;
-- DELETE FROM CUSTOMER; (FULL TABLE DELETE)


-- CREATE TABLE ACCCOUNT(
--    NAME varchar(25) unique,
--    acc_balance int not null default 0,
--    constraint acccheck CHECK(acc_balance>1000)
-- );

-- Alter table account add new_col_name datatype ;
-- Alter table account modify col_name col_datatype;
-- Alter table account change column old-column-name new-column-name new-column-datatype;
-- Alter table account drop column col-name;
-- Alter table account rename to new-table-name;

-- REPLACE INTO ACCOUNT(ID,CITY) VALUES (1252,'CITY');
 -- REPLACE INTO ACCOUNT SET ID='123', City='abc'

-- JOINS
SELECT W.* , O.* FROM WORKER AS W INNER JOIN BONUS AS O;

Create table customer(
    cust_id int primary key not null auto_increment,
    cust_name varchar(25),
    cust_city varchar(10),
    cust_phone int
);

Insert into customer values (1,'tanuj','agra',84929240),(2,'akash','mathura',8439434),(3,'khemu','kota',2342543),(4,'adu','kota',245252);
    
select * from customer;


create table ordertable(
    order_id int ,
    order_name varchar(34),
    FOREIGN KEY (order_id)
      References customer(cust_id)
	  ON DELETE CASCADE
);

insert into ordertable values(2,'sofa'),(4,'mixer');

select * from ordertable;

-- JOINS
SELECT c.*, o.* FROM customer AS c INNER JOIN ordertable AS o ON c.cust_id = o.order_id;
SELECT c.*, o.* FROM customer AS c left JOIN ordertable AS o ON c.cust_id = o.order_id;
SELECT c.*, o.* FROM customer AS c right JOIN ordertable AS o ON c.cust_id = o.order_id;

SELECT c.*, o.* FROM customer AS c left JOIN ordertable AS o ON c.cust_id = o.order_id
Union
SELECT c.*, o.* FROM customer AS c right JOIN ordertable AS o ON c.cust_id = o.order_id;

SELECT c.*, o.* FROM customer AS c CROSS JOIN ordertable AS o ON c.cust_id = o.order_id;

-- SELECT e1.id,e2.id,e2.name from employee as e1 inner join employee as e2 on e1.id = e2.id

-- UNION
SELECT cust_id, cust_name, cust_city, cust_phone FROM CUSTOMER
UNION
SELECT order_id, order_name, NULL, NULL FROM ordertable;

