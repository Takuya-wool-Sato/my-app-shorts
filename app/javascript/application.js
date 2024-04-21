// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import Splide from '@splidejs/splide';

var splide = new Splide( '.splide', {
  type    : 'loop',
  autoplay: true,
  arrows: false, // 矢印ボタンを非表示
  interval: 6000
});

splide.mount();
