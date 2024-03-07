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
    jQuery('input[name="color"]:checked').each(function () {
      colors.push(this.value);
    });
    let data = {
      colors: colors,
      action: "as_get_product_filter_color",
    };
    // console.log(colors);
    jQuery.ajax({
      type: "post",
      url: as_ecommerce_ajax_object.ajax_url,
      data: data,
      success: function (data) {
        if (data == data) {
          jQuery(".ajax_response").html(data);
          console.log(data);
        } else {
          
        }
      },
    });
  });
});
