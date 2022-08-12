CREATE USER ecomadmin WITH PASSWORD 'ecomdev@123';

CREATE USER ecomtestadmin WITH PASSWORD 'ecomtest@123';

ALTER ROLE ecomtestadmin WITH CREATEDB;

CREATE DATABASE ecom_development;

CREATE DATABASE ecom_test;

GRANT ALL PRIVILEGES ON DATABASE ecom_development TO ecomadmin;

GRANT ALL PRIVILEGES ON DATABASE ecom_test TO ecomtestadmin;

ALTER DATABASE ecom_test OWNER TO ecomtestadmin;