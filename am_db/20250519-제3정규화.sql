USE normal;

-- 제3정규형

CREATE TABLE CUSTOMER (
    고객아이디 VARCHAR(20) PRIMARY KEY,
    등급 ENUM('gold', 'vip', 'silver')
);

CREATE TABLE CUSTOMER_LEVEL (
    등급 ENUM('gold', 'vip', 'silver') PRIMARY KEY,
    할인율 VARCHAR(10)
);

INSERT INTO CUSTOMER (고객아이디, 등급)
VALUES 
('apple', 'gold'),
('banana', 'vip'),
('carrot', 'gold'),
('orange', 'silver');

INSERT INTO CUSTOMER_LEVEL (등급, 할인율)
VALUES 
('gold', '10%'),
('vip', '20%'),
('silver', '5%');

