<?php
define("DNS", "mysql:host=localhost;dbname=phpsite;charset=utf8mb4");
define("DB_USER", "root");
define("DB_PASS", "");

$connection = new PDO(DNS, DB_USER, DB_PASS);
