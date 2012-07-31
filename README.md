# Create HTML and CSS Style Tiles with Sass & Compass #

## Background ##
I loved Samantha Warren's idea of [style tiles](http://styletil.es/). It seemed like the best answer from getting away from pixel perfect comps. However as I'm designing in the browser more and more I didn't want to go back into pixel based AdobeLand — Photoshop or Fireworks. Especially now that I am doing Responsive Web Design, I wanted to be designing in CSS and HTML. I thought this would be a perfect project for Sass and Compass. So here's style tiles in HTML & CSS! It's still a work in progress and I am open to ideas how to improve it.

## Design Philosophy ##
Style Tiles should be easily deployed i.e. sent to the client. 

+ HTML and CSS where possible
+ All changes should be sass variables
+ No server-side technologies
+ Modern browser support only (this is not production code)

Therefore it shouldn't be reliant on any server side technologies. Style Tiles should be deployable as simple HTML and CSS (perhaps JavaScript if there's becomes a good reason). Style Tiles should be able to run in any folder on a desktop or any web server. Style Tiles need to be viewed in modern browsers: Firefox and Webkit based browsers. Wherever possible I am using CSS rather than some server solution. 

## How It Works ##
There's an index page that links to the 3 version pages. Each page has it's own stylesheet. The HTML is the same expect for the stylesheet

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

### What's variables are available ###
TK