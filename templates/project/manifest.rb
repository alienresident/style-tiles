# Description
description 'This builds the basic scaffolding for your Style Tiles project'

no_configuration_file!
skip_compilation!
  
file 'config.rb', :like => :file, :to => 'config.rb' 

# Stylesheets Import
file '../shared/sass/index.scss', :like => :stylesheet, :media => 'screen, projection', :to => 'index.scss' 
file '../shared/sass/v1.scss', :like => :stylesheet, :media => 'screen, projection', :to => 'v1.scss' 
file '../shared/sass/v2.scss', :like => :stylesheet, :media => 'screen, projection', :to => 'v2.scss' 
file '../shared/sass/v3.scss', :like => :stylesheet, :media => 'screen, projection', :to => 'v3.scss' 

# Partials
file '../shared/sass/partials/variations/_index.scss', :like => :stylesheet, :to => 'partials/variations/_index.scss'
file '../shared/sass/partials/variations/_v1.scss', :like => :stylesheet, :to => 'partials/variations/_v1.scss'
file '../shared/sass/partials/variations/_v2.scss', :like => :stylesheet, :to => 'partials/variations/_v2.scss'
file '../shared/sass/partials/variations/_v3.scss', :like => :stylesheet, :to => 'partials/variations/_v3.scss'

# Core
file '../shared/sass/core/_content.scss' , :like => :stylesheet, :to  => 'core/_content.scss'
file '../shared/sass/core/_mixins.scss' , :like => :stylesheet, :to  => 'core/_mixins.scss'
file '../shared/sass/core/_structure.scss' , :like => :stylesheet, :to  => 'core/_structure.scss'
file '../shared/sass/core/_typography.scss' , :like => :stylesheet, :to  => 'core/_typography.scss'
file '../shared/sass/core/_variables.scss' , :like => :stylesheet, :to  => 'core/_variables.scss'

# Image Import
file '../shared/images/logos/sample-logo.png', :like => :image, :to => 'logos/sample-logo.png'
file '../shared/images/logos/sassy-style-tiles-logo.png', :like => :image, :to => 'logos/sassy-style-tiles-logo.png'
file '../shared/images/textures/asphalt.png', :like => :image, :to => 'textures/asphalt.png'
file '../shared/images/textures/concrete.png', :like => :image, :to => 'textures/concrete.png'
file '../shared/images/textures/cotton-shirt.png', :like => :image, :to => 'textures/cotton-shirt.png'
file '../shared/images/textures/dark-concrete.png', :like => :image, :to => 'textures/dark-concrete.png'
file '../shared/images/textures/denim.jpg', :like => :image, :to => 'textures/denim.jpg'
file '../shared/images/textures/scratched-metal.png', :like => :image, :to => 'textures/scratched-metal.png'
file '../shared/images/textures/scratched-metal2.png', :like => :image, :to => 'textures/scratched-metal2.png'

# Font Import 
# Note: Using :font puts the files in stylesheets/fonts despite setting fonts_dir in config.rb
file '../shared/fonts/DroidSerif/DroidSerif-Bold-webfont.eot', :like => :file, :to => 'fonts/DroidSerif/DroidSerif-Bold-webfont.eot'
file '../shared/fonts/DroidSerif/DroidSerif-Bold-webfont.svg', :like => :file, :to => 'fonts/DroidSerif/DroidSerif-Bold-webfont.svg'
file '../shared/fonts/DroidSerif/DroidSerif-Bold-webfont.ttf', :like => :file, :to => 'fonts/DroidSerif/DroidSerif-Bold-webfont.ttf'
file '../shared/fonts/DroidSerif/DroidSerif-Bold-webfont.woff', :like => :file, :to => 'fonts/DroidSerif/DroidSerif-Bold-webfont.woff'
file '../shared/fonts/DroidSerif/DroidSerif-BoldItalic-webfont.eot', :like => :file, :to => 'fonts/DroidSerif/DroidSerif-BoldItalic-webfont.eot'
file '../shared/fonts/DroidSerif/DroidSerif-BoldItalic-webfont.svg', :like => :file, :to => 'fonts/DroidSerif/DroidSerif-BoldItalic-webfont.svg'
file '../shared/fonts/DroidSerif/DroidSerif-BoldItalic-webfont.ttf', :like => :file, :to => 'fonts/DroidSerif/DroidSerif-BoldItalic-webfont.ttf'
file '../shared/fonts/DroidSerif/DroidSerif-BoldItalic-webfont.woff', :like => :file, :to => 'fonts/DroidSerif/DroidSerif-BoldItalic-webfont.woff'
file '../shared/fonts/DroidSerif/DroidSerif-Italic-webfont.eot', :like => :file, :to => 'fonts/DroidSerif/DroidSerif-Italic-webfont.eot'
file '../shared/fonts/DroidSerif/DroidSerif-Italic-webfont.svg', :like => :file, :to => 'fonts/DroidSerif/DroidSerif-Italic-webfont.svg'
file '../shared/fonts/DroidSerif/DroidSerif-Italic-webfont.ttf', :like => :file, :to => 'fonts/DroidSerif/DroidSerif-Italic-webfont.ttf'
file '../shared/fonts/DroidSerif/DroidSerif-Italic-webfont.woff', :like => :file, :to => 'fonts/DroidSerif/DroidSerif-Italic-webfont.woff'
file '../shared/fonts/DroidSerif/DroidSerif-Regular-webfont.eot', :like => :file, :to => 'fonts/DroidSerif/DroidSerif-Regular-webfont.eot'
file '../shared/fonts/DroidSerif/DroidSerif-Regular-webfont.svg', :like => :file, :to => 'fonts/DroidSerif/DroidSerif-Regular-webfont.svg'
file '../shared/fonts/DroidSerif/DroidSerif-Regular-webfont.ttf', :like => :file, :to => 'fonts/DroidSerif/DroidSerif-Regular-webfont.ttf'
file '../shared/fonts/DroidSerif/DroidSerif-Regular-webfont.woff', :like => :file, :to => 'fonts/DroidSerif/DroidSerif-Regular-webfont.woff'
file '../shared/fonts/DroidSerif/Google Android License.txt', :like => :file, :to => 'fonts/DroidSerif/Google Android License.txt'
file '../shared/fonts/Pacifico/Pacifico SIL OFL Font License 1.1.txt', :like => :file, :to => 'fonts/Pacifico/Pacifico SIL OFL Font License 1.1.txt'
file '../shared/fonts/Pacifico/Pacifico-webfont.eot', :like => :file, :to => 'fonts/Pacifico/Pacifico-webfont.eot'
file '../shared/fonts/Pacifico/Pacifico-webfont.svg', :like => :file, :to => 'fonts/Pacifico/Pacifico-webfont.svg'
file '../shared/fonts/Pacifico/Pacifico-webfont.ttf', :like => :file, :to => 'fonts/Pacifico/Pacifico-webfont.ttf'
file '../shared/fonts/Pacifico/Pacifico-webfont.woff', :like => :file, :to => 'fonts/Pacifico/Pacifico-webfont.woff'
file '../shared/fonts/Peralta/OFL.txt', :like => :file, :to => 'fonts/Peralta/OFL.txt'
file '../shared/fonts/Peralta/peralta-regular-webfont.eot', :like => :file, :to => 'fonts/Peralta/peralta-regular-webfont.eot'
file '../shared/fonts/Peralta/peralta-regular-webfont.svg', :like => :file, :to => 'fonts/Peralta/peralta-regular-webfont.svg'
file '../shared/fonts/Peralta/peralta-regular-webfont.ttf', :like => :file, :to => 'fonts/Peralta/peralta-regular-webfont.ttf'
file '../shared/fonts/Peralta/peralta-regular-webfont.woff', :like => :file, :to => 'fonts/Peralta/peralta-regular-webfont.woff'

# HTML Import
file 'template.html', :like => :html, :to => 'template.html'
file 'index.html', :like => :html, :to => 'index.html'

# Javascript Import
# file 'scripts.js', :like => :javascript, :to => 'scripts.js'

# General File Import
# file 'README.md', :to => 'README.md'

# Compass Extension Help
help %Q{
For documentation for Style Tiles compass extension / gem see: https://github.com/alienresident/style-tiles
}

# Compass Extension Welcome Message
#  Users will see this when they create a new project using this template.
welcome_message %Q{
Welcome to Style Tiles. 
Congratulations! You just have built the basic scaffolding for getting started.

To get started 'cd' into your project and run 'compass compile' or 'compass watch' to compile your css and html.

Documentation is on Github: https://github.com/alienresident/style-tiles
Contact: mark@alienresident.net or use the Style Tiles issue queue on Github https://github.com/alienresident/style-tiles/issues/new. 
}