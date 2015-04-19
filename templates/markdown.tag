<markdown>
  <div class="row">
    <div class="initial-content" style="display: none"><inner-html/></div>
    <div class="editor" id="codeEditor"></div>
    <div class="preview" id="previewWindow"></div>
  </div>

  <script type="es6">
    console.log('markdown tag definition loaded');
    let parser = new commonmark.Parser();
    let renderer = new commonmark.HtmlRenderer({sourcepos: true});
    this.on('mount update unmount', (evname) => {
      console.log('[markdown]', evname);
    });
    this.on('mount', () => {
      this.codemirror = CodeMirror(this.codeEditor, {
        mode: 'markdown',
        theme: 'monokai',
        lineWrapping: true,
        lineNumbers: true,
        inputStyle: 'contenteditable',
        value: opts.value || $('.initial-content').text() || ''
      });
      this.codemirror.on('changes', _.debounce(this.update.bind(this), 200));
    });
    this.on('update', () => {
      if (!this.codemirror) {
        return;
      }
      $(this.previewWindow).html(
        renderer.render(parser.parse(this.codemirror.getValue()))
      );
    });
  </script>
</markdown>
