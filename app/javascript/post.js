// document.addEventListener('DOMContentLoaded', () => {
//   console.log('Hello from post.js!');
// });

// カテゴリが変更されたときの処理
// /*global $*/
//   $(function(){
//     $(".category_select").addEventListener('change', function() {
//       // 選択されたカテゴリを取得
//       var category_select = this.value;
//       console.log(category_select)
//     });
//   });
  // Ajaxを使用してサーバーにリクエストを送信し、試合日時を取得
//   $.ajax({
//     url: '/matches/get_match_categories',
//     type: 'GET',
//     data: { category: selectedCategory },
//     success: function(response) {
//       // レスポンスを元に試合日時を表示
//       document.getElementById('matchDates').innerHTML = response;
//     }
//   });
// })