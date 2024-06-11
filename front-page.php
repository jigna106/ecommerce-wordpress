<?php
get_header();

?>
<div id="carouselExampleControlsNoTouching" class="carousel slide" data-bs-touch="false" data-bs-interval="false">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="<?php echo get_theme_file_uri('assets/images/121212.jpg'); ?>" class="d-block" style="width:100% height 400px" />

        </div>
        <div class="carousel-item">
            <img src="<?php echo get_theme_file_uri('assets/images/download.jpg'); ?>" class="d-block" style="width:100% height 400px" />
        </div>
        <div class="carousel-item">
            <img src="<?php echo get_theme_file_uri('assets/images/4545.jpg'); ?>" class="d-block" style="width:100% height 400px" />
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>
<?php
$args = array(
    'post_type' => 'product',
    'post_status' => 'publish',
    'posts_per_page' => 3,
);
$the_query = new WP_Query($args);
// echo "<pre>";
// print_r($the_query);
// echo "</pre>";
if ($the_query->have_posts()) {
?>
    <div class="container">
        <div class="row">
            <div class="LatestProduct">
                <h1>Latest Product</h1>
            </div>
            <div class="row d-flex justify-content-between products-items">
                <?php
                while ($the_query->have_posts()) {
                    $the_query->the_post();
                ?>
                    <div class="col-md-4">
                        <a href="<?php echo get_permalink() ?>" class="font-weight-bold text-decoration-none text-body">
                            <?php
                            $catgories = wp_get_post_terms($post->ID, "product_cat");
                            //print_r($catgories)
                            ?>
                            <div class="row category-list-wrapper">
                                <?php
                                foreach ($catgories as $catgoriy) {
                                ?>
                                    <span>
                                        <?php echo $catgoriy->name; ?>
                                    </span>
                                <?php
                                }
                                ?>
                            </div>
                            <div class="col-4">
                                <?php echo the_post_thumbnail('product-thumb') ?>
                            </div>
                            <div class="col-md-12 text-uppercase text-lg">
                                <?php the_title(); ?>
                            </div>
                            <div class="col-md-12 text-uppercase text-lg">

                                <?php
                                $product_id = $post->ID;
                                $price = apply_filters("get_product_discountprice", get_post_meta($post->ID, 'ecommerce_price', true), $product_id);
                                if ($price['sale_price'] != $price['regular_price']) {
                                    echo '<del><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16"><path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" /></svg>' . number_format($price['regular_price'], ((int) $price['regular_price'] == $price['regular_price'] ? 0 : 2), '.', ',') . '</del><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16"><path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" /></svg>' . number_format($price['sale_price'], ((int) $price['sale_price'] == $price['sale_price'] ? 0 : 2), '.', ',');
                                } else {
                                ?>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16">
                                        <path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" />
                                    </svg>
                                <?php
                                    echo number_format($price['regular_price'], ((int) $price['regular_price'] == $price['regular_price'] ? 0 : 2), '.', ',');
                                }
                                ?>
                            </div>
                        </a>
                    </div>
                <?php
                }

                ?>
            </div>
        </div>
    </div>
    <div>
        <?php

        $catgories = get_terms(array(
            'taxonomy' => 'product_cat',

        ));
        // echo "<pre>";
        // print_r($catgories);
        foreach ($catgories as $catgory) {

            echo do_shortcode("[as_saleproduct categories=$catgory->name]");
        }

        ?>
    </div>

<?php
}
get_footer();
?>