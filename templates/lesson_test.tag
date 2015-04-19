<lesson-test>
  <div id="lesson-test-one">
    <p>Some text here</p>
    <markdown class="md-small" data-task-id="1"></markdown>
    <p>More text</p>
    <markdown class="md-small" data-task-id="2"></markdown>
  </div>

  <script type="es6">
    this.on('mount update unmount', (evname) => {
      console.log('[lesson-test]', evname);
    });
    this.on('mount', () => {
      this.rootElement = $('#lesson-test-one');
    });
  </script>
</lesson-test>
