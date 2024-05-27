<?php
get_header();

if (have_posts()) {
  while (have_posts()) {
    the_post();
    global $post;

    $returnpostdata = wp_remote_get('http://192.168.1.16/wordpress/wp-json/test/singlepost/' . $post->post_name);
    $singlepostdata = json_decode($returnpostdata['body'], true);


    // echo "<pre>";
    // print_r($singlepostdata);
    // echo "</pre>";


?>
    <div>
      <a href="<?php echo get_permalink($singlepostdata['ID']) ?>" class="font-weight-bold text-decoration-none text-body">

        <div class="footer_image">
          <img src="<?php echo $singlepostdata['post_image']; ?>" />
        </div>
        <?php
        foreach ($singlepostdata['category'] as $cat) {
        ?>
          <p class="text-uppercase categories"><?php echo "Categories: " . $cat['name']; ?></p>
        <?php } ?>


        <?php
        foreach ($singlepostdata['tags'] as $tag) {
        ?>
          <p class="text-uppercase categories"><?php echo "tags: " . $tag['name']; ?></p>
        <?php } ?>



        <h5 class=""><?php echo $singlepostdata['post_title']; ?></h5>
        <p><?php echo $singlepostdata['post_content'] ?></p>
        <p class="text-uppercase categories"><?php
                                              $dateofpost = $singlepostdata['post_date'];
                                              echo  date("F j, Y", strtotime($dateofpost));;
                                              ?></p>


      </a>

    </div>
<?php
if (current_user_can('administrator')) {

    // Runs only if this PHP code is in a file that displays outside the admin panels, like the theme template.
      $id=get_the_ID();
      echo '<div style="text-align: center"><a href="'.site_url()."/updatepost/?id=".$singlepostdata['ID'].'"> Edit This Post</a></div>';
    
    }
  }
}
get_footer();
?>