<?php

$sliders = $connection->query("SELECT * FROM posts_slider");
// echo '<pre>';
// print_r($sliders->fetchAll());
?>

<section>
  <div id="carousel" class="carousel slide">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#carousel" data-bs-slide-to="0" class="active"></button>
      <button type="button" data-bs-target="#carousel" data-bs-slide-to="1"></button>
      <button type="button" data-bs-target="#carousel" data-bs-slide-to="2"></button>
    </div>
    <div class="carousel-inner rounded">
      <?php foreach ($sliders as $slider):
        $postId = $slider['post_id'];
        $posts = $connection->query("SELECT * FROM posts WHERE id= $postId");
        foreach ($posts as $post):
      ?>
          <div class="carousel-item overlay carousel-height <?= $slider['active'] ? 'active' : '' ?>">
            <img src="./assets/images/<?= $post['image'] ?>" class="d-block w-100" alt="post-image" />
            <div class="carousel-caption d-none d-md-block">
              <h5><?= $post['title'] ?></h5>
              <p><?= substr($post['body'], 0, 150) . "..."  ?></p>
            </div>
          </div>
        <?php endforeach ?>
      <?php endforeach ?>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carousel" data-bs-slide="prev">
      <span class="carousel-control-prev-icon"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carousel" data-bs-slide="next">
      <span class="carousel-control-next-icon"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>
</section>