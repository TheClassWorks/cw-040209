<?php
include "include/db.php";
include "include/layout/header.php";

// var_dump($_GET);
$searchWord = $_GET['search'];
// var_dump($searchWord);
$stmt = $connection->prepare("SELECT * FROM posts WHERE title LIKE :search");
$stmt->execute(['search' => "%$searchWord%"]);
$posts = $stmt->fetchAll();
// var_dump($stmt->rowCount());
// var_dump($posts);
// var_dump($stmt->fetchAll());
?>
<main>
  <!-- Content Section -->
  <section class="mt-4">
    <div class="row">
      <div class="col-lg-8">
        <!-- Posts Content -->
        <!-- <div class="row">
          <div class="col"> -->
        <div class="alert alert-secondary">پست های مرتبط با کلمه [ <?= $searchWord ?> ]</div>
        <?php if ($stmt->rowCount() == 0): ?>
          <div class="alert alert-danger">مقاله مورد نظر پیدا نشد !!!!</div>
          <!-- </div>
        </div> -->

        <?php else: ?>
          <div class="row g-3">
            <?php foreach ($posts as $post): ?>
              <div class="col-sm-6">
                <div class="card">
                  <img src="./assets/images/<?= $post['image'] ?>" class="card-img-top" alt="post-image" />
                  <div class="card-body">
                    <div class="d-flex justify-content-between">
                      <h5 class="card-title fw-bold"><?= $post['title'] ?></h5>
                      <div>
                        <?php $pdostmt = $connection->query("SELECT * FROM categories WHERE id= {$post['category_id']} ");
                        $cat = $pdostmt->fetch();
                        ?>
                        <span class="badge text-bg-secondary"><?= $cat['title'] ?></span>
                      </div>
                    </div>
                    <p class="card-text text-secondary pt-3">
                      <?= mb_substr($post['body'], 0, 150, "utf-8") ?>
                    </p>
                    <div class="d-flex justify-content-between align-items-center">
                      <a href="single.html" class="btn btn-sm btn-dark">مشاهده</a>

                      <p class="fs-7 mb-0">نویسنده : <?= $post['author'] ?></p>
                    </div>
                  </div>
                </div>
              </div>
            <?php endforeach ?>
          </div>
        <?php endif ?>
      </div>

      <!-- Sidebar Section -->
      <?php include "include/layout/sidebar.php" ?>
    </div>
  </section>
</main>

<!-- Footer Section -->
<?php include "include/layout/footer.php" ?>