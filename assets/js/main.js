jQuery(document).ready(function () {
  if(as_ecommerce_ajax_object && as_ecommerce_ajax_object.cart_itmes_data){
    jQuery(".cart_itmes").append("<span class='cart_total'>"+as_ecommerce_ajax_object.cart_itmes_data+"</span>")
  }
  jQuery(document).on("change", ".ecommerce-payment-getway", function () {
    if (jQuery(this).val() == "credit") {
      jQuery(".payment-cedit-cash").show();
    } else {
      jQuery(".payment-cedit-cash").hide();
    }

    console.log(jQuery(this).val());
  });
});
jQuery(document).ready(function () {
  jQuery(document).on("click", "#apply", function () {
    make_ajax(1);
  });
});

jQuery(document).ready(function () {
  jQuery(document).on("click", ".remove-filter", function () {
    var id = jQuery(this).parent().attr("data-id");
    jQuery("input[data-id='" + id + "']").removeAttr("checked");
    var selctedsize = jQuery(".select-size").val();
    make_ajax(1, selctedsize);
  });
});

jQuery(document).ready(function () {
  jQuery("#filter").click(function () {
    jQuery(".filterShow").show();
  });
  jQuery(".filter-close").click(function () {
    jQuery(".filterShow").hide();
  });
});

jQuery(document).ready(function () {
  jQuery(document).on("click", ".page-number", function () {
    var text = jQuery(this).val();
    var selctedsize = jQuery('.select-size').val();
    console.log(selctedsize)
    
    make_ajax(text,selctedsize);
  });
});

jQuery(document).ready(function () {
  jQuery(document).on("change", ".select-size", function () {
    var selctedsize = jQuery(".select-size").val();
    // console.log(selctedsize);
    make_ajax(1, selctedsize);
  });
});
function make_ajax(text = 1, selctedsize = 2) {
  var colors = [];
  var colors_ajax = [];
  var catgories = [];
  var catgories_ajax = [];
  var brands = [];
  var brands_ajax = [];

  jQuery('input[name="color"]:checked').each(function () {
    colors.push(
      '<div  class="filter-item" data-id="' +
        this.value +
        '" data-tax="colors">' +
        this.value +
        '<input type="submit" value="X" name="close" class="remove-filter"> </div>'
    );
    colors_ajax.push(this.value);
  });
  jQuery(".colors-filter").html(colors);
  if (colors.length > 0) {
    jQuery(".filter-list .colors").addClass("d-flex").removeClass("d-none");
  } else {
    jQuery(".filter-list .colors").removeClass("d-flex").addClass("d-none");
  }

  jQuery('input[name="catgorie"]:checked').each(function () {
    catgories.push(
      '<div class="filter-item" data-id="' +
        this.value +
        '" data-tax="catgorie">' +
        this.value +
        '<input type="submit" value="X" name="close" class="remove-filter"></div>'
    );
    catgories_ajax.push(this.value);
  });
  jQuery(".catgories-filter").html(catgories);
  if (catgories.length > 0) {
    jQuery(".filter-list .catgories").addClass("d-flex").removeClass("d-none");
  } else {
    jQuery(".filter-list .catgories").removeClass("d-flex").addClass("d-none");
  }

  jQuery('input[name="brand"]:checked').each(function () {
    brands.push(
      '<div class="filter-item" data-id="' +
        this.value +
        '" data-tax="brand">' +
        this.value +
        '<input type="submit" value="X" name="remove-filter" class="remove-filter"></div>'
    );
    brands_ajax.push(this.value);
  });
  jQuery(".brands-filter").html(brands);
  if (brands.length > 0) {
    jQuery(".filter-list .brand").addClass("d-flex").removeClass("d-none");
  } else {
    jQuery(".filter-list .brand").removeClass("d-flex").addClass("d-none");
  }
  // console.log(colors);
  // console.log(catgories);
  // console.log(brands);

  let data = {
    page: text,
    page_size: selctedsize,
    colors: colors_ajax,
    catgories: catgories_ajax,
    brands: brands_ajax,
    action: "as_get_product_filter_color",
  };

  jQuery.ajax({
    type: "post",
    url: as_ecommerce_ajax_object.ajax_url,
    data: data,
    success: function (resulet) {
      jQuery(".ajax_response").html(resulet);
      // console.log(resulet);
    },
  });
}

jQuery(document).ready(function () {
  jQuery(document).on("click", "#Contact_page_submit", function () {
    var contactdata = {};

    var firstname = jQuery("#firstname").val();
    var lastname = jQuery("#lastname").val();
    var email = jQuery("#email").val();
    var phone = jQuery("#phone").val();
    var message = jQuery("#message").val();

    contactdata.Firstname = firstname;
    contactdata.Lastname = lastname;
    contactdata.Email = email;
    contactdata.phone = phone;
    contactdata.Message = message;
  
    let contactdataajax = {
    data: contactdata,
    action: "as_contactdata",
  };
  jQuery.ajax({
    type: "post",
    url: as_ecommerce_ajax_object.ajax_url,
    data: contactdataajax,
    success: function (getdata) {
         console.log(getdata);
    },
  });
  });
});
jQuery( document ).ready(function() {

  jQuery('.as_shop_menu' ).mouseenter(function(){
    jQuery('.as_shop_menu .sub-menu').show();
  });

  jQuery('.as_shop_menu' ).mouseleave(function(){
    jQuery('.as_shop_menu .sub-menu').hide();
  })
});