<?php
function create_custom_post_type()
{
  $products = array(
    'name'          => 'Product',
    'label'        => __('Product'),
    'supports' => array('title', 'editor', 'author', 'thumbnail', 'excerpt', 'comments', 'custom-fields'),
    'public'      => true,
    'has_archive' => true,
    'menu_icon' => 'dashicons-products'
  );
  add_theme_support('custom-header');
  add_theme_support('automatic-feed-links');
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
    'rewrite' => array('slug' => 'brand'),
    'hierarchical' => true,

  );
  register_taxonomy('brand', 'product', $args);
}
add_action('init', 'add_product_taxonomy');
function wpdocs_theme_name_scripts()
{
  wp_enqueue_style('ecommerce-boostrap-icon-css', get_template_directory_uri() . '/assets/css/bootstrap-icons.css');
  wp_enqueue_style('ecommerce-style-css', get_template_directory_uri() . '/assets/css/style.css',rand(),true);

  wp_enqueue_style('ecommerce-boostrap-css', get_template_directory_uri() . '/assets/css/bootstrap.min.css',rand(),true);
  wp_enqueue_script('ecommerce-script', get_template_directory_uri() . '/assets/js/bootstrap.bundle.min.js',rand(),true);
  
}
add_action('wp_enqueue_scripts', 'wpdocs_theme_name_scripts');

function register_my_menus()
{
  register_nav_menus(
    array(
      'header-menu' => __('Header Menu')

    )
  );
}
add_action('init', 'register_my_menus');
?>