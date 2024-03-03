/*Add the information in the new tables*/
INSERT INTO Client(client_id, client_name, client_last_name, email)
SELECT DISTINCT client_id, client_name, client_lastname, email
FROM TRANSACTIONS;

INSERT INTO Address (address_id, street, city, state, zip_code)
SELECT DISTINCT
    address_id, street, city, state, zip_code
FROM Transactions;

INSERT INTO Store(store_id, store_name, address_id, location)
SELECT DISTINCT
    store_id, store_name, address_id, location
FROM Transactions;

INSERT INTO Product(product_id, product_name, category, brand)
SELECT DISTINCT
    product_id, product_name, category, brand
FROM Transactions;

INSERT INTO ProductPerStore(store_id, product_id)
SELECT DISTINCT
    store_id, product_id
FROM Transactions;

INSERT INTO Sales(transaction_id, quantity_of_items_sold, unit_price, discount, product_per_store_id)
SELECT DISTINCT
    t.transaction_id, t.quantity_of_items_sold, t.unit_price, t.discount, pps.product_per_store_id
FROM Transactions t, ProductPerStore pps
WHERE t.store_id = pps.store_id AND t.product_id = pps.product_id;