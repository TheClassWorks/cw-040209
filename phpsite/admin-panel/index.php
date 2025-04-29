<?php

include "include/layout/header.php";

// var_dump(__DIR__);
$posts = $connection->query("SELECT * FROM posts ORDER BY id DESC LIMIT 3");
$comments = $connection->query("SELECT * FROM comments ORDER BY id DESC LIMIT 3");
// var_dump($posts->fetchAll());


// var_dump($_GET);

if (isset($_GET['action'])) {
  if ($_GET['action'] == "delete") {
    if (isset($_GET['post'])) {
      $deletedPost = $connection->prepare("DELETE FROM  posts WHERE id=:id");
      $deletedPost->execute(['id' => $_GET['post']]);
      header("Location:index.php");
    } else if (isset($_GET['comment'])) {
      # code...
    }
  } else if ($_GET['action'] == "approve") {
    if (isset($_GET['comment'])) {
      $approvedComment = $connection->prepare("UPDATE comments SET status=1 WHERE id=:id");
      $approvedComment->execute(['id' => $_GET['comment']]);
      header("Location:index.php");
    }
  }
}

// با کلید-مقدار foreach کاربرد حلقه
// $list = ['stu1' => 'ali', 'reza', 'mhmd'];
// foreach ($list as $key => $value) {
//   var_dump('kelid' . $key . 'مقدار' . $value);
// }
// var_dump($list);
?>
<div class="container-fluid">
  <div class="row">
    <!-- Sidebar Section -->
    <?php include "include/layout/sidebar.php" ?>
    <!-- Main Section -->
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="fs-3 fw-bold">داشبورد</h1>
      </div>

      <!-- Recently Posts -->
      <div class="mt-4">
        <h4 class="text-secondary fw-bold">مقالات اخیر</h4>
        <div class="table-responsive small">
          <table class="table table-hover align-middle">
            <thead>
              <tr>
                <th>id</th>
                <th>عنوان</th>
                <th>نویسنده</th>
                <th>عملیات</th>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($posts as $post): ?>
                <tr>
                  <th><?= $post['id'] ?></th>
                  <td><?= $post['title'] ?></td>
                  <td><?= $post['author'] ?></td>
                  <td>
                    <a href="#" class="btn btn-sm btn-outline-dark">ویرایش</a>
                    <a href="index.php?action=delete&post=<?= $post['id'] ?>" class="btn btn-sm btn-outline-danger">حذف</a>
                  </td>
                </tr>
              <?php endforeach ?>
            </tbody>
          </table>
        </div>
      </div>

      <!-- Recently Comments -->
      <div class="mt-4">
        <h4 class="text-secondary fw-bold">کامنت های اخیر</h4>
        <div class="table-responsive small">
          <table class="table table-hover align-middle">
            <thead>
              <tr>
                <th>id</th>
                <th>نام</th>
                <th>متن کامنت</th>
                <th>عملیات</th>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($comments as $comment): ?>
                <tr>
                  <th><?= $comment['id'] ?></th>
                  <td><?= $comment['name'] ?></td>
                  <td><?= $comment['comment'] ?></td>
                  <td>
                    <?php if ($comment['status'] == 1): ?>
                      <a href="#" class="btn btn-sm btn-outline-dark disabled">تایید شده</a>
                    <?php else: ?>
                      <a href="index.php?action=approve&comment=<?= $comment['id'] ?>" class="btn btn-sm btn-outline-warning">در انتظار تأیید</a>
                    <?php endif ?>
                    <a href="index.php?action=delete&comment=<?= $comment['id'] ?>" class="btn btn-sm btn-outline-danger">حذف</a>
                  </td>
                </tr>
              <?php endforeach ?>
            </tbody>
          </table>
        </div>
      </div>

      <!-- Categories -->
      <div class="mt-4">
        <h4 class="text-secondary fw-bold">دسته بندی</h4>
        <div class="table-responsive small">
          <table class="table table-hover align-middle">
            <thead>
              <tr>
                <th>id</th>
                <th>عنوان</th>
                <th>عملیات</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th>1</th>
                <td>برنامه نویسی</td>
                <td>
                  <a href="#" class="btn btn-sm btn-outline-dark">ویرایش</a>
                  <a href="#" class="btn btn-sm btn-outline-danger">حذف</a>
                </td>
              </tr>
              <tr>
                <th>2</th>
                <td>شبکه</td>
                <td>
                  <a href="#" class="btn btn-sm btn-outline-dark">ویرایش</a>
                  <a href="#" class="btn btn-sm btn-outline-danger">حذف</a>
                </td>
              </tr>
              <tr>
                <th>3</th>
                <td>متفرقه</td>
                <td>
                  <a href="#" class="btn btn-sm btn-outline-dark">ویرایش</a>
                  <a href="#" class="btn btn-sm btn-outline-danger">حذف</a>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </main>
  </div>
</div>
<?php include "include/layout/footer.php" ?>