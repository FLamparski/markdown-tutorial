/* eslint-disable no-unused-vars */
/* global require, riot */

import Loader from './components/loader.js';
import Menu from './components/menu.js';
import Keyboard from './controls/keyboard.js';
import * as Models from './models.js';
import { loadCSS, loadJS } from './utils.js';

window.commonmark = require('commonmark');
window.riot = require('riot');
window.CodeMirror = require('codemirror');
require('codemirror/mode/markdown/markdown');

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
  Promise.all([
    loadCSS('assets/codemirror.css'),
    loadCSS('assets/monokai.css'),
    loadJS('templates/markdown.js'),
    loadJS('templates/lesson_test.js'),
    loadJS('templates/overview.js')])
  .then(() => {
    console.log('CodeMirror loaded');
    setTimeout(function() {
      riot.mount($('lesson-test').get(0), {});
      Loader.hide();
    }, 20);
  });
});
