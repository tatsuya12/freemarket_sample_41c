// $('.first').on('change',function(){
//     $('.secont option').show();
//     $('.second').prop('selectedIndex',$(this).prop('selectedIndex'));
//     $('second option[value='+$(this).val()+']').hide();
//   });

$(function(){

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
