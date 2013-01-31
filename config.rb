# Require any additional compass plugins here.
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


require 'nokogiri'

html_dir = ""

sa_targets = Hash.new { |h,k| h[k] = "#{k}"[7..-1] }
sa_targets["screen"] = "index"

on_stylesheet_saved do | f |
  name = File.basename(f).chomp(File.extname(f))

  doc = Nokogiri::HTML(File.read(html_dir + sa_targets[name] + ".html"))
  head = (doc/"head").first
  style = doc.create_element("style")

  style.inner_html = File.read(f)
  (head/"link [rel='stylesheet']").remove
  head << style

  File.open(html_dir + sa_targets[name] + ".sa.html", "w") {|fh| fh.write(doc)}
end
