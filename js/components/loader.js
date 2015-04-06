/* global ANIM_END */

export default {
  show: function(text) {
    let outer = $('.loader-outer');
    let container = $('.loader-container');
    text = text || 'Loading';
    this.setText(text);
    container.removeClass('loader-hidden');
    outer.addClass('loader-show').one(ANIM_END, function() {
      outer.removeClass('loader-show');
    });
  },
  hide: function() {
    let outer = $('.loader-outer');
    let container = $('.loader-container');
    outer.addClass('loader-hide').one(ANIM_END, function() {
      container.addClass('loader-hidden');
      outer.removeClass('loader-hide');
    });
  },
  setText: function(text) {
    let label = $('.loader-label');
    label.text(text);
  }
};
