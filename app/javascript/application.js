// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import jquery from "jquery"
window.$ = jquery

/*global $*/
// document.getElementById("category").addEventListener('change', function() {
//     console.log("hello")
// });

$("#category").change(function() {
  // 選択されたカテゴリを取得
  var category_select = $(this).val();
  $.ajax({
    url: '/requests/new',
    type: 'GET',
    data: { category_select: category_select },
    success: function(response) {
      console.log(response)
      // レスポンスを元に試合日時を表示
      $('#match_date').innerHTML = response;
    }
  });
  // console.log(category_select)
});

