$(document).on('turbolinks:load', function(){
// 手数料表示
  $("#price").on("keyup", function(){
    var input = $("#price").val();
    var fee = Math.round(input * 0.1);
    var profit = Math.round(input * 0.9);

    $('.fee').empty();
    $('.fee').append(fee);

    $('.profit').empty();
    $('.profit').append(profit);
  })
})
