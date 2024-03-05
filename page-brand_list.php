<?php /* Template Name: page-brand_list */
get_header();
 $args = array(
               'taxonomy' => 'brand',
               'orderby' => 'name',
               'order'   => 'ASC'
           );

   $brands = get_categories($args);
// print_r($brands );
?>
<div class="category-list-main">
    <div class="container">
        <h1 class="category-list-section-title text-left">
            All Brands
        </h1>
        <div class="row category-list-wrapper">

            <?php
            foreach($brands  as $brand) {
            ?>
                <div class="col-12 col-sm-6 col-md-4 col-lg-4">
                    <div class="list-item">
                        <h3>
                            <a href="<?php echo get_category_link( $brand->term_id ) ?>">
           <?php echo $brand->name; ?>
      </a>
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