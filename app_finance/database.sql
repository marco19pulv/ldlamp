-- Database: Personal Finance Management

CREATE DATABASE personal_finance;
USE personal_finance;

-- Accounts table (Ingresso,Bancoposta,Postepay,Evolution,Libretto,Uscita)
CREATE TABLE accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    account_name VARCHAR(32) NOT NULL,
    balance DECIMAL(8,2) NOT NULL DEFAULT 0.00,
    currency VARCHAR(16) NOT NULL DEFAULT EURO,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
);

-- Transactions table
-- Type: POS,Postagiro,Bonifico,Prelievo,Deposito,...
-- Category: Stipendio,Carburante,Affitto,...
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    transaction_type VARCHAR(32) NOT NULL,
    transaction_category VARCHAR(32) NOT NULL,
    account_from INT NOT NULL,
    account_to INT NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    text TEXT,
    transaction_date DATE DEFAULT DATE(NOW),
    FOREIGN KEY (account_from) REFERENCES accounts(account_id) ON DELETE CASCADE,
    FOREIGN KEY (account_to) REFERENCES accounts(account_id) ON DELETE CASCADE,
);

-- Accounts Table
-- 1. Create: 
INSERT INTO accounts (account_name, balance, currency) VALUES ('<name>', <balance>, '<currency>');
-- 2. Read: 
SELECT * FROM accounts;  -- All accounts
SELECT * FROM accounts WHERE account_id = <id>;  -- Specific account
-- 3. Update: 
UPDATE accounts SET balance = <new_balance>, currency = '<new_currency>' WHERE account_id = <id>;
-- 4. Delete: 
DELETE FROM accounts WHERE account_id = <id>;


-- Transactions Table
-- 1. Create: 
INSERT INTO transactions (transaction_type, transaction_category, account_from, account_to, amount, text, transaction_date) 
VALUES ('<type>', '<category>', <from>, <to>, <amount>, '<text>', NOW());
-- 2. Read: 
SELECT * FROM transactions;  -- All transactions
SELECT * FROM transactions WHERE account_from = <id> OR account_to = <id>;  -- By account
SELECT * FROM transactions WHERE transaction_category = '<category>';  -- By category
-- 3. Update: 
UPDATE transactions SET amount = <new_amount>, text = '<new_text>' WHERE transaction_id = <id>;
-- 4. Delete: 
DELETE FROM transactions WHERE transaction_id = <id>;
