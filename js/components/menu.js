/* global ANIM_END */

export default {
  init: function() {
    $('.menu-button').on('click', function() {
      let $menu = $('#menu');
      let isHidden = $menu.hasClass('hidden');
      if (isHidden) {
        $('.menu-button').addClass('active');
        $menu.removeClass('hidden').addClass('showing').one(ANIM_END, function() {
          $menu.removeClass('showing');
        });
      } else {
        $('.menu-button').removeClass('active');
        $menu.addClass('hiding').one(ANIM_END, function() {
          $menu.addClass('hidden').removeClass('hiding');
        });
      }
    });
  }
};
