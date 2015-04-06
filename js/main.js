/* eslint-disable no-unused-vars */

import Loader from './components/loader.js';
import Menu from './components/menu.js';
import Keyboard from './controls/keyboard.js';
import * as Models from './models.js';

window.ANIM_END = (function (){ //eslint-disable-line no-unused-vars
  let t;
  let el = document.createElement('fakeelement');
  const animations = {
    'animation': 'animationend',
    'OAnimation': 'oAnimationEnd',
    'MozAnimation': 'animationend',
    'WebkitAnimation': 'webkitAnimationEnd'
  };

  for (t in animations) {
    if (el.style[t] !== undefined) {
      return animations[t];
    }
  }
}());

$(function() {
  Menu.init();
  Keyboard.init();
  Loader.hide();
});
