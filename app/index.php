<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CRUD Operations</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Accounts and Transactions</h1>

    <!-- Accounts Section -->
    <div id="accounts">
        <h2>Accounts</h2>
        <form id="accountForm" method="POST">
            <input type="text" id="account_name" name="account_name" placeholder="Account Name" required>
            <input type="number" id="balance" name="balance" placeholder="Balance" required>
            <input type="text" id="currency" name="currency" placeholder="Currency" required>
            <button type="submit" name="create_account">Create Account</button>
        </form>
        <h3>Account List</h3>
        <table id="accountsTable">
            <!-- Account rows will be inserted here by PHP -->
        </table>
    </div>

    <!-- Transactions Section -->
    <div id="transactions">
        <h2>Transactions</h2>
        <form id="transactionForm" method="POST">
            <input type="text" id="transaction_type" name="transaction_type" placeholder="Transaction Type" required>
            <input type="text" id="transaction_category" name="transaction_category" placeholder="Transaction Category" required>
            <input type="number" id="amount" name="amount" placeholder="Amount" required>
            <select name="account_from" id="account_from" required>
                <!-- Account options will be dynamically populated -->
            </select>
            <select name="account_to" id="account_to" required>
                <!-- Account options will be dynamically populated -->
            </select>
            <textarea name="text" placeholder="Transaction Text"></textarea>
            <button type="submit" name="create_transaction">Create Transaction</button>
        </form>
        <h3>Transaction List</h3>
        <table id="transactionsTable">
            <!-- Transaction rows will be inserted here by PHP -->
        </table>
    </div>

    <script src="script.js"></script>
</body>
</html>
