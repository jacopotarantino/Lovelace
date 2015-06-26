# Primary Button

This button can be summoned using the following call(all default values are provided):

```coffeescript
Lovelace.complete('buttons/primary', {
  tag: 'a', # `a` or `button` are preferred
  disabled: false, # will render the button in a disabled state
  block: false, # adds the `.btn-block` class and associated styles to the button
  custom_classes: '',
  url: '',
  text: ''
})
```

<div id="test-me"></div>
<script>
  var button = Lovelace.complete('buttons/primary', { tag: 'button', text: 'click me!' });
  document.querySelector('#test-me').innerHTML = button;
</script>

## Optional Classes

This UI component takes an optional `.js-track-button` class that adds analytics tracking to the button when the scripts are executed in a browser.
