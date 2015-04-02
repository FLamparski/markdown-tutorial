$(document).one('appLoad', function() {
  // This allows us to define keymaps like data-shortcut="combination event"
  $('*[data-shortcut]').each(function() {
    let $this = $(this);
    let [keybind, event] = $this.data('shortcut').split(' ');
    console.log('register', this, keybind, event);

    $(document).bind('keyup', keybind, () => {
      $this.trigger(event);
    });
  });
});
