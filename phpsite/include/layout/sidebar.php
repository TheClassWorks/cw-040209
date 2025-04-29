<?php
$categories = $connection->query("SELECT * FROM categories");

$invalidName = '';
$invalidEmail = '';
$successfulSubscribeInsert = "";
if (isset($_POST['subscribe'])) {
  if (empty($_POST['name'])) {
    $invalidName = 'پر کردن نام الزامیست';
  }
  if (empty($_POST['email'])) {
    $invalidEmail = 'پر کردن ایمیل الزامیست';
  }

  if (!empty($_POST['name']) && !empty($_POST['email'])) {
    $name = $_POST['name'];
    $email = $_POST['email'];

    $stmt = $connection->prepare("INSERT INTO subscribers (name,email) VALUES (:name,:email)");
    $stmt->execute(['name' => $name, 'email' => $email]);
    $successfulSubscribeInsert = "درج با موفقیت انجام شد";
  }
}

?>
<div class="col-lg-4">
  <!-- Search Section -->
  <div class="card">
    <p class="fw-bold fs-6 card-header text-center">جستجو در سایت</p>
    <div class="card-body">
      <form action="search.php">
        <div class="input-group mb-3">
          <input type="text" class="form-control" placeholder="جستجو ..." name="search" />
          <button class="btn btn-secondary" type="submit" >
            <i class="bi bi-search"></i>
          </button>
        </div>
      </form>
    </div>
  </div>

  <!-- Categories Section -->
  <div class="card mt-4">
    <div class="fw-bold fs-6 card-header text-center">دسته بندی ها</div>
    <ul class="list-group list-group-flush p-0">
      <?php foreach ($categories as $category): ?>
        <li class="list-group-item">
          <a class="link-body-emphasis text-decoration-none" href="index.php?id=<?= $category['id'] ?>"> <?= $category['title'] ?></a>
        </li>
      <?php endforeach ?>
    </ul>
  </div>

  <!-- Subscribe Section -->
  <div class="card mt-4">
    <p class="fw-bold fs-6 card-header text-center">عضویت در خبرنامه</p>
    <div class="card-body">
      <form method="post" action="">
        <div class="mb-3">
          <label class="form-label">نام</label>
          <input type="text" class="form-control" name="name" />
          <p class="text-danger"> <?= $invalidName ?></p>
        </div>
        <div class="mb-3">
          <label class="form-label">رایانامه</label>
          <input type="email" class="form-control" name="email" />
          <p class="text-danger"> <?= $invalidEmail ?></p>
        </div>
        <div class="d-grid gap-2">
          <button type="submit" class="btn btn-secondary" name="subscribe">ارسال</button>
          <p class="text-success text-center"> <?= $successfulSubscribeInsert ?></p>
        </div>
      </form>
    </div>
  </div>

  <!-- About Section -->
  <div class="card mt-4">
    <p class="fw-bold fs-6 card-header text-center">درباره ما</p>
    <div class="card-body">
      <p class="text-justify">
        وظیفه اصلی یک مدرس در حوزه فناوری، کاهش زمان و انرژی لازم برای موفق شدن دانش پذیرانش است. برای رسیدن به این مهم باید از مشاور و مدرسی آموزش دید که یک متخصص
        واقعی با تجربه‌های بزرگ در شرکت‌های مطرح باشد و چالش‌های متفاوتی را در نرم افزارهای سطح بالا به صورت واقعی تجربه کرده باشد. افتخار می‌کنیم با مدرسینی همکاری
        داریم که متخصص و به شدت با تجربه هستند و در بزرگترین شرکت‌های نرم افزاری ایران تجربه کار جدی داشته اشته اند.
      </p>
    </div>
  </div>
</div>