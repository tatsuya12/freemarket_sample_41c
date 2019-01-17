$(function() {
  $(".input-search").on("keyup", function() {
    var input = $(".input-search").val();

    $.ajax({
      type: 'GET',
      url: '/items/search',
      data: { keyword: input },
      dataType: 'json'
    })

    .done(function(items) {
      $(".listview.js-lazy-load-images").empty();
      if (items.length !== 0) {
       items.forEach(function(product){
         appendItem(item);
       });
      }
      else {
       appendNoProduct("一致する商品はありません");
      }
    })
  });
});
