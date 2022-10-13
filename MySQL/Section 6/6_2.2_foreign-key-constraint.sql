# FOREIGN KEY constraint-

DROP TABLE sales;
CREATE TABLE sales(
	purchase_number INT NOT NULL AUTO_INCREMENT,
	date_of_purchase DATE NOT NULL,
	customer_id INT,
	item_code VARCHAR(10) NOT NULL,
PRIMARY KEY (purchase_number)
-- FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);

ALTER TABLE sales
ADD FOREIGN KEY(customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE;
ALTER TABLE sales 
DROP FOREIGN KEY Constraint_1;


####### 
DROP TABLE sales;

DROP TABLE customers;

DROP TABLE items;

DROP TABLE companies;