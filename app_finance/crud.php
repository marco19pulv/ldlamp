<?php
$host = 'localhost';
$dbname = 'finance';
$username = 'root';
$password = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Connection error: " . $e->getMessage());
}

// Load accounts
if ($_GET['action'] == 'load_accounts') {
    $stmt = $pdo->query("SELECT * FROM accounts");
    echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
}

// Create account
if ($_GET['action'] == 'create_account') {
    $stmt = $pdo->prepare("INSERT INTO accounts (account_name, balance) VALUES (?, ?)");
    $stmt->execute([$_POST['account_name'], $_POST['balance']]);
}

// Load transactions
if ($_GET['action'] == 'load_transactions') {
    $stmt = $pdo->query("SELECT * FROM transactions");
    echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
}

// Create transaction
if ($_GET['action'] == 'create_transaction') {
    $stmt = $pdo->prepare("INSERT INTO transactions (transaction_type, transaction_category, account_from, account_to, amount, text, transaction_date) 
                           VALUES (?, ?, ?, ?, ?, ?, ?)");
    $stmt->execute([
        $_POST['transaction_type'], 
        $_POST['transaction_category'], 
        $_POST['account_from'], 
        $_POST['account_to'], 
        $_POST['amount'], 
        $_POST['text'], 
        $_POST['transaction_date'] ?: NULL
    ]);
}
?>
