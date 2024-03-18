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
    make_ajax();
  });
});

jQuery(document).ready(function () {
  jQuery(document).on("click", ".remove-filter", function () {
    var id = jQuery(this).parent().attr("data-id");
    jQuery("input[data-id='" + id + "']").removeAttr("checked");
    make_ajax();
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

function make_ajax() {
  var colors = [];
  var catgories = [];
  var brands = [];

  jQuery('input[name="color"]:checked').each(function () {
    colors.push(
      '<div  class="filter-item" data-id="' +
        this.value +
        '" data-tax="colors">' +
        this.value +
        '<input type="submit" value="X" name="close" class="remove-filter"> </div>'
    );
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
    colors: colors,
    catgories: catgories,
    brands: brands,
    action: "as_get_product_filter_color",
  };

  jQuery.ajax({
    type: "post",
    url: as_ecommerce_ajax_object.ajax_url,
    data: data,
    success: function (resulet) {
      jQuery(".ajax_response").html(resulet);
      console.log(resulet);
    },
  });
}
jQuery(document).ready(function () {
  
});