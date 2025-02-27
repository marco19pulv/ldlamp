// Handle account form submission via AJAX
document.getElementById('accountForm').addEventListener('submit', function (e) {
    e.preventDefault();

    let formData = new FormData(this);
    formData.append('create_account', true);

    fetch('crud.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.text())
    .then(data => {
        alert(data);
        loadAccounts(); // Reload accounts after creating a new one
    });
});

// Handle transaction form submission via AJAX
document.getElementById('transactionForm').addEventListener('submit', function (e) {
    e.preventDefault();

    let formData = new FormData(this);
    formData.append('create_transaction', true);

    fetch('crud.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.text())
    .then(data => {
        alert(data);
        loadTransactions(); // Reload transactions after creating a new one
    });
});

// Load accounts dynamically into the transaction form select options
function loadAccounts() {
    fetch('crud.php?action=load_accounts')
        .then(response => response.json())
        .then(data => {
            let accountFromSelect = document.getElementById('account_from');
            let accountToSelect = document.getElementById('account_to');

            accountFromSelect.innerHTML = '<option value="">Select Account</option>';
            accountToSelect.innerHTML = '<option value="">Select Account</option>';

            data.forEach(account => {
                let option = `<option value="${account.account_id}">${account.account_name}</option>`;
                accountFromSelect.innerHTML += option;
                accountToSelect.innerHTML += option;
            });
        });
}

// Load accounts and transactions initially
loadAccounts();
loadTransactions();

// Load transactions dynamically
function loadTransactions() {
    fetch('crud.php?action=load_transactions')
        .then(response => response.json())
        .then(data => {
            let transactionsTable = document.getElementById('transactionsTable');
            transactionsTable.innerHTML = `<tr><th>ID</th><th>Type</th><th>Category</th><th>Amount</th><th>Date</th></tr>`;

            data.forEach(transaction => {
                let row = `<tr><td>${transaction.transaction_id}</td><td>${transaction.transaction_type}</td><td>${transaction.transaction_category}</td><td>${transaction.amount}</td><td>${transaction.transaction_date}</td></tr>`;
                transactionsTable.innerHTML += row;
            });
        });
}
