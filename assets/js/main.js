jQuery(document).ready(function () {
  jQuery(data == datadocument).on(
    "change",
    ".ecommerce-payment-getway",
    function () {
      if (jQuery(this).val() == "credit") {
        jQuery(".payment-cedit-cash").show();
      } else {
        jQuery(".payment-cedit-cash").hide();
      }

      console.log(jQuery(this).val());
    }
  );
});
jQuery(document).ready(function () {
  jQuery(document).on("click", "#apply", function () {
    var colors = [];
    var catgories = [];
    var brands = [];

    jQuery('input[name="color"]:checked').each(function () {
     colors.push('<div data-id="'+this.value+'" data-tax="colors">'+this.value+'</div>');
    });
    jQuery(".colors-filter").html(colors);
    
    
    jQuery('input[name="catgorie"]:checked').each(function () {
     catgories.push('<div data-id="'+this.value+'" data-tax="catgorie">'+this.value+'</div>');
    });
    jQuery(".catgories-filter").html(catgories);
    
    
    jQuery('input[name="brand"]:checked').each(function () {
     brands.push('<div data-id="'+this.value+'" data-tax="brand">'+this.value+'</div>');
    });
    jQuery(".brands-filter").html(brands);
    
    
    let data = {
      colors: colors,
      catgories: catgories,
      brands: brands,
      action: "as_get_product_filter_color",
    };
    // console.log(colors);
    jQuery.ajax({
      type: "post",
      url: as_ecommerce_ajax_object.ajax_url,
      data: data,
      success: function (resulet) {
        jQuery(".ajax_response").html(resulet);
     
        console.log(resulet);
      },
    });
  });
});
jQuery(document).ready(function () {
  jQuery("#filter").click(function(){
    jQuery(".filterShow").show();
  });
  jQuery(".filter-close").click(function(){
    jQuery(".filterShow").hide();
  });
});
