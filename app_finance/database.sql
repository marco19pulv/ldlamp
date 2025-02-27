CREATE DATABASE finance;
USE finance;

-- ACCOUNTS
-- Name: Ingresso,Bancoposta,Postepay,Evolution,Libretto,Uscita,...
CREATE TABLE accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    account_name VARCHAR(32) NOT NULL,
    balance DECIMAL(8,2) NOT NULL DEFAULT 0.00,
    currency VARCHAR(16) NOT NULL DEFAULT 'EURO',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- TRANSACTIONS
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
    transaction_date DATE,
    FOREIGN KEY (account_from) REFERENCES accounts(account_id) ON DELETE CASCADE,
    FOREIGN KEY (account_to) REFERENCES accounts(account_id) ON DELETE CASCADE
);