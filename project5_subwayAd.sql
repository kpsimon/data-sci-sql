 -- SELECT *
 -- FROM orders 
 -- LIMIT 10;
 
 --q1 How recent is this data?
 SELECT DISTINCT order_date
 FROM orders
 ORDER BY order_date ASC
 LIMIT 10;
 
 --q2/3/4 Instead of selecting all the columns using *, write a query that selects only the special_instructions column. Can you edit the query so that we are only returning the special instructions that are not empty? Let’s go even further and sort the instructions in alphabetical order (A-Z)
 SELECT special_instructions
 FROM orders
 WHERE special_instructions IS NOT NULL
 	AND special_instructions != 'blank'
 ORDER BY special_instructions ASC
 LIMIT 20;

 
 --q5 Let’s search for special instructions that have the word   ‘sauce’. Are there any funny or interesting ones?
 SELECT special_instructions
 FROM orders
 WHERE special_instructions LIKE '%sauce%'
 LIMIT 20;
 
 --q6 Let’s search for special instructions that have the word ‘door’. Any funny or interesting ones?
 SELECT special_instructions
 FROM orders
 WHERE special_instructions LIKE '%door%'
 LIMIT 20;
 
 --q7 Let’s search for special instructions that have the word ‘box’. Any funny or interesting ones?
 SELECT special_instructions
 FROM orders
 WHERE special_instructions LIKE '%box%'
 LIMIT 20;
 
 --q8 Instead of just returning the special instructions, also return their order ids.
 SELECT DISTINCT special_instructions AS 'Notes', id AS '#'
 FROM orders
 WHERE special_instructions IS NOT NULL
 	AND special_instructions != 'blank'
 ORDER BY special_instructions ASC
 LIMIT 20;
 
