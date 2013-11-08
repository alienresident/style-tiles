# Require any additional compass plugins here.
# require 'style-tiles'

# Set this to the root of your project when deployed:
http_path = "/"
css_dir = "css"
sass_dir = "sass"
images_dir = "images"
fonts_dir = "fonts"
javascripts_dir = "js"

# You can select your preferred output style here (can be overridden via the command line):
# output_style = :expanded or :nested or :compact or :compressed

# To enable relative paths to assets via compass helper functions. Uncomment:
relative_assets = true

# To disable debugging comments that display the original location of your selectors. Uncomment:
# line_comments = false


# If you prefer the indented syntax, you might want to regenerate this
# project again passing --syntax sass, or you can uncomment this:
# preferred_syntax = :sass
# and then run:
# sass-convert -R --from scss --to sass sass scss && rm -rf sass && mv scss sass

# Copies the contents of the stylesheet and add it to the top of the html page. This allows you to email just the html file to a client and they can view it in a browser. It's a more fool proof option for emailing as it no longer relies on also sending a separate css folder that may get misplaced. It saves you zipping up a bunch of files to send to a client too.

# use this to ignore html files  
# ignore_files = ["index"]
ignore_files = [""]

 
# html_dir = "html/"
html_dir = ""
html_src = "template.html"
html_style_target = "<@style>"

template = File.read(html_dir + html_src)
lines = template.lines

on_stylesheet_saved do |f|
  name = File.basename(f).chomp(File.extname(f))
  unless ignore_files.any? { |x| x == name }
    puts "   create #{html_dir}#{name}.html"
    File.open("#{html_dir}#{name}.html", "w") do |fh|
      template.lines.each do |line|
        fh.write((line =~ /#{html_style_target}/) ?
                 "<style>\n#{File.read(f)}\n</style>\n" : line)
      end
    end
  end
end