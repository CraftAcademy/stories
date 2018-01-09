document.addEventListener('page:load', function (event) {
    if (typeof ga === 'function') {
        ga('set', 'location', event.srcElement.URL);
        ga('send', 'pageview');
    }
});