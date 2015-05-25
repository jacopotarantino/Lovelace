# Lovelace

An advanced, language- and framework-agnostic architecture for UI components.

Momentarily, heavily a work in progress.


## Codeclimate, npm and bower badges go here
[![Code Climate](https://codeclimate.com/github/jacopotarantino/Lovelace/badges/gpa.svg)](https://codeclimate.com/github/jacopotarantino/Lovelace)
[![Test Coverage](https://codeclimate.com/github/jacopotarantino/Lovelace/badges/coverage.svg)](https://codeclimate.com/github/jacopotarantino/Lovelace/coverage)
[ ![Codeship Status for jacopotarantino/Lovelace](https://codeship.com/projects/121b1550-da48-0132-0d4e-5acc9fe35d9d/status?branch=master)](https://codeship.com/projects/79270)
[![npm version](https://badge.fury.io/js/lovelace.svg)](http://badge.fury.io/js/lovelace)
[![Bower version](https://badge.fury.io/bo/lovelace.svg)](http://badge.fury.io/bo/lovelace)


## Description

Lovelace provides a framework for developing UI components in a way that is both sane and highly scalable. It focuses on developer happiness by providing a neat organizational scructure with all files relevant to a single component in a single folder. Components are written in terse, compiled languages so that we can code as little as possible. Lovelace is also designed to be consumed by large infrastructures that may involve many different languages and frameworks and complicated deployment processes.


## Components

All components live in the `/components` folder. They each consist of a category folder and then a named folder representing the name of the component in the pattern `components/:category/:component_name`. Each component folder contains all of the code relevant to that particular component with the exception of code that's shared across components which lives in `components/base`. The shared code is things like base classes for Ruby and mixins for Sass. The list of files inside the folder should be as follows:

* Readme.md - Description of the component with examples that gets compiled into live documentation.
* scripts.coffee - Scripts relevant to the component.
* spec.coffee - tests for the above-mentioned scripts.
* styles.sass - All BEM-style styles for the component.
* template.mustache - The markup for the component.

In addition, the component folder should contain an `integrations` folder that contains scripts for the abstraction layer that are named after the language/framework that they're integrating with.


## API

### `#component(component_name, options)`

* `component_name` - a string representation of the path to the component's folder
* `options` - a hash of variables to provide to the mustache template via the abstraction layer

This method returns a string that is the compiled component markup.

### `#style(component_name)`

* `component_name` - a string representation of the path to the component's folder

This method returns the compiled CSS for the named component.

### `#script(component_name)`

* `component_name` - a string representation of the path to the component's folder

This method returns the compiled JavaScript for the named component.

### `#complete(component_name, options)`

* `component_name` - a string representation of the path to the component's folder
* `options` - a hash of variables to provide to the mustache template via the abstraction layer

This method returns a complete component. That is to say, it returns a string containing a `<style>` block at the top with the styles for the component and a `<script>` block at the bottom with all relevant scripts for the component. This method is particularly useful for inserting onto the page ads or other components that can be immediately invoked and require little later maintenance.

### `#styles`

This method takes no arguments and returns the compiled and concatenated CSS for all available components.

### `#scripts`

This method takes no arguments and returns the compiled and concatenated JavaScript for all available components.

## Abstractions

Because all of the components are written in framework-neutral fashion, integration with frameworks is done with a series of abstraction layers. Currently, ruby and node are supported. The abstractions are provided via scripts in the root of the project and integrations for particular components live in a `/integrations` folder within each component folder.


## Installation

Installation process differs based on the application consuming Lovelace and its underlying tech stack.

### In Ruby/Rails

```bash
gem install lovelace_ui
```

You should then have the `Lovelace` namespace available in your application, ready to use.

### In Node

```bash
npm install --save lovelace
```

Then in your application:

```javascript
var Lovelace = require('lovelace');

var my_button = Lovelace.component('buttons/primary', { text: 'Click me!' });
```

### In the browser

```bash
bower install --save lovelace
```

And include the relevant script tag in your markup:

```html
<script src="bower_components/lovelace/lovelace-client.js"></script>
```

Then use the same API to get your components. Because the browser-based code is asynchronous and relies on an API, each API call takes one additional parameter which is a callback. The callback will be invoked with the markup as the first argument when it's returned:

```javascript
var $container = $('<div></div>div>').addClass('container');

Lovelace.component('buttons/primary', { text: 'Click me!' }, function(markup) {
  $container.append( $(markup) );
  $container.appendTo('body');
});
```


## Development

You'll need:

* node
* npm

Then just run `npm install` and you should have all of the required dependencies wired up.


## Tests

The standard test suite runs linters, unit tests, sends test coverage reporting to codeclimate, checks the shrinkwrap file for vulnerable dependencies, makes sure you're not deploying on friday and checks out the CSS metrics. Run the tests with:

```bash
grunt test
```


## License

Creative Commons Attribution-ShareAlike 4.0 International License


## Complete Real World Examples

### Rails

In your `Gemfile`:

```ruby
gem 'lovelace', '~> 1.0'
```

@todo In file that allows you to add view helpers:

```ruby
@todo
```

In `app/views/my_app/homepage.erb`:

```html
<p>Click the button below to sign up!
<br>
<%= Lovelace.component('buttons/primary', {
  custom_classes: 'js-signup-button',
  text: 'Create my account!'
}) %>
</p>
```


### Angular

@todo

























