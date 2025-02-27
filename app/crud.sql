-- ACCOUNTS
-- Create
INSERT INTO accounts (account_name, balance, currency) VALUES ('<name>', <balance>, '<currency>');
-- Read
SELECT * FROM accounts;  -- All accounts
SELECT * FROM accounts WHERE account_id = <id>;  -- Specific account
-- Update
UPDATE accounts SET balance = <new_balance>, currency = '<new_currency>' WHERE account_id = <id>;
-- Delete 
DELETE FROM accounts WHERE account_id = <id>;


-- TRANSACTIONS
-- Create
INSERT INTO transactions (transaction_type, transaction_category, account_from, account_to, amount, text, transaction_date) 
VALUES ('<type>', '<category>', <from>, <to>, <amount>, '<text>', NOW());
-- Read
SELECT * FROM transactions;  -- All transactions
SELECT * FROM transactions WHERE account_from = <id> OR account_to = <id>;  -- By account
SELECT * FROM transactions WHERE transaction_category = '<category>';  -- By category
-- Update
UPDATE transactions SET amount = <new_amount>, text = '<new_text>' WHERE transaction_id = <id>;
-- Delete 
DELETE FROM transactions WHERE transaction_id = <id>;
