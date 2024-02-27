jQuery(document).ready(function() {
    jQuery(document).on("change",".ecommerce-payment-getway",function(){
          if(jQuery(this).val()=="credit"){
         jQuery(".payment-cedit-cash").show();

        }
        else{ 
           jQuery(".payment-cedit-cash").hide();
        }
    
        console.log(jQuery(this).val())
    })
});




