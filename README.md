# Compass Style Tiles

#### Create HTML and CSS Style Tiles with Sass & Compass
_This is the development repo for the compass extension and rubygem: [style-tiles](https://rubygems.org/gems/style-tiles)._  
**This is currently under active development** 
Feedback is very welcome!

### *New* Style Tiles is now a Compass extension!
Style Tiles has changed from a sass project to a compass extension. This makes it much easier to get started and to reuse. You can build a starter project using one line and start working on creating style tiles right away. See the [installation](#installation) section for details on getting started.

## Background
I loved Samantha Warren's idea of [style tiles](http://styletil.es/). It seemed like the best answer to moving away from time-draining pixel perfect comps. However I'm designing in the browser more and more and I didn't want to go back into pixel based AdobeLand — Photoshop or Fireworks to create Style Tiles. Especially now that
I am doing Responsive Web Design, I wanted to be designing and thinking in CSS and HTML. I thought this would be a perfect project for Sass and Compass. 

## Design Philosophy
Style Tiles should be primarily easy to share (i.e. easy for you to send to clients
and easy for them to view it). You should be able to send your designs as easily as a static mockup image. Be it an email attachment or a link to _any_ webserver where you uploaded your designs.

#### Build for rapid iteration
+ **Highly customizable** use sass variables wherever much as possible
+ **Reuse the HTML** No real need to edit the HTML
+ **Body copy** is also controlled by sass variables
+ **1 to 1 mapping** single file to control each iteration
+ **Easily iterated** simply duplicate the `.scss` files

#### Use only HTML and CSS where possible
+ **Viewable Everywhere!** No server-side technologies
+ **Modern browser support only** (this ain't production code)
+ **Simple & clean HTML5**
+ **Use CSS3 selectors and pseudo-classes** (avoid classes or ids)
+ **No dependancies on other css frameworks** (Bootstrap or Foundation etc.)
+ **Embed images and fonts in CSS** (you don't need to zip up a lot of files and folders)
+ **Embed Styles in HTML** One file per iteration to send with no nested folders

Style Tiles should be deployable as simple HTML and CSS. Style Tiles should be able to view from any folder on a desktop or any web server. To keep the CSS simple — Style Tiles *need* to be viewed in modern browsers: Firefox and Webkit based browsers. Viewable anywhere! I am using CSS rather than some server solution.

### Project History
The idea for creating HTML and CSS style tiles had been brewing in my head for awhile. I started the initial development on the bus ride to Design 4 Drupal 2012. I presented the idea in a BoF on Compass and got some positive feedback and interest.

The first iteration was a straight-forward Sass-*ified* project \([archived here](https://github.com/alienresident/style-tiles/tree/archive)\). I was able to get the images and the fonts to using compass functions. However, I knew I need a custom function in the `config.rb` to copy the current css and add it to a `<style>` tag in the `<head>` of the HTML document. Thankfully, [Zellio](https://github.com/zellio) contributed his Ruby knowledge and created that exact [custom function](https://github.com/alienresident/style-tiles/blob/dryad/config.rb).

I paused development for awhile to work on my [Pattern Primer](https://github.com/alienresident/compass-pattern-primer). That too started as a sass project and eventually it made sense to make it into a compass extension. Thanks to [Sam Richard](https://github.com/snugug)'s [Compass Extension Template](https://github.com/Team-Sass/Compass-Extension-Template) I was easily able to create my Compass Pattern Primer extension. Returning to Design 4 Drupal in 2013 on the bus, I thought it was time to convert Style Tiles to a compass extension and here we are.

## Installation
Style Tiles is a compass extension bundled as a Ruby gem.
   
```bash
gem install style-tiles
```
You'll need to install [Sass](http://sass-lang.com/) and [Compass](http://compass-style.org/) Ruby Gems too. Documentation for installing and using these gems is pretty extensive.

## How to Use it
There are a number of ways you can get started with Style Tiles. 

#### Recommended: Create a new Compass project using Style Tiles scaffolding
```bash
compass create <MyProject> -r style-tiles -u style-tiles
```
```bash
cd  <MyProject>
compass compile
```
* **Note:** replace `<MyProject>` with name of your project (without the  `<` `>`)*
This will generate four stylesheets and the paste the styles into four corresponding html files (index, v1, v2, and v3).

#### Other ways to add Style Tiles to your compass project

```bash
compass create <MyProject> -r style-tiles 
```

This creates a new Compass project using the compass standard scaffolding and adds `require 'style-tiles'` to the `config.rb`. However without the custom config.rb and html file you lose the benefit of adding your styles to the HTML and you don't have a starter scaffolding with variables examples. 

#### Add Style Tiles to an existing project by adding the following to config.rb

```ruby
require 'style-tiles'
```
Then import the Style Tile partial by adding at the top of your working file

```scss
@import "style-tiles";
```
**Note:** *You'll need to restart* `compass watch` *if it's running*. And again without the custom config.rb and html file you lose the benefit of adding your styles to the HTML and you don't have a starter scaffolding with variables examples.

## How It Works

There's an index page that links to the 3 version pages. Each page has it's own
stylesheet. When you `compile compass` the CSS files are generated from the `.scss` files in the `sass` folder. The corresponding HTML files are generated from `template.html` and the CSS is added to the `<head>` of the HTML files.

### Deploying the Styles Tiles
The HTML files are self-contained. All the images, and fonts are embedded in the style and the style is embedded in the HTML. However if you don't want to inline your images. Set `$inline-images` to `false` in your `partials/variations/_v*.scss` and include the images folder. The same goes for fonts, set `$inline-fonts` to `false`. 

### Adding more Versions
More pages can be easily added by duplicating these files

+ `sass/v3.scss` to `sass/v4.scss`  
+ `sass/paritals/variations/\_v3.scss` to `sass/paritals/variations/\_v4.scss`  

Then you'll need to make some easy edits

+ change `@import "partials/variations/\_v3";` to `@import
"partials/variations/\_v4";` in `sass/v4.scss`  
+ edit the variables you want to change in `sass/paritals/variations/\_v4.scss`  

### Displaying updated versions on the homepage
Update what versions are displayed by updating the $show-versions variables.   
`$show-versions: 1, 2, 3;`  
to    
`$show-versions: 1, 2, 3, 4;`  
or  
`$show-versions: 1, 3, 4;`  
etc.  

### What variables are available? ###

The full list of variables that are available is in the compass gem's stylesheets folder:
[style-tiles/core/\_variables.scss](https://github.com/alienresident/style-tiles/blob/master/stylesheets/style-tiles/core/_variables.scss)

### Code Examples

#### How the copy variables are transformed into CSS

Here's an example of how the `content-before-after` [mixin](https://github.com/alienresident/style-tiles/blob/master/stylesheets/style-tiles/core/_mixins.scss) creates the pseudo
selector and adds whats in the variables in to the content attribute.

##### HTML

Source: _v1.html_

```html
<hgroup>
  <h1>Project Name: </h1>
  <h2>Versions: </h2>
</hgroup>
...
<footer>
</footer>
```

#### Sass Variables

Source: _sass/partials/variations/\_v1.scss_

```scss
$project-name: "Sassy Style Tiles";
$footer-text: '\2752\20 Designed by Grey Boxes \2751'; // ❒ Designed by Grey Boxes ❑
```

##### Sass Structure partial

Source: _sass/partials/core/\_structure.scss_

```scss
section:nth-of-type(1) header hgroup {
  ...
  h1 {
    ...
    @include content-before-after($project-name, false, true);
  }
}
footer {
  ...
  @include content-before-after($footer-text, false, true);
}
```

##### Sass Mixin partial

Source: _sass/partials/core/\_mixins.scss_

```scss
@mixin content-before-after($content, $before: default, $after:false ) {
  @if $before { &:before { content: $content; } }
  @if $after { &:after { content: $content; } }
}
```

##### Generated CSS

Source: _css/v1.css_

```css
section:nth-of-type(1) header hgroup h1:after {
  content: "Sassy Style Tiles";
}
...
footer:after {
  content: "\2752\20 Designed by Grey Boxes \2751";
}
```

#### How the list of textures is transformed into the CSS

The `texture-boxes` mixin takes an array (comma separated list) of image file
names that are in the `images/textures` folder. It uses an
[@each sass control directive](http://sass-lang.com/docs/yardoc/file.SASS_REFERENCE.html#each-directive)
to generate the CSS. It then uses an
[@if sass control directive](http://sass-lang.com/docs/yardoc/file.SASS_REFERENCE.html#id10)
to see if you set the images to be inlined (base 64 encoded) into the CSS.

##### HTML

Source: _template.html_

```html
<aside>
  <h3>Textures</h3>
<figure>
</figure>
<figure>
</figure>
<figure>
</figure>
  <figcaption></figcaption>
</aside>
```

#### Sass Variables

Source: _sass/partials/variations/\_v1.scss_

```scss
$textures: "cotton-shirt.png", "denim.jpg";
$inline-images: true; // can be set to false
```

##### Sass Structure partial

Source: _sass/partials/core/\_structure.scss_

```scss
aside {
  ...
  &:nth-of-type(2) figure {
    ...
    @include texture-boxes($textures, $inline-images);
  }
}
```

##### Sass Mixin partial

Source: _sass/partials/core/\_mixins.scss_

```scss
@mixin texture-boxes($textures, $inline-images: false) {
  $i : 1;
  @each $texture in $textures {
    &:nth-of-type(#{$i}) {
      border: $figure-border;
      @if $inline-images { @include background-image(inline-image("textures/#{$texture}")); }
      @else { background-image: image-url("textures/#{$texture}"); }
    }
    $i: $i + 1;
  }
}
```
##### Generated CSS

Source: _css/v1.css_

```css
/// When inline image is set to false
aside:nth-of-type(2) figure:nth-of-type(1) {
  border: 0.063em #888888 solid;
  background-image: url('../images/textures/cotton-shirt.png?1346169991');
}
aside:nth-of-type(2) figure:nth-of-type(2) {
  border: 0.063em #888888 solid;
  background-image: url('../images/textures/denim.jpg?1345644552');
}

/// When inline image is set to true
aside:nth-of-type(2) figure:nth-of-type(1) {
  border: 0.063em #888888 solid;
  background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAeAAAAHg
  CAMAAABKCk6nAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2FpVFh0WE1MO
  mNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cm
  VTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wd6c
  mRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4g.....');
}
aside:nth-of-type(2) figure:nth-of-type(2) {
  border: 0.063em #888888 solid;
  background-image: url('data:image/jpeg;base64,/9j/4QAYRXhpZgAASUkqAAgAAAAAAAA
  sABFEdWNreQABAAQAAAAZAAD/4QNvaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLwA8P3hwYWNr
  ZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhI
  HhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjAtYzA2MCA
  2MS4xMzQ3NzcsIDIwMTAvMDIvMTItMTc6  MzI6MDAgICAgICAgICI+IDxy.....');
}
```

## Planned Features

+ Custom font support

Currently, the examples utilizes a few open source fonts (that are available at
Google Fonts). I have added the option to inline the fonts but they will
significantly increase the size of the css (rarely a good solution for production).

If people are interested I may expand to incorporating some other font services.

~~+ Way to control the what links are available on the index page.~~

~~The idea is that you may want to control the visibility of the links on the
index page. For example, on a second round of iteration you may not want the
link to version 2 (if the the clients rejected it) to be still visible. This will be forthcoming very soon.~~

##### Requests? Feedback?
Contact [me](mailto:mark@alienresident.net) or simply file an [issue](https://github.com/alienresident/style-tiles/issues/new)!

