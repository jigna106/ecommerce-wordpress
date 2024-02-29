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
  wp_enqueue_style('ecommerce-style-css', get_template_directory_uri() . '/assets/css/style.css', rand(), true);
  wp_enqueue_style('ecommerce-boostrap-css', get_template_directory_uri() . '/assets/css/bootstrap.min.css', rand(), true);
  wp_enqueue_script('jquery');
  wp_enqueue_script('ecommerce-script', get_template_directory_uri() . '/assets/js/bootstrap.bundle.min.js', array(), rand(), true);
  wp_enqueue_script('ecommerce-main-script', get_template_directory_uri() . '/assets/js/main.js', array('jquery'), rand(), true);
}
add_action('wp_enqueue_scripts', 'wpdocs_theme_name_scripts');


function admin_css()
{
  wp_enqueue_style('ecommerce-style-css', get_template_directory_uri() . '/assets/css/admin.css', rand(), true);
}
add_action('admin_enqueue_scripts', 'admin_css');

function register_my_menus()
{
  register_nav_menus(
    array(
      'header-menu' => __('Header Menu')

    )
  );
}
add_action('init', 'register_my_menus');


function shop_orders()
{
  $Orders = array(
    'name'          => 'Shoporder',
    'label'        => __('Shoporder'),
    'supports' => array('title', 'editor', 'author'),
    'public'      => true,
    'has_archive' => true,
    'menu_icon' => 'dashicons-update'
  );

  register_post_type('shoporder', $Orders);
}
add_action('init', 'shop_orders');



function ecommerce_billingdata_()
{
  add_meta_box('billing-id', 'Billing-Data', 'billingdata_display','shoporder');
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
  add_meta_box('cart-id', 'Cart-Data', 'ecommerce_cartdata_display','shoporder');
}
add_action('add_meta_boxes', 'ecommerce_cartdata');
function ecommerce_cartdata_display($post)
{
  $cartdata = get_post_meta($post->ID, 'ecommerce_cart_data', true);
  // print_r($cartdata); 

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
          <td><?php echo get_the_title($product_id); ?></td>
          <td><?php echo $qty ?></td>
          <td> <?php echo get_post_meta($product_id, "ecommerce_price", true); ?></td>
          <td><?php $subtotal = get_post_meta($product_id, "ecommerce_price", true) * (int) $qty; ?>
            <?php echo $subtotal;
            $grandtotal += $subtotal; ?></td>


        <?php
      }
        ?>
        <td><?php echo $grandtotal; ?></td>
        </tr>


    </table>
  </div>
<?php
}
