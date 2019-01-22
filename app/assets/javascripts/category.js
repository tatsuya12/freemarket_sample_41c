$(document).on('turbolinks:load', function(){
// カテゴリーセレクト
  $('#item_category_id').change(function(event, template) {
    var val = $('#item_category_id').val();
    var template = $(`#childrenCategoryOf${val}`);
    $(this).nextAll().remove();
    $(this).parent().append(template.html());
    });

  $(document).on('change', '.midium_categories', function(event, template) {
    var val = $('.midium_categories').val();
    var template = $(`#childrenCategoryOf${val}`);
    $(this).nextAll().remove();
    $(this).parent().append(template.html());
  });
})
