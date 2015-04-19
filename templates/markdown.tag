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
        inputStyle: 'textarea',
        value: opts.value || $('.initial-content').text() || ''
      });
      this.codemirror.on('changes', _.debounce(this.update.bind(this), 200));
      this.codemirror.refresh();

      let currentMark;
      $('.preview', this.root).on('mouseenter', '[data-sourcepos]', e => {
        let [startpos, endpos] = $(e.target).data('sourcepos').split('-');
        // commonmark returns character positions using 1-based indices,
        // codemirror wants 0-based.
        let start = {
          line: parseInt(startpos.split(':')[0], 10) - 1,
          ch: parseInt(startpos.split(':')[1], 10) - 1
        };
        let end = {
          line: parseInt(endpos.split(':')[0], 10),
          ch: parseInt(endpos.split(':')[1], 10)
        };
        currentMark = this.codemirror.markText(start, end, {className: 'md-highlight-source'});
      }).on('mouseleave', '[data-sourcepos]', e => {
        currentMark.clear();
      });
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
