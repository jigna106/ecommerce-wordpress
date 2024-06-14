<?php
get_header();


$returnpostdata = wp_remote_get('http://192.168.1.8/wordpress/wp-json/v1/as-post/list/');
//  print_r($returnpostdata)
$json = json_decode($returnpostdata['body'], true);
?>

<div class="container-fluid pt-5">
    <div class="row d-flex justify-content-center">
        <?php
        foreach ($json as $jsondata) {
        ?>
            <div class="col-md-3 col-12">
                <a href="<?php echo get_permalink($jsondata['ID']) ?>" class="font-weight-bold text-decoration-none text-body">
                    <div class="footer_image">
                        <img src="<?php echo $jsondata['post_image']; ?>" />
                    </div>

                    <?php
                    foreach ($jsondata['category'] as $cat) {
                    ?>
                        <p class="text-uppercase categories"><?php echo "Categories: " . $cat['name'];
                                                            } ?></p>


                        <?php
                        foreach ($jsondata['tags'] as $tag) {
                        ?>
                            <p class="text-uppercase categories"><?php echo "tags: " . $tag['name'];
                                                                } ?></p>



                            <h5 class=""><?php echo $jsondata['post_title']; ?></h5>
                            <p><?php echo $jsondata['post_content'] ?></p>
                            <p class="text-uppercase categories"><?php
                                                                    $dateofpost = $jsondata['post_date'];
                                                                    echo  date("F j, Y", strtotime($dateofpost));;
                                                                    ?></p>
                </a>
            </div>

        <?php
        }
        ?>
    </div>

</div>
<?php
get_footer();

?>