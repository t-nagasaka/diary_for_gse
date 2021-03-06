// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
require("bootstrap/dist/js/bootstrap");

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

document.addEventListener("turbolinks:load", () => {
  flatpickr("#calendar", {
    defaultDate: "today",
    maxDate: "today",
    onChange: (e) => {
      chooseDate = document.getElementById("calendar").value;
      $.ajax({
        url: "/diaries/search", // リクエストを送信するURLを指定
        type: "POST", // HTTPメソッドを指定（デフォルトはGET）
        data: {
          // 送信するデータをハッシュ形式で指定
          data: { date: chooseDate },
        },
        dataType: "json", // レスポンスデータをjson形式と指定する
      })
        .done(function (result) {
          $("#diary-title").val(result.title);
          $("#diary-comment").val(result.comment);
        })
        .fail(function () {
          alert("error!"); // 通信に失敗した場合はアラートを表示
        });
    },
  });
  //
  $(document).click(function (event) {
    if (!$(event.target).closest(".navbar").length) {
      $(".navbar-collapse").collapse("hide");
    }
  });
  //
  var $formerDay;

  $(function () {
    $(".dropdown-menu .dropdown-item").click(function () {
      var visibleItem = $(".dropdown-toggle", $(this).closest(".dropdown"));
      visibleItem.text($(this).attr("value"));
      formerDay = $(this).parents(".former-day")[0];
      $.ajax({
        url: "/diaries/former_comment", // リクエストを送信するURLを指定
        type: "GET", // HTTPメソッドを指定（デフォルトはGET）
        data: {
          // 送信するデータをハッシュ形式で指定
          data: { date: this.dataset.former, position: this.dataset.position }, //id=dateとしてviewに記載
        },
        dataType: "json", // レスポンスデータをjson形式と指定する
      })
        .done(function (result) {
          formerDay.querySelector("p.prev-text").innerText = result.comment;
          formerDay.querySelector("h5.modal-title").innerText = result.title;
          formerDay.querySelector("div.modal-body").innerText = result.comment;
          // $("#former-day-title-lhob").html(result.title);
          // $("#former-day-comment-lhob").html(result.comment);
        })
        .fail(function () {
          alert("error!"); // 通信に失敗した場合はアラートを表示
        });
    });
  });
});
