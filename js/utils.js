
export function loadCSS(href) {
  console.log('loadCSS', href);
  let promise = new Promise((resolve, reject) => {
    let $link = $('<link/>')
      .attr('href', href)
      .attr('type', 'text/css')
      .attr('rel', 'stylesheet');
    $link.one('load', resolve);
    $link.one('error', reject);
    $('head').append($link);
  });
  return promise;
}

export function loadJS(src) {
  console.log('loadJS', src);
  let jqxhr = $.ajax({
    url: src,
    dataType: 'script',
    cache: true
  }).promise;
  return $.when(jqxhr);
}
