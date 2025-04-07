/*****PLEASE ENTER YOUR DETAILS BELOW*****/
-- ITO4132
--T5-ma-mods.sql

-- Student ID: 34273654
-- Student Name: Nazmul Hasan
-- last modified date: 07.04.2025

/* Comments for your marker:




*/


/* (a) */

CREATE TABLE parts_sale (
    sale_no        NUMBER(5) NOT NULL,
    sale_date      DATE NOT NULL,
    total_paid     NUMBER(8,2) NOT NULL,
    cust_no        NUMBER(6) NOT NULL
);

COMMENT ON COLUMN parts_sale.sale_no IS
    'Auto-generated sale number starting from 100';

COMMENT ON COLUMN parts_sale.sale_date IS
    'Date of parts sale';

COMMENT ON COLUMN parts_sale.total_paid IS
    'Total amount paid for sale (up to 99999.99)';

COMMENT ON COLUMN parts_sale.cust_no IS
    'Customer who made the purchase';

CREATE TABLE parts_sale_item (
    sale_no        NUMBER(5) NOT NULL,
    part_code      CHAR(6) NOT NULL,
    unit_price     NUMBER(6,2) NOT NULL,
    quantity       NUMBER(2) NOT NULL
);

COMMENT ON COLUMN parts_sale_item.sale_no IS
    'Sale identifier';

COMMENT ON COLUMN parts_sale_item.part_code IS
    'Part sold';

COMMENT ON COLUMN parts_sale_item.unit_price IS
    'Price charged per unit (up to 9999.99)';

COMMENT ON COLUMN parts_sale_item.quantity IS
    'Quantity purchased (up to 99)';

-- Add primary and foreign keys
ALTER TABLE parts_sale ADD CONSTRAINT parts_sale_pk PRIMARY KEY (sale_no);
ALTER TABLE parts_sale ADD CONSTRAINT parts_sale_customer_fk FOREIGN KEY (cust_no) REFERENCES customer (cust_no);

ALTER TABLE parts_sale_item ADD CONSTRAINT parts_sale_item_pk PRIMARY KEY (sale_no, part_code);
ALTER TABLE parts_sale_item ADD CONSTRAINT parts_sale_item_sale_fk FOREIGN KEY (sale_no) REFERENCES parts_sale (sale_no);
ALTER TABLE parts_sale_item ADD CONSTRAINT parts_sale_item_part_fk FOREIGN KEY (part_code) REFERENCES part (part_code);

-- Create sequence for sale numbers starting at 100
CREATE SEQUENCE parts_sale_seq START WITH 100 INCREMENT BY 1;


/* (b )*/

-- Add new columns to part table
ALTER TABLE part ADD (
    part_reorder_level NUMBER(3),
    part_restock_date DATE
);

COMMENT ON COLUMN part.part_reorder_level IS
    'Minimum stock level before reordering is required';

COMMENT ON COLUMN part.part_restock_date IS
    'Date when part was last restocked';

-- Set initial values for existing parts
UPDATE part
SET 
    part_reorder_level = CEIL(part_stock / 2),
    part_restock_date = TO_DATE('01/01/2024', 'dd/Mon/yyyy')
WHERE part_reorder_level IS NULL;

-- Add constraint to ensure new parts have reorder level
ALTER TABLE part MODIFY part_reorder_level NOT NULL;
ALTER TABLE part MODIFY part_restock_date NOT NULL;
