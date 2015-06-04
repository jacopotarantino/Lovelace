# Warning

This project is still under active development. Please don't use it in production code as it will probably break everything. That being said, if you'd like more information or want to collaborate on it, please reach out. I'm really excited about this one.

# Lovelace

An advanced, language- and framework-agnostic architecture for UI components.

Momentarily, heavily a work in progress.


## Codeclimate, npm and bower badges go here
[![Code Climate](https://codeclimate.com/github/jacopotarantino/Lovelace/badges/gpa.svg)](https://codeclimate.com/github/jacopotarantino/Lovelace)
[![Test Coverage](https://codeclimate.com/github/jacopotarantino/Lovelace/badges/coverage.svg)](https://codeclimate.com/github/jacopotarantino/Lovelace/coverage)
[ ![Codeship Status for jacopotarantino/Lovelace](https://codeship.com/projects/121b1550-da48-0132-0d4e-5acc9fe35d9d/status?branch=master)](https://codeship.com/projects/79270)
[![npm version](https://badge.fury.io/js/lovelace.svg)](http://badge.fury.io/js/lovelace)
[![Bower version](https://badge.fury.io/bo/lovelace.svg)](http://badge.fury.io/bo/lovelace)


## Table of Contents

* [Description](#description)
  * [Components](#components)
* [API Definition](#api)
  * [Abstractions](#abstractions)
* [Installation](#installation)
  * [Ruby/Rails](#in-rubyrails)
  * [Node](#in-node)
  * [Client-side](#in-the-browser)
* [Development](#development)
* [Testing](#tests)
* [License](#license)
* [Examples](#complete-real-world-examples)


<span id='description'></span>
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


<span id='api'></span>
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

It should be noted that even though the client-side javascript abstraction for Lovelace exposes the same API, it has significantly more functionality required in order to circumvent many of the difficulties of client-side code.


<span id='installation'></span>
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

```javascript
var $container = $('<div></div>div>').addClass('container'),
    markup = Lovelace.component('buttons/primary', { text: 'Click me!' });

$container.append( $(markup) );
$container.appendTo('body');
```


<span id='development'></span>
## Development

You'll need:

* node
* npm

Then just run `npm install` and you should have all of the required dependencies wired up.


<span id='tests'></span>
## Tests

The standard test suite runs linters, unit tests, sends test coverage reporting to codeclimate, checks the shrinkwrap file for vulnerable dependencies, makes sure you're not deploying on friday and checks out the CSS metrics. Run the tests with:

```bash
grunt test
```


<span id='license'></span>
## License

[Creative Commons Attribution-ShareAlike 4.0 International License](https://creativecommons.org/licenses/by-sa/4.0/legalcode)

### You are free to:

* Share — copy and redistribute the material in any medium or format
* Adapt — remix, transform, and build upon the material for any purpose, even commercially.

You're allowed these freedoms as long as you follow the below license terms.

### But you must follow these rules:

* Attribution — You must give appropriate credit, provide a link to the license, and indicate if changes were made. You may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use.
* ShareAlike — If you remix, transform, or build upon the material, you must distribute your contributions under the same license as the original.
* No additional restrictions — You may not apply legal terms or technological measures that legally restrict others from doing anything the license permits.

### Notices:

No warranties are given. The license may not give you all of the permissions necessary for your intended use. For example, other rights such as publicity, privacy, or moral rights may limit how you use the material.


<span id='examples'></span>
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

