<?php
get_header();
?>
<div id="demo" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
        <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
        <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
    </div>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="<?php echo get_theme_file_uri('assets/images/121212.jpg'); ?>" class="d-block" style="width:100% height:400px" />
        </div>
        <div class="carousel-item">
            <img src="<?php echo get_theme_file_uri('assets/images/download.jpg'); ?>" class="d-block" style="width:100% height:400px" />
        </div>
        <div class="carousel-item">
            <img src="<?php echo get_theme_file_uri('assets/images/4545.jpg'); ?>" class="d-block" style="width:100% height:400px" />
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
    </button>
</div>


<?php
$args = array(
    'post_type' => 'product',
    'post_status' => 'publish',
    'posts_per_page' => 4,
);
$the_query = new WP_Query($args);
if ($the_query->have_posts()) {
?>
    <div class="container">
        <div class="row">
            <h1>Latest Product</h1>
            <div class="row d-flex justify-content-between">


                <?php

                while ($the_query->have_posts()) {
                    $the_query->the_post();

                ?>
                    <div class="card" style="width: 18rem;">

                        <a href="<?php echo get_permalink() ?>" class="font-weight-bold text-decoration-none text-body">
                            <img src="<?php echo  get_the_post_thumbnail_url(get_the_ID()) ?>" class="card-img-top">
                            <div class="card-body">
                                <h5 class="card-title"><?php the_title(); ?></h5>
                                <p class="card-text">price: <?php $price = get_post_meta($post->ID, 'ecommerce_price');
                                                            print_r($price[0]);
                                                            ?></p>
                        </a>
                    </div>
            </div>

        <?php

                }

        ?>
        </div>
    </div>

<?php
}
get_footer();
?>