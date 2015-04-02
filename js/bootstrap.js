/* eslint-env browser, es5 */
/* eslint-disable no-var */
(function() {
  'use strict';
  var list = [
    'jquery.hotkeys.js',
    'backbone.localStorage-min.js',
    'bundle.js',
    'codemirror.js'
  ];

  document.addEventListener('DOMContentLoaded', function() {
    /* global _ */
    var loaded = [];
    $('script').on('load', function() {
      console.log('script load', this.src);
      var basename = _.last(this.src.split('/'));
      loaded.push(basename);
      if (_.intersection(list, loaded).length === list.length) {
        /* global ANIM_END */
        $(document).trigger('appLoad');
        $('.loader-outer').addClass('loader-hide');
        $('.loader-outer').one(ANIM_END, function() {
          $('.loader-container').addClass('loader-hidden');
          $('.loader-outer').removeClass('loader-hide');
        });
      }
    });
  });
}());
