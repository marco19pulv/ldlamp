// Load accounts into dropdown and table
function loadAccounts() {
    fetch('crud.php?action=load_accounts')
        .then(response => response.json())
        .then(data => {
            let table = document.getElementById('accountsTable');
            let selectFrom = document.getElementById('account_from');
            let selectTo = document.getElementById('account_to');

            table.innerHTML = `<tr><th>ID</th><th>Name</th><th>Balance</th><th>Currency</th></tr>`;
            selectFrom.innerHTML = `<option value="">Select</option>`;
            selectTo.innerHTML = `<option value="">Select</option>`;

            data.forEach(account => {
                table.innerHTML += `<tr><td>${account.account_id}</td><td>${account.account_name}</td><td>${account.balance}</td><td>${account.currency}</td></tr>`;
                let option = `<option value="${account.account_id}">${account.account_name}</option>`;
                selectFrom.innerHTML += option;
                selectTo.innerHTML += option;
            });
        });
}

// Load transactions into table
function loadTransactions() {
    fetch('crud.php?action=load_transactions')
        .then(response => response.json())
        .then(data => {
            let table = document.getElementById('transactionsTable');
            table.innerHTML = `<tr><th>ID</th><th>Type</th><th>Category</th><th>Amount</th><th>Date</th></tr>`;
            data.forEach(transaction => {
                table.innerHTML += `<tr><td>${transaction.transaction_id}</td><td>${transaction.transaction_type}</td><td>${transaction.transaction_category}</td><td>${transaction.amount}</td><td>${transaction.transaction_date}</td></tr>`;
            });
        });
}

// Submit account data
document.getElementById('accountForm').addEventListener('submit', function (e) {
    e.preventDefault();
    let formData = new FormData(this);
    fetch('crud.php?action=create_account', { method: 'POST', body: formData })
        .then(response => response.text())
        .then(() => { loadAccounts(); this.reset(); });
});

// Submit transaction data
document.getElementById('transactionForm').addEventListener('submit', function (e) {
    e.preventDefault();
    let formData = new FormData(this);
    fetch('crud.php?action=create_transaction', { method: 'POST', body: formData })
        .then(response => response.text())
        .then(() => { loadTransactions(); this.reset(); });
});

// Load data on page load
loadAccounts();
loadTransactions();
