// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import jquery from "jquery"
window.$ = jquery

/*global $*/

//試合日時と試合選択を非表示
$('#select_match_date').hide();
$('#select_match_team').hide();


$("#category").change(function() {
  // 選択されたカテゴリを取得
  var category_select = {
    paramName: "select_category",
    value: $(this).val()
  };

  $.ajax({
    url: '/requests/get_match_categories',
    type: 'GET',
    data: { req: category_select },
    success: function(response) {
      // console.log(response)

      // #match_date の子要素（既存のオプション）をクリア
      $('#select_match_date').empty();

      if (response.length > 0) {
        $('#select_match_date').show();
        // レスポンスを元に試合日時を表示
        for (const elem of response) {
          const matchDateOption = $('<option>').html(elem.match_date).val(elem.match_date)
  　　    $('#select_match_date').append(matchDateOption);
        }
      } else {
        $('#select_match_date').hide();
      }
    }
  });
});

$("#select_match_date").change(function() {
  // 選択されたカテゴリを取得
  console.log($('#category').val());
  var match_date_select = {
    paramName: "select_match_date",
    value1: $(this).val(), //match_dateのvalueを取得
    value2: $('#category').val()
  };
  $.ajax({
    url: '/requests/get_match_categories',
    type: 'GET',
    data: { req: match_date_select },
    success: function(response) {
      console.log(response)

      // #select_match の子要素（既存のオプション）をクリア
      $('#select_match_team').empty();

      if (response.length > 0) {
        $('#select_match_team').show();
        // レスポンスを元に試合日時を表示
        for (const elem of response) {
              $('#select_match_team').append($('<option>').html(elem.home_team_name + "VS" + elem.away_team_name).val(elem.id))
        }
      } else {
        $('#select_match_team').hide();
      }
    }
  });
});

$("#select_match_team").change(function() {
  // 選択されたカテゴリを取得
  console.log($('#category').val());
  var match_team_select = {
    paramName: "select_match_team",
    value: $(this).val(),//team
  };
  $.ajax({
    url: '/requests/get_match_categories',
    type: 'GET',
    data: { req: match_team_select },
    success: function(response) {
      console.log(response)

      // #select_match の子要素（既存のオプション）をクリア
      // $('#stadium_name').empty();

      if (response.length > 0) {
        $('#stadium_name').show();
        // レスポンスを元に試合日時を表示
        for (const elem of response) {
        　　$('#stadium_name').html(elem.stadium_name)
        }
      } else {
        $('#stadium_name').hide();
      }
    }
  });
});

