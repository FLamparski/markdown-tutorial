/* global ANIM_END:true */
const ANIM_END = (function (){ //eslint-disable-line
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
