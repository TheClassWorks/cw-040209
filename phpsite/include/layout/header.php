<?php
//CRUD
//read: SELECT نام فیلدها FROM  نام جداول WHERE شرط
$stmt = $connection->query("SELECT * FROM categories ");
$categories=$stmt->fetchAll();

// print_r($categories->fetchAll());

?>
<!DOCTYPE html>
<html dir="rtl" lang="fa">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>&#128142; compidan.ir &#128142;</title>

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" />
  <link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
    crossorigin="anonymous" />
  <link rel="stylesheet" href="./assets/css/style.css" />
</head>

<body>
  <div class="container py-3">
    <header class="d-flex flex-column flex-md-row align-items-center border-bottom mb-3">
      <!-- <a href="index.html" class="fs-5 fw-bold link-body-emphasis text-decoration-none"> مؤسسه آموزش فناوری <span class="text-danger">کامپیدان</span> </a> -->
      <a class="navbar-brand" href="index.php">
        <img src="assets/images/logo.png" style="width: 180px" />
      </a>
      <nav class="d-inline-flex mt-2 mt-md-0 me-md-auto">
        <!-- alternative syntax -->
        <?php foreach ($categories as $category): ?>
          <a class="me-3 py-2 link-body-emphasis text-decoration-none <?= (!empty($_GET['id']) && $category['id'] == $_GET['id']) ? 'fw-bold' : '' ?>" href="index.php?id=<?= $category['id'] ?>">
            <?= $category['title'] ?>
          </a>
          <?php endforeach ?>
        

      </nav>
    </header>


 