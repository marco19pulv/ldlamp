<!----------------------------- PHP SCRIPT ----------------------------->
<?php
$db = new PDO('mysql:host=localhost', 'root', null);

function getOSInformation()
 {
     if (false == function_exists("shell_exec") || false == is_readable("/etc/os-release")) {
         return null;
     }

      $os         = shell_exec('cat /etc/os-release');
     $listIds    = preg_match_all('/.*=/', $os, $matchListIds);
     $listIds    = $matchListIds[0];

      $listVal    = preg_match_all('/=.*/', $os, $matchListVal);
     $listVal    = $matchListVal[0];

      array_walk($listIds, function(&$v, $k){
         $v = strtolower(str_replace('=', '', $v));
     });

      array_walk($listVal, function(&$v, $k){
         $v = preg_replace('/=|"/', '', $v);
     });

      return array_combine($listIds, $listVal);
 }
$osInfo = getOSInformation();
?>



<!----------------------------- HTML CODE ----------------------------->
<!doctype html>

<html lang=en>

<head>
    <meta charset=utf-8>
    <title>Light Docker LAMP</title>
    <link rel="stylesheet" href="styles.css">
</head>

<body>
    <?php include 'index_body.html'; ?>
</body>

</html>