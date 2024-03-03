/* Valeria Quesada Benavides*/
/*These code was executed in Snowflake worksheets.*/
CREATE OR REPLACE TABLE Sales(
    transaction_id INT NOT NULL UNIQUE,
    quantity_of_items_sold INT NOT NULL,
    unit_price INT NOT NULL,
    discount FLOAT NOT NULL,
    product_per_store_id INT NOT NULL,
    CONSTRAINT fk_sales_product_per_store_id
    FOREIGN KEY (product_per_store_id)
    REFERENCES ProductPerStore (product_per_store_id)
);