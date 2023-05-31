Spree.fetch_recently_viewed_products = (productId = "") => {
  $.ajax({
    url: Spree.pathFor("recently_viewed_products?product_id=" + productId),
    success: (data) =>
      $("#recently-viewed-products-js").html(data)
  })
};

Spree.ready(function($) {
  var $myDiv = $('#recently-viewed-products-js');
  var $productId = $myDiv.attr("product-id");

  if ( $myDiv.length){
    Spree.fetch_recently_viewed_products($productId);
  }
})
