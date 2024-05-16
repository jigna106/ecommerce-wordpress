</div>
</div>
<?PHP
$returnpostdata = wp_remote_get('http://192.168.1.16/wordpress/wp-json/test/api/blogpost');
//  print_r($returnpostdata)

$json = json_decode($returnpostdata['body'],true);
print_r($json);
?>
<div class="container-fluid " style="background-color: rgb(217 230 236)" ;>
    <div class="row d-flex justify-content-center">
        <?php
        foreach ($json as $jsondata) {
        ?>
            <div class="col-md-3 col-12">
                <a href="<?php echo get_permalink($jsondata['ID']) ?>" class="font-weight-bold text-decoration-none text-body">
                    <div class="footer_image">
                        <img src="<?php echo $jsondata['post_image']; ?>" />
                    </div>
                </span>
                <?php
                // $categories= wp_get_post_terms($jsondata['name']);
                // echo $categories;

               //echo  "Categories: " . $jsondata['name'] ;
               foreach( $jsondata['category'] as $cat){
                   echo "Categories: " . $cat['name'];
               }
                ?>
                        </span>
                   
                    <h5 class="text-uppercase"><?php echo $jsondata['post_title']; ?></h5>
                    <p><?php echo $jsondata['post_content'] ?></p>
                </a>
            </div>

        <?php
        }
        ?>
    </div>

</div>
<div class="footer">
    <?php wp_footer(); ?>

    <div class="text-center p-3" style="background-color: rgba(217 230 236);">
        ©2024 Copyright:AsEcommerce
    </div>
</div>
</body>

</html>