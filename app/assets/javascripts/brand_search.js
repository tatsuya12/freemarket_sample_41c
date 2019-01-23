$(document).on('turbolinks:load', function() {

  var search_list =$(".sell-brand-suggest");

  function appendBrand(brand) {
    var html = `<div id="${brand.id}", value="${brand.name}", class="brand-list">
                  ${brand.name}
                </div>`
    search_list.append(html);
  }

  function appendNoBrand(brand) {
    var html = ``
    search_list.append(html);
  }
  $(".brand_search").on("input", function() {
    var input = $(".brand_search").val();

    $.ajax({
      type: 'GET',
      url: '/items/brand_search',
      data: { keyword: input },
      dataType: 'json'
    })

    .done(function(brands) {
      $('.form-suggest-list').find('.brand-list').remove();
      if (brands.length !== 0) {
        brands.forEach(function(brand){
        appendBrand(brand);
      });
      }
    })
  });

  $(document).on('click', '.brand-list' , function() {
    $(this).parent().remove();
    var name = $(this).attr("value")
    $(".brand_search").val(name)
  });
});
