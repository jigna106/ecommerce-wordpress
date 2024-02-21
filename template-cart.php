<?php /* Template Name: cart */ 
get_header();

echo "<pre>";

print_r($_SESSION);
echo "</pre>";

if (isset($_SESSION['productitems'])) {
 
  

}
else{ 
    echo "Your cart empty";
    
}
?>


<?php
get_footer();
?>




