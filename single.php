<?php
get_header();

if (have_posts()) {
  while (have_posts()) {
    the_post();
    global $post;

    $returnpostdata = wp_remote_get('http://192.168.1.8/wordpress/wp-json/v1/as-post/' . $post->post_name);
    $singlepostdata = json_decode($returnpostdata['body'], true);

    // echo "<pre>";
    // print_r($singlepostdata);
    // echo "</pre>";
?>
    <div style="text-align: center">
      <input type="hidden" name="id" id="postid" value="<?php echo $singlepostdata['ID'] ?>" />
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
  }
}

if (current_user_can('administrator')) {

  // Runs only if this PHP code is in a file that displays outside the admin panels, like the theme template.
  $id = get_the_ID();
  echo '<div style="text-align: center"><a href="' . site_url() . "/updatepost/?postname=" . $singlepostdata['post_name'] . '"> Edit This Post</a></div>';
  ?>
  <div style="text-align: center">
    <input class="btn btn-primary" type="button" name="deletepost" id="deletepost" value="DELETEPOST" />
  </div>
<?php
}
get_footer();
?>