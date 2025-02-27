<?php
$host = 'localhost';
$dbname = 'finance';
$username = 'root';
$password = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Connection failed: " . $e->getMessage());
}

// CREATE account
if (isset($_POST['create_account'])) {
    $name = $_POST['account_name'];
    $balance = $_POST['balance'];
    $currency = $_POST['currency'];
    
    $sql = "INSERT INTO accounts (account_name, balance, currency) VALUES (?, ?, ?)";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([$name, $balance, $currency]);
    echo "Account created successfully!";
}

// CREATE transaction
if (isset($_POST['create_transaction'])) {
    $type = $_POST['transaction_type'];
    $category = $_POST['transaction_category'];
    $from = $_POST['account_from'];
    $to = $_POST['account_to'];
    $amount = $_POST['amount'];
    $text = $_POST['text'];
    
    $sql = "INSERT INTO transactions (transaction_type, transaction_category, account_from, account_to, amount, text, transaction_date) 
            VALUES (?, ?, ?, ?, ?, ?, NOW())";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([$type, $category, $from, $to, $amount, $text]);
    echo "Transaction created successfully!";
}

// Load accounts for dropdown
if (isset($_GET['action']) && $_GET['action'] == 'load_accounts') {
    $sql = "SELECT * FROM accounts";
    $stmt = $pdo->query($sql);
    echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
}

// Load transactions
if (isset($_GET['action']) && $_GET['action'] == 'load_transactions') {
    $sql = "SELECT * FROM transactions";
    $stmt = $pdo->query($sql);
    echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
}
?>
