/* Valeria Quesada Benavides*/
/*These code was executed in Snowflake worksheets.*/
CREATE OR REPLACE TABLE Client(
    client_id INT NOT NULL UNIQUE,
    client_name VARCHAR NOT NULL,
    client_last_name VARCHAR NOT NULL,
    email VARCHAR NOT NULL
);

CREATE OR REPLACE TABLE Address(
    address_id INT NOT NULL UNIQUE,
    zip_code INT NOT NULL,
    street VARCHAR NOT NULL,
    city VARCHAR NOT NULL,
    state VARCHAR NOT NULL
);

CREATE OR REPLACE TABLE Store(
    store_id INT NOT NULL UNIQUE,
    store_name VARCHAR NOT NULL,
    location VARCHAR NOT NULL,
    address_id INT NOT NULL,
    CONSTRAINT fk_store
    FOREIGN KEY (address_id)
    REFERENCES Address (address_id)
);

CREATE OR REPLACE TABLE Product(
    product_id INT NOT NULL UNIQUE,
    product_name VARCHAR NOT NULL,
    category VARCHAR NOT NULL,
    brand VARCHAR NOT NULL
);

CREATE OR REPLACE TABLE ProductPerStore(
    product_per_store_id INT AUTOINCREMENT START 1 INCREMENT 1 UNIQUE NOT NULL,
    store_id INT NOT NULL,
    product_id INT NOT NULL,
    CONSTRAINT fk_store
    FOREIGN KEY (store_id)
    REFERENCES Store (store_id),
    CONSTRAINT fk_product
    FOREIGN KEY (product_id)
    REFERENCES Product (product_id)
);
