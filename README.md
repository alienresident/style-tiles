#Sassy Style Tiles#
### Create HTML and CSS Style Tiles with Sass & Compass ###
**This is currently under development and is still very alpha!** Feedback is very welcome!

## Background ##
I loved Samantha Warren's idea of [style tiles](http://styletil.es/). It seemed like the best answer to moving away from time-draining pixel perfect comps. However, as I'm designing in the browser more and more I didn't want to go back into pixel based AdobeLand — Photoshop or Fireworks. Especially now that I am doing Responsive Web Design, I wanted to be designing in CSS and HTML. I thought this would be a perfect project for Sass and Compass. So here's style tiles in HTML & CSS! It's still a work in progress and I am open to ideas how to improve it.

## Design Philosophy ##
Style Tiles should be extremely easily deployed (i.e. easy to send to the client and easy for them to view). 

#### Build for rapid iteration ####

+ Everything should be changeable using sass variables
+ No need to edit the HTML
+ Copy should also be variables (where possible—links don't work)  using the CSS `content: ""` property with  `:before` or `:after` pseudo classes 

#### Use only HTML and CSS where possible ####

+ No server-side technologies
+ Modern browser support only (this isn't production code)
+ Simple & clean HTML5
+ Use CSS3 selectors and pseudo-classes (avoid classes or ids)

Style Tiles should be deployable as simple HTML and CSS (perhaps JavaScript if there's becomes a good reason). Style Tiles should be able to run in any folder on a desktop or any web server. Style Tiles need to be viewed in modern browsers: Firefox and Webkit based browsers. Wherever possible I am using CSS rather than some server solution. Therefore can't be reliant on any server side technologies.

## How It Works ##
There's an index page that links to the 3 version pages. Each page has it's own stylesheet. The HTML is the exactly the same expect for the stylesheet link.

### Deploying the Styles Tiles ###
You can zip up all the html files and the css folder folder with the images. By Default all the images will be inlined in the stylesheets. However if you don't want to inline your images. Set `$inline-images` to `false` in the sass/core/\_variables.scss and include the images folder.
 
### Adding more Versions ###
More pages can be easily added by duplicating these files

+ v3.html to v4.html
+ sass/screen-v3.scss to sass/screen-v4.scss
+ sass/paritals/screen/\_v3.scss to sass/paritals/screen/\_v4.scss

Then you'll need to make some easy edits

+ change `<link rel="stylesheet" href="css/screen-v3.css">` to
`<link rel="stylesheet" href="css/screen-v4.css">` in v4.html.
+ change 
@import "partials/variations/\_v3"; to @import "partials/variations/\_v4"; in sass/screen-v4.scss
+ edit the variables you want to change in sass/paritals/screen/\_v4.scss.
+ finally add or change the link on the index page `<li><a href="v3.html">Version 3</a></li>` to `<li><a href="v4.html">Version 4</a></li>`

### What variables are available? ###
The full list of variables that are available is in:
sass/paritals/core/\_variables.scss

###Code Examples###
Here's an example of how the content-before-after mixin create the pseudo selector 
####HTML####
v1.html  
    `<hgroup>  
      <h1>Project Name: </h1>
      <h2>Versions: </h2>
    </hgroup>`
    ...
    `<footer>
    </footer>`

####Sass Variables####
    `$project-name: "Sassy Style Tiles";
    $footer-text: '\2752\20 Designed by Grey Boxes \2751'; // ❒ Designed by Grey Boxes ❑`

####Sass Structure partial####
    `section:nth-of-type(1) header hgroup {
      ...
      h1 {
        ...
        @include content-before-after($project-name, false, true);
      }
    }
    footer {
      ...
      @include content-before-after($footer-text, false, true);
    }`

####Sass Mixin partial####
    `@mixin content-before-after($content, $before: default, $after:false ) {
      @if $before { &:before { content: $content; } }
      @if $after { &:after { content: $content; } }
    }`

#### Generated CSS #### 
    `section:nth-of-type(1) header hgroup h1:after {
      content: "Sassy Style Tiles";
    }
    footer:after {
      content: "\2752\20 Designed by Grey Boxes \2751";
    }`

## Planned Features ##

+ Custom font support

Currently, the examples utilize a few open source (available at Google Fonts). Would like to be able to inline the fonts. Perhaps some other type services.
 