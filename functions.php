<?php
function as_get_image_data_array($attechment_id)
{
  $sizes = get_intermediate_image_sizes();
  $sizes_data = array();
  foreach ($sizes as $size) {
    $src = wp_get_attachment_image_src($attechment_id, $size);
    if ($src) {
      $sizes_data[$size]['url'] = $src[0];
      $sizes_data[$size]['width'] = $src[1];
      $sizes_data[$size]['height'] = $src[2];
    }
  }
  return $sizes_data;
}


function create_custom_post_type()
{
  $products = array(
    'name' => 'Product',
    'label' => __('Product'),
    'supports' => array('title', 'editor', 'author', 'thumbnail', 'excerpt', 'comments', 'custom-fields'),
    'public' => true,
    'has_archive' => true,
    'menu_icon' => 'dashicons-products'
  );
  add_theme_support('custom-header');
  add_theme_support('automatic-feed-links');
  add_image_size('product-thumb', 300, 300, false);
  add_theme_support('post-thumbnails');

  register_post_type('product', $products);
}
add_action('init', 'create_custom_post_type');


function ecommerce_price_metabox()
{
  add_meta_box('test-meta-id', 'Product Price', 'product_price_display', 'product');
}
add_action('add_meta_boxes', 'ecommerce_price_metabox');
function product_price_display($post)
{

  $Pricevalue = get_post_meta($post->ID, 'ecommerce_price', true);
  $salepricevalue = get_post_meta($post->ID, 'ecommerce_sale_price', true);
  ?>
  <label for="new_meta"> Product price</label>
  <input type="text" id="price" name="price" value="<?php echo $Pricevalue ?>" /><br>
  <lable for="sale price">Sale price</lable>
  <input type="text" id="saleprice" name="saleprice" value="<?php echo $salepricevalue ?>" />
  <?php
}

function save_postdata($post_id)
{
  if (array_key_exists('price', $_POST)) {
    update_post_meta(
      $post_id,
      'ecommerce_price',
      $_POST['price']
    );
  }
}
add_action('save_post', 'save_postdata');
function save_saleprice($post_id)
{
  if (array_key_exists('saleprice', $_POST)) {
    update_post_meta(
      $post_id,
      'ecommerce_sale_price',
      $_POST['saleprice']
    );
  }
}
add_action('save_post', 'save_saleprice');
function add_product_taxonomy()
{
  $args = array(
    'label' => __('Brand'),
    'slug' => __('brand'),
    'hierarchical' => true,
    'public' => true,
    'has_archive' => true,
    'publicly_queryable' => true,
    'show_ui' => true,
    'show_in_menu' => true,
    'show_in_nav_menus' => true,

  );
  register_taxonomy('brand', 'product', $args);
  $args = array(
    'label' => __('Category'),
    'slug' => __('product_cat'),
    'hierarchical' => true,
    'has_archive' => true,
    'public' => true,
    'publicly_queryable' => true,
    'show_ui' => true,
    'show_in_menu' => true,
    'show_in_nav_menus' => true,

  );
  register_taxonomy('product_cat', 'product', $args);

  $args = array(
    'label' => __('Color'),
    'slug' => __('color'),
    'hierarchical' => true,
    'has_archive' => true,
    'public' => true,
    'publicly_queryable' => true,
    'show_ui' => true,
    'show_in_menu' => true,
    'show_in_nav_menus' => true,

  );
  register_taxonomy('color', 'product', $args);
}
add_action('init', 'add_product_taxonomy');

add_action('brand_add_form_fields', 'add_term_image', 10, 2);
add_action('product_cat_add_form_fields', 'add_term_image', 10, 2);
add_action('Color_add_form_fields', 'add_term_image', 10, 2);

function add_term_image()
{
  ?>
  <div class="form-field term-group">
    <label for="">Upload and Image</label>
    <input type="text" name="txt_upload_image" id="txt_upload_image" value="" style="width: 77%">
    <input type="button" id="upload_image_btn" class="button" value="Upload an Image" />
  </div>
  <?php
}

add_action('brand_edit_form_fields', 'edit_image_upload', 10, 2);
add_action('product_cat_edit_form_fields', 'edit_image_upload', 10, 2);
add_action('Color_edit_form_fields', 'edit_image_upload', 10, 2);


function edit_image_upload($term, $taxonomy)
{
  $txt_upload_image = get_term_meta($term->term_id, 'term_image', true);
  ?>
  <div class="form-field term-group">
    <label for="">Upload and Image</label>
    <input type="text" name="txt_upload_image" id="txt_upload_image" value="<?php echo $txt_upload_image ?>"
    style="width: 77%">
    <input type="button" id="upload_image_btn" class="button" value="Upload an Image" />
  </div>
  <?php
}

add_action('created_brand', 'save_term_image', 10, 2);
add_action('created_product_cat', 'save_term_image', 10, 2);
add_action('created_Color', 'save_term_image', 10, 2);
function save_term_image($term_id, $tt_id)
{
  if (isset($_POST['txt_upload_image']) && '' !== $_POST['txt_upload_image']) {
    $group = ($_POST['txt_upload_image']);
    add_term_meta($term_id, 'term_image', $group, true);
  }
}
add_action('edited_brand', 'update_image_upload', 10, 2);
add_action('edited_product_cat', 'update_image_upload', 10, 2);
add_action('edited_Color', 'update_image_upload', 10, 2);
function update_image_upload($term_id, $tt_id)
{
  if (isset($_POST['txt_upload_image']) && '' !== $_POST['txt_upload_image']) {
    $group = ($_POST['txt_upload_image']);
    update_term_meta($term_id, 'term_image', $group);
  }
}

function wpdocs_theme_name_scripts()
{
  wp_enqueue_style('ecommerce-boostrap-icon-css', get_template_directory_uri() . '/assets/css/bootstrap-icons.css');
  wp_enqueue_style('ecommerce-style-css', get_template_directory_uri() . '/assets/css/style.css', rand(), true);
  wp_enqueue_style('ecommerce-boostrap-css', get_template_directory_uri() . '/assets/css/bootstrap.min.css', rand(), true);
  wp_enqueue_style('ecommerce-swiper-css', get_template_directory_uri() . '/assets/css/swiper.css', rand(), true);
  wp_enqueue_script('jquery');
  wp_enqueue_script('ecommerce-swiper-script', get_template_directory_uri() . '/assets/js/swiper-bundle.min.js');
  wp_enqueue_script('ecommerce-script', get_template_directory_uri() . '/assets/js/bootstrap.bundle.min.js', array(), rand(), true);
  wp_enqueue_script('ecommerce-main-script', get_template_directory_uri() . '/assets/js/main.js', array('jquery'), rand(), true);
  wp_localize_script('ecommerce-main-script', 'as_ecommerce_ajax_object', array('ajax_url' => admin_url('admin-ajax.php'), 'cart_itmes_data' => count(isset($_SESSION['productitems']) ? $_SESSION['productitems'] : array())));

}
add_action('wp_enqueue_scripts', 'wpdocs_theme_name_scripts');


add_action('wp_ajax_nopriv_as_get_product_filter_color', 'as_get_product_filter_color');
add_action('wp_ajax_as_get_product_filter_color', 'as_get_product_filter_color');

add_action('wp_ajax_nopriv_as_contactdata', 'as_contactdata');
add_action('wp_ajax_as_contactdata', 'as_contactdata');

function as_contactdata()
{
  print_r($_POST);

  $Contactdata = array(

    'post_title' => $_POST['data']['Firstname'] . " " . $_POST['data']['Lastname'],
    'post_content' => $_POST['data']['Firstname'] . " " . $_POST['data']['Lastname'],
    'post_type' => 'contact'
  );
  $id = wp_insert_post($Contactdata);
  print_r($id);


  update_post_meta(
    $id,
    'contact_data',
    $_POST
  );
}

function as_get_product_filter_color()
{
  $tax_query = array('relation' => 'AND');
  if (isset($_POST['colors'])) {
    array_push(
      $tax_query,
      array(
        'taxonomy' => 'Color',
        'field' => 'name',
        'terms' => $_POST['colors'],
      )
    );
  }

  if (isset($_POST['catgories'])) {
    array_push(
      $tax_query,
      array(
        'taxonomy' => 'product_cat',
        'field' => 'name',
        'terms' => $_POST['catgories'],
      )
    );
  }
  if (isset($_POST['brands'])) {
    array_push(
      $tax_query,
      array(
        'taxonomy' => 'brand',
        'field' => 'name',
        'terms' => $_POST['brands'],
      )
    );
  }
  $args = array(
    'post_type' => 'product',
    'tax_query' => $tax_query,
    'posts_per_page' => $_POST['page_size'],
    'paged' => $_POST['page']

  );

  // echo "<pre>";
  // print_r($args);
  // echo "</pre>";
  $color = new WP_Query($args);

  ?>
  <?php
  if ($color->have_posts()) {
    while ($color->have_posts()) {
      $color->the_post();
      global $post;
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
            <img src="<?php echo get_the_post_thumbnail_url(get_the_ID()) ?>" width="200px" height="200px">
          </div>
          <div class="col-12 pt-3 text-uppercase text-lg">
            <?php the_title(); ?>
          </div>
          <div>
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee"
              viewBox="0 0 16 16">
              <path
                d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" />
            </svg>
            <?php
            // print_r($post);
            $Pricevalue = get_post_meta($post->ID, 'ecommerce_price', true); ?>

            <?php
            echo number_format($Pricevalue, ((int) $Pricevalue == $Pricevalue ? 0 : 2), '.', ',');
            ?>
          </div>
        </a>
      </div>
      <?php
    }
  }
  ?>

  <div class="pagination">
    <div class="page-size">
      <label> Select Size</label>
      <select name="select-size" id="select-size" class="select-size" value="select size">
        <option value="1" <?php if (isset($_POST['page_size']) && $_POST['page_size'] == "1") {
          echo "selected='selected'";
        } ?>> 1 </option>
        <option value="2" <?php if (isset($_POST['page_size']) && $_POST['page_size'] == "2") {
          echo "selected='selected'";
        } ?>> 2 </option>
        <option value="3" <?php if (isset($_POST['page_size']) && $_POST['page_size'] == "3") {
          echo "selected='selected'";
        } ?>> 3 </option>
        <option value="4" <?php if (isset($_POST['page_size']) && $_POST['page_size'] == "4") {
          echo "selected='selected'";
        } ?>> 4 </option>
        <option value="12" <?php if (isset($_POST['page_size']) && $_POST['page_size'] == "12") {
          echo "selected='selected'";
        } ?>> 12 </option>

      </select>
    </div>
    <div class="as-page-number">
      <input type="hidden" class="page-number-hidden" value="<?php echo $_POST['page'] ?>" />

      <input type="button" name="backward" value="<<" class="backward" />
      <?php
      for ($i = 1; $i <= ($color->max_num_pages); $i++) {
        ?>
        <input type="button" name="page-number" value="<?php echo $i ?>" class="page-number" />

        <?php
      }
      ?>

      <input type="button" name="forward" value=">>" class="forward" />
    </div>
  </div>
  <?php
  exit;
  ?>

  <?php
}
function admin_css()
{
  wp_enqueue_style('ecommerce-admin-style-css', get_template_directory_uri() . '/assets/css/admin.css', rand(), true);
  wp_enqueue_media();
  wp_enqueue_script('ecommerce-admin-script', get_template_directory_uri() . '/assets/js/admin.js', array(), rand(), true);
}
add_action('admin_enqueue_scripts', 'admin_css');

function register_my_menus()
{
  register_nav_menus(
    array(
      'header-menu' => __('header-menu'),

    )
  );
}
add_action('init', 'register_my_menus');


function shop_orders()
{
  $Orders = array(
    'name' => 'Shoporder',
    'label' => __('Shoporder'),
    'supports' => array('title', 'editor', 'author'),
    'public' => true,
    'has_archive' => true,
    'menu_icon' => 'dashicons-update'
  );

  register_post_type('shoporder', $Orders);
}
add_action('init', 'shop_orders');


function ecommerce_billingdata_()
{
  add_meta_box('billing-id', 'Billing-Data', 'billingdata_display', 'shoporder');
}
add_action('add_meta_boxes', 'ecommerce_billingdata_');

function billingdata_display($post)
{
  $data = get_post_meta($post->ID, 'ecommerce_billing_data', true);
  // print_r($data);
  echo '<p><strong>' . __('firstname') . ':</strong> ' . $data['firstName'] . '</p>';
  echo '<p><strong>' . __('lastname') . ':</strong> ' . $data['lastName'] . '</p>';
  echo '<p><strong>' . __('email') . ':</strong> ' . $data['email'] . '</p>';
  echo '<p><strong>' . __('Address') . ':</strong> ' . $data['address'] . '</p>';
  echo '<p><strong>' . __('paymentmethod') . ':</strong> ' . $data['paymentMethod'] . '</p>';
}

function ecommerce_cartdata()
{
  add_meta_box('cart-id', 'Cart-Data', 'ecommerce_cartdata_display', 'shoporder');
}
add_action('add_meta_boxes', 'ecommerce_cartdata');
function ecommerce_cartdata_display($post)
{
  $cartdata = get_post_meta($post->ID, 'ecommerce_cart_data', true);
  //print_r($cartdata);

  ?>
  <div class="admin-cartdata">
    <table style="width:100%">
      <tr>
        <th>Image</th>
        <th>Title</th>
        <th>Qty</th>
        <th>Price</th>
        <th>subTotal</th>
        <th>Grand total</th>
      </tr>
      <?php
      $grandtotal = 100;
      foreach ($cartdata['productitems'] as $product_id => $qty) {
        ?>
        <tr>
          <td><img src="<?php echo get_the_post_thumbnail_url($product_id) ?>" width="100px" height="100px"></td>
          <td>
            <?php echo get_the_title($product_id); ?>
          </td>
          <td>
            <?php echo $qty ?>
          </td>
          <td>
            <?php echo get_post_meta($product_id, "ecommerce_price", true); ?>
          </td>
          <td>
            <?php
            $totalprice = get_post_meta($product_id, "ecommerce_price", true);

            $subtotal = (int) $totalprice * (int) $qty;
            ?>
            <?php echo $subtotal;
            $grandtotal += $subtotal; ?>
          </td>
          <?php
      }
      ?>
        <td>
          <?php echo $grandtotal; ?>
        </td>
      </tr>
    </table>
  </div>



  <?php
}

function contact()
{
  $Contact = array(
    'name' => 'Contact',
    'label' => __('Contact'),
    'supports' => array('title', 'editor', 'author'),
    'public' => true,
    'has_archive' => true,
    'menu_icon' => 'dashicons-format-chat'
  );

  register_post_type('contact', $Contact);
}
add_action('init', 'contact');
function contact_data_()
{
  add_meta_box('contact_data_id', 'Contact-Data', 'contact_data__display', 'contact');
}
add_action('add_meta_boxes', 'contact_data_');

function contact_data__display($post)
{

  $contactdata = get_post_meta($post->ID, 'contact_data', true);
  //  print_r($contactdata);
  echo '<p><strong>' . __('firstname') . ':</strong> ' . $contactdata['data']['Firstname'] . '</p>';
  echo '<p><strong>' . __('lastname') . ':</strong> ' . $contactdata['data']['Lastname'] . '</p>';
  echo '<p><strong>' . __('email') . ':</strong> ' . $contactdata['data']['Email'] . '</p>';
  echo '<p><strong>' . __('phonenumber') . ':</strong> ' . $contactdata['data']['phone'] . '</p>';
  echo '<p><strong>' . __('Message') . ':</strong> ' . $contactdata['data']['Message'] . '</p>';
}
