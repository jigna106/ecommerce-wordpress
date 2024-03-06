<?php /* Template Name: page-product_category*/
get_header();
$args = array(
    'taxonomy' => 'product_cat',
    'orderby' => 'name',
    'order'   => 'ASC'
);

$catgories = get_categories($args);
// print_r($brands );
?>
<div class="category-list-main">
    <div class="container">
        <h1 class="category-list-section-title text-left">
            All Product Categories
        </h1>
        <div class="row category-list-wrapper">

            <?php
            foreach ($catgories  as $catgoriy) {
            ?>
                <div class="col-12 col-sm-6 col-md-4 col-lg-4">
                    <div class="list-item">
                        <h3>
                            <a href="<?php echo get_category_link($catgoriy->term_id) ?>">
                                <?php echo $catgoriy->name; ?>
                                 </a></h3>
                    </div>
                </div>

            <?php
            }
            ?>
        </div>
    </div>
</div>
<?php
get_footer();
?>