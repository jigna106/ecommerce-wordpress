<?php
get_header();
$args = array(
  'taxonomy' => 'color',
  'orderby' => 'name',
  'order' => 'ASC'
);

$Colors = get_categories($args);

$args = array(
  'taxonomy' => 'product_cat',
  'orderby' => 'name',
  'order' => 'ASC'
);

$catgories = get_categories($args);

$args = array(
  'taxonomy' => 'brand',
  'orderby' => 'name',
  'order' => 'ASC'
);

$brands = get_categories($args);
// print_r($Colors );
?>
<div class="container main-content">
  <div class="row flex-row-reverse">
    <div class="filterShow" style="display: none; ">
      <div class="filter-close-wrap"> <input type="button" class="filter-close" value="X" /></div>
      <h3>Colors</h3>
      <?php
      foreach ($Colors as $Color) {
        ?>
        <div class="col-12 col-sm-6 col-md-4 col-lg-4">
          <div class="list-item">
            <label>
              <?php echo $Color->name; ?>

              <input type="checkbox" id="color" value="<?php echo $Color->name; ?>" name="color"
                data-id="<?php echo $Color->name; ?>" /></a>
            </label>
          </div>
        </div>
        <?php
      }
      ?>
      <h3>Catgories</h3>
      <?php
      foreach ($catgories as $catgorie) {
        ?>
        <div class="col-12 col-sm-6 col-md-4 col-lg-4">
          <div class="list-item">
            <label>
              <?php echo $catgorie->name; ?>
              <input type="checkbox" id="catgorie" value="<?php echo $catgorie->name; ?>" name="catgorie"
                data-id="<?php echo $catgorie->name; ?>" /></a>
            </label>
          </div>
        </div>

        <?php
      }
      ?>
      <h3>Brands</h3>
      <?php
      foreach ($brands as $brand) {
        ?>
        <div class="col-12 col-sm-6 col-md-4 col-lg-4">
          <div class="list-item">
            <label>
              <?php echo $brand->name; ?>

              <input type="checkbox" id="brand" value="<?php echo $brand->name; ?>" name="brand"
                data-id="<?php echo $brand->name; ?>" /></a>
            </label>
          </div>
        </div>

        <?php
      }
      ?>

      <input type="submit" value="Apply Filters" name="apply" id="apply" class="btn btn-secondary">
    </div>
  </div>
  <div class="row flex-row-reverse">
    <input type="submit" value=" All Filters" name="filter" id="filter" class="btn btn-dark filter-btn" />
    <div class="filter-list ">
      <div class="colors d-none">
        <strong>Colors :</strong>
        <div class="colors-filter d-flex">
        </div>
      </div>
      <div class="catgories d-none">
        <Strong>Catgories:</Strong>
        <div class="catgories-filter d-flex">
          <div class="filter-item"></div>
        </div>
      </div>
      <div class="brand d-none">
        <strong>Brands:</strong>
        <div class="brands-filter d-flex">
          <div class="filter-item"></div>
        </div>
      </div>
    </div>
  </div>
  <div class="row ajax_response">
    <?php
    if (have_posts()) {
      while (have_posts()) {
        the_post();
        ?>
        <div class="col-3 pt-3 ">
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
          <a href="<?php echo get_permalink() ?>" class="font-weight-bold text-decoration-none text-body">
            <div class="col-4">
              <?php echo the_post_thumbnail('product-thumb') ?>
            </div>
            <div class="col-12 pt-3 text-uppercase text-lg">
              <?php the_title(); ?>
            </div>
            <div>
              Price:<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                class="bi bi-currency-rupee" viewBox="0 0 16 16">
                <path
                  d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" />
              </svg>
              <?php $price = get_post_meta($post->ID, 'ecommerce_price');
              echo number_format($price[0], ((int) $price[0] == $price[0] ? 0 : 2), '.', ',');
              ?>

            </div>
          </a>
        </div>

        <?php

      }
    }
    ?>
    <?php
    global $wp_query;
    $totalpagenumber = $wp_query->max_num_pages;
    // echo $totalpagenumber;
    ?>
    <div class="pagination">
      <div class="page-size">
        <label> Select size</label>
        <select name="select-size" class="select-size" value="select size">
          <option value="1"> 1 </option>
          <option value="2"> 2 </option>
          <option value="3"> 3 </option>
          <option value="4"> 4 </option>
          <option value="12" selected="selected">12 </option>
        </select>
      </div>
      <div class="as-page-number">
        <input type="button" name="forward" value=">>" class="forward" />
        <?php
        for ($i = 1; $i <= ($totalpagenumber); $i++) {
          ?>
          <input type="button" name="page-number" value="<?php echo $i ?>" class="page-number" />

          <?php
        }
        ?>
        <input type="button" name="backward" value="<<" class="backward" />
      </div>
    </div>
  </div>


</div>


<?php
get_footer();
?>