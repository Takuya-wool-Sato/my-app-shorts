// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

const splideSection = document.getElementById("splideSection");
if (splideSection) {
  var splide = new Splide( '.splide', {
    type    : 'loop',
    autoplay: true,
    arrows: false, // 矢印ボタンを非表示
    interval: 4000
  });
  splide.mount();
} else {
  console.log("要素が見つからないため、処理は行われません。");
}

document.addEventListener("DOMContentLoaded", function() {
  // 通知要素を取得
  var notificationElement = document.getElementById("notification");

  // 通知要素が存在する場合のみ処理を行う
  if (notificationElement) {
    // 通知を表示する
    fadeInElement(notificationElement, 1000); // 1秒かけてフェードイン

    // 3秒後に通知を非表示にする
    setTimeout(function() {
      fadeOutElement(notificationElement, 1000); // 1秒かけてフェードアウト
    }, 3000);
  }
});

// 要素をフェードインさせる関数
function fadeInElement(element, duration) {
  var opacity = 0;
  element.style.opacity = 0;
  var interval = setInterval(function() {
    if (opacity < 1) {
      opacity += 0.1;
      element.style.opacity = opacity;
    } else {
      clearInterval(interval);
    }
  }, duration / 10);
}

// 要素をフェードアウトさせる関数
function fadeOutElement(element, duration) {
  var opacity = 1;
  element.style.opacity = 1;
  var interval = setInterval(function() {
    if (opacity > 0) {
      opacity -= 0.1;
      element.style.opacity = opacity;
    } else {
      clearInterval(interval);
    }
  }, duration / 10);
}
