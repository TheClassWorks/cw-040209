<?php
include "include/db.php";
include "include/layout/header.php";

if (isset($_GET['post_id'])) {
  $stmt = $connection->prepare("SELECT * FROM posts WHERE id=:id"); //named parameter
  $stmt->execute(['id' => $_GET['post_id']]);
  $post = $stmt->fetch();
}

$stmt = $connection->prepare("SELECT * FROM comments WHERE post_id=:postid AND status=1"); //named parameter
$stmt->execute(['postid' => $_GET['post_id']]);
$commentCounts = $stmt->rowCount();
$comments = $stmt->fetchAll();


$invalidCommentName = "";
$invalidCommentbody = "";
$acceptComment = "";
if (isset($_POST['insertComment'])) {
  if (empty($_POST['name'])) {
    $invalidCommentName = "درج نام اجباری است";
  }
  if (empty($_POST['comment'])) {
    $invalidCommentbody = "درج نظر اجباری است";
  }
  if (!empty($_POST['name']) && !empty($_POST['comment'])) {
    $stmt = $connection->prepare("INSERT INTO comments (name,comment,post_id,status) 
                                  VALUES (:name,:comment,:postid,:status)");
    $stmt->execute([
      'name' => $_POST['name'],
      'comment' => $_POST['comment'],
      'postid' => $_GET['post_id'],
      'status' => 0
    ]);
    $acceptComment = "پس از بررسی در سایت منتشر می شود";
  }
}
?>
<main>
  <!-- Content -->
  <section class="mt-4">
    <div class="row">
      <!-- Posts & Comments Content -->
      <div class="col-lg-8">
        <div class="row justify-content-center">
          <!-- Post Section -->
          <?php if (empty($post)): ?>
            <div class="col">
              <div class="alert alert-danger">پست مورد نظر یافت نشد</div>
            </div>
          <?php else: ?>
            <div class="col">
              <div class="card">
                <img src="./assets/images/<?= $post['image'] ?>" class="card-img-top" alt="post-image" />
                <div class="card-body">
                  <div class="d-flex justify-content-between">
                    <h5 class="card-title fw-bold"><?= $post['title'] ?></h5>
                    <div>
                      <span class="badge text-bg-secondary"><?= $post['category_id'] ?></span>
                    </div>
                  </div>
                  <p class="card-text text-secondary text-justify pt-3">
                    <?= $post['body'] ?>
                  </p>
                  <div>
                    <p class="fs-6 mt-5 mb-0">نویسنده : <?= $post['author'] ?></p>
                  </div>
                </div>
              </div>
            </div>
          <?php endif ?>
          <hr class="mt-4" />

          <!-- Comment Section -->
          <div class="col">
            <!-- Comment Form -->
            <div class="card">
              <div class="card-body">
                <p class="fw-bold fs-5">ارسال کامنت</p>

                <form action="" method="POST">
                  <div class="mb-3">
                    <label class="form-label">نام</label>
                    <input type="text" class="form-control" name="name" />
                    <p class="text-danger"> <?= $invalidCommentName ?></p>
                  </div>
                  <div class="mb-3">
                    <label class="form-label">متن کامنت</label>
                    <textarea class="form-control" rows="3" name="comment"></textarea>
                    <p class="text-danger"> <?= $invalidCommentbody ?></p>

                  </div>
                  <button type="submit" class="btn btn-dark" name="insertComment">ارسال</button>
                  <p class="text-success"> <?= $acceptComment ?></p>
                </form>
              </div>
            </div>

            <hr class="mt-4" />
            <!-- Comment Content -->
            <p class="fw-bold fs-6">تعداد کامنت : <?= $commentCounts ?></p>
            <?php foreach ($comments as $comment): ?>
              <div class="card bg-light-subtle mb-3">
                <div class="card-body">
                  <div class="d-flex align-items-center">
                    <img src="./assets/images/profile.png" width="45" height="45" alt="user-profle" />

                    <h5 class="card-title me-2 mb-0"><?= $comment['name'] ?></h5>
                  </div>

                  <p class="card-text pt-3 pr-3"><?= $comment['comment'] ?></p>
                </div>
              </div>
            <?php endforeach ?>

          </div>
        </div>
      </div>

      <!-- Sidebar Section -->
      <?php include "include/layout/sidebar.php" ?>
    </div>
  </section>
</main>

<!-- Footer -->
<?php include "include/layout/footer.php" ?>