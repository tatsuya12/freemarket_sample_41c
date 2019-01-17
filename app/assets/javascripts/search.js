$(function() {

  var search_list = $(".items-box-parent");
  var search_result = $(".search-container__l-content__items__head")

  function appendItem(item) {
    var haml = `.items-box-child
                  = link_to "" do
                    .child-image
                      - item.images.first(1).each do |image|
                        =image_tag(image.image, class: "first-image")
                    .child-content
                      %h3.child-content__name
                        = item.name
                      .child-content__bottom
                        .child-content__bottom__price
                          = "¥#{item.price}"
                        .child-content__bottom__likes
                          %i.fa.fa-heart
                            %span
                              8
                      .child-content__tax
                        (税込)`
    search_list.append(haml);
  }

  function appendNoItem(item) {
    var message = `一致する商品はありません`
    var result = `検索結果 0件`
    search_list.append(message);
    search_result.empty();
    search_result.append(result);
  }





  $(".input-search").on("keyup", function() {
    var input = $(".input-search").val();

    $.ajax({
      type: 'GET',
      url: '/items/search',
      data: { keyword: input },
      dataType: 'json'
    })

    .done(function(items) {
      $(".items-box-parent").empty();
      if (items.length !== 0) {
       items.forEach(function(item){
         appendItem(item);
       });
      }
      else {
       appendNoItem("一致する商品はありません");
      }
    })
  });
});
