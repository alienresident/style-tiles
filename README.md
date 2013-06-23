# Compass Style Tiles

#### Create HTML and CSS Style Tiles with Sass & Compass
_This is the development repo for the compass extension and rubygem: [style-tiles](https://rubygems.org/gems/style-tiles)._  
**This is currently under active development** 
Feedback is very welcome!

### *New* Style Tiles is now a Compass extension!
Style Tiles has changed from a straight sass project to a compass extension. This makes it much easier to get started and to reuse. You can build a starter project using one line and start working on creating style tiles right away.

See the **Installation** notes for details on getting started.

## Background

I loved Samantha Warren's idea of [style tiles](http://styletil.es/). It seemed like the best answer to moving away from time-draining pixel perfect comps. However, as I'm designing in the browser more and more I didn't want to go back into pixel based AdobeLand — Photoshop or Fireworks to create Style Tiles. Especially now that
I am doing Responsive Web Design, I wanted to be designing and thinking in CSS and HTML. I thought this would be a perfect project for Sass and Compass. 

## Design Philosophy

Style Tiles should be extremely easily deployed (i.e. easy to send to the client
and easy for them to view). You should be able to send your designs as an attachment in an email or throw them up on any webserver and send out a link.

#### Build for rapid iteration

+ Use sass variables as much as possible
+ Shouldn’t need to edit the HTML
+ Body copy are also be sass variables
+ One file to control each iteration
+ Easily add more iterations

#### Use only HTML and CSS where possible

+ Viewable Everywhere! No server-side technologies
+ Modern browser support only (not production code)
+ Simple & clean HTML5
+ Use CSS3 selectors and pseudo-classes (avoid classes or ids)
+ No dependancies on other css frameworks (Bootstrap or Foundation etc.)
+ Embed images and fonts in CSS (you don't need to zip up a lot of files and folders)

Style Tiles should be deployable as simple HTML and CSS. Style Tiles should be able to view from any folder on a desktop or any web server. To keep the CSS simple — Style Tiles *need* to be viewed in modern browsers: Firefox and Webkit based browsers. Viewable anywhere! I am using CSS rather than some server solution.

## Installation
Compass Pattern Primer is a compass extension bundled as a Ruby gem.
   
```bash
gem install compass-pattern-primer
```
You'll need to install [Sass](http://sass-lang.com/) and [Compass](http://compass-style.org/) Ruby Gems too. Documentation for installing and using these gems is pretty extensive.

## How It Works

There's an index page that links to the 3 version pages. Each page has it's own
stylesheet. The HTML is the exactly the same expect for the stylesheet link.


### Deploying the Styles Tiles

You can zip up all the html files and the css folder folder with the images. By
Default all the images will be inlined in the stylesheets. However if you don't
want to inline your images. Set `$inline-images` to `false` in the
sass/core/\_variables.scss and include the images folder.

### Adding more Versions

More pages can be easily added by duplicating these files

<!--+ v3.html to v4.html-->
+ sass/screen-v3.scss to sass/screen-v4.scss
+ sass/paritals/screen/\_v3.scss to sass/paritals/screen/\_v4.scss

Then you'll need to make some easy edits

+ change `@import "partials/variations/\_v3";` to `@import
"partials/variations/\_v4";` in `sass/screen-v4.scss`
+ edit the variables you want to change in sass/paritals/screen/\_v4.scss.
+ finally add or change the link on the index page `<li><a href="html/v3.html">Version 3</a></li>` to `<li><a href="html/"v4.html">Version 4</a></li>`

### What variables are available? ###

The full list of variables that are available is in:
sass/paritals/core/\_variables.scss

### Code Examples

#### How the copy variables are transformed into CSS

Here's an example of how the `content-before-after` mixin creates the pseudo
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

    $project-name: "Sassy Style Tiles";
    $footer-text: '\2752\20 Designed by Grey Boxes \2751'; // ❒ Designed by Grey Boxes ❑

##### Sass Structure partial

Source: _sass/partials/core/\_structure.scss_

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

##### Sass Mixin partial

Source: _sass/partials/core/\_mixins.scss_

    @mixin content-before-after($content, $before: default, $after:false ) {
      @if $before { &:before { content: $content; } }
      @if $after { &:after { content: $content; } }
    }

##### Generated CSS

Source: _css/screen-v1.css_

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

    $textures: "cotton-shirt.png", "denim.jpg";
    $inline-images: true; // can be set to false

##### Sass Structure partial

Source: _sass/partials/core/\_structure.scss_

    aside {
      ...
      &:nth-of-type(2) figure {
        ...
        @include texture-boxes($textures, $inline-images);
      }
    }

##### Sass Mixin partial

Source: _sass/partials/core/\_mixins.scss_

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

##### Generated CSS

Source: _css/screen-v1.css_

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
significantly increase the size of the css (not a good solution for production).

If people are interested I may expand to incorporating some other type services.

+ Way to control the what links are available on the index page.

The idea is that you may want to control the visibility of the links on the
index page. For example, on a second round of iteration you may not want the
link to version 2 (if the the clients rejected it) to be still visible.

##### Requests? Feedback?
Contact [me](mailto:mark@alienresident.net) or simply file an [issue](https://github.com/alienresident/style-tiles/issues/new)!
