// $('.first').on('change',function(){
//     $('.secont option').show();
//     $('.second').prop('selectedIndex',$(this).prop('selectedIndex'));
//     $('second option[value='+$(this).val()+']').hide();
//   });

$(function(){
//   var search_list = $('select-wrap');
//   function appendMidiumCategories(user) {
//     var html =
//     `<div class="chat-group-user clearfix">
//       <p class="chat-group-user__name">${user.name}</p>
//       <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${user.name}">追加</a>
//     </div>`
//     search_list.append(html);
//   }

//   $('#item_category_id').change(function() {
//     // 選択されているvalue属性値を取り出す
//     var val = parseInt($('#item_category_id').val()) - 1;
//     console.log(val); // 出力：ABC
//     // 選択されている表示文字列を取り出す
//     var txt = $('#item_category_id option:selected').text();
//     console.log(txt); // 出力：えーびーしー
//     var midium = gon.midium_categories[val]
//     console.log(midium)
// });

  // $('#item_category_id').change(function() {
  //   var val = parseInt($('#item_category_id').val());
  //   console.log(val)

  //   var id =  parseInt($('.template').attr("id")) + 1;
  //   console.log(val)
  //   console.log(id)
  //   if(val == id ) {
  //     $(this).show();
  //   }

  //   });







// 手数料表示
  $("#price").on("keyup", function(){
    var input = $("#price").val();
    var fee = Math.round(input * 0.1);
    var profit = Math.round(input * 0.9);

    // console.log(gon.large_categories)
    // console.log(gon.midium_categories)
    // console.log(gon.small_categories)

    $('.fee').empty();
    $('.fee').append(fee);

    $('.profit').empty();
    $('.profit').append(profit);

  })
})
