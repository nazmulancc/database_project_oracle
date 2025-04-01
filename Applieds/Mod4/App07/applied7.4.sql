DROP TABLE product PURGE;

DROP TABLE vendor PURGE;

DROP SEQUENCE prod_no_seq;

DROP SEQUENCE vendor_id_seq;

CREATE TABLE product (
    prod_no     NUMBER(4) NOT NULL,
    prod_name   VARCHAR2(50) NOT NULL,
    prod_price  NUMBER(6, 2) NOT NULL,
    prod_stock  NUMBER(3) NOT NULL,
    vendor_id   NUMBER(3) NOT NULL
);

COMMENT ON COLUMN product.prod_no IS
    'product number (unique for each product)';

COMMENT ON COLUMN product.prod_name IS
    'product name';

COMMENT ON COLUMN product.prod_price IS
    'product price';

COMMENT ON COLUMN product.prod_stock IS
    'product on hold (stock)';

COMMENT ON COLUMN product.vendor_id IS
    'vendor id (unique for each vendor)';

ALTER TABLE product ADD CONSTRAINT product_pk PRIMARY KEY ( prod_no );

CREATE TABLE vendor (
    vendor_id     NUMBER(3) NOT NULL,
    vendor_name   VARCHAR2(50) NOT NULL,
    vendor_phone  CHAR(10) NOT NULL
);

COMMENT ON COLUMN vendor.vendor_id IS
    'vendor id (unique for each vendor)';

COMMENT ON COLUMN vendor.vendor_name IS
    'vendor name';

COMMENT ON COLUMN vendor.vendor_phone IS
    'vendor phone';

ALTER TABLE vendor ADD CONSTRAINT vendor_pk PRIMARY KEY ( vendor_id );

ALTER TABLE vendor ADD CONSTRAINT vendor_un UNIQUE ( vendor_name );

ALTER TABLE product
    ADD CONSTRAINT vendor_product_fk FOREIGN KEY ( vendor_id )
        REFERENCES vendor ( vendor_id );

CREATE SEQUENCE prod_no_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE vendor_id_seq START WITH 1 INCREMENT BY 1;

-- Add Vendor 1 and the products they supply - transaction 1
 insert into vendor values (vendor_id_SEQ.nextval,
        'Western Digital', '1234567890');
 insert into product values (prod_no_SEQ.nextval,
        '2TB My Cloud Drive',195,5,vendor_id_SEQ.currval);
 insert into product values (prod_no_SEQ.nextval,
        '1TB Portable Hard Drive',76,4,vendor_id_SEQ.currval);
 insert into product values (prod_no_SEQ.nextval,
        'Live Media Player',119,2,vendor_id_SEQ.currval);
 
 Commit;


 -- Add Vendor 2 and the products they supply - transaction 2
 insert into vendor values (vendor_id_SEQ.nextval,'Seagate',
        '2468101234');
 insert into product values (prod_no_SEQ.nextval,
        '2TB Desktop Drive',94,12,vendor_id_SEQ.currval);
 insert into product values (prod_no_SEQ.nextval,
        '4TB 4 Bay NAS',76,4,vendor_id_SEQ.currval);
 insert into product values (prod_no_SEQ.nextval,
        '2TB Central Personal Storage' ,169,5, vendor_id_SEQ.currval);
 commit;


 SELECT * from product;