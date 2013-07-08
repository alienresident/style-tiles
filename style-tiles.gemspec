# Replace extension with the name of your extension's .rb file
require './lib/style-tiles'

Gem::Specification.new do |s|
  # Release Specific Information
  #  Replace Extension with the name you used in your extension.rb
  #   in the mdodule with version and date.
  s.version = Style_Tiles::VERSION
  s.date = Style_Tiles::DATE

  # Gem Details
  # Replace "extension" with the name of your extension
  s.name = "style-tiles"
  s.rubyforge_project = "style-tiles"
  # Description of your extension
  s.description = %q{Create HTML and CSS Style Tiles with Sass & Compass}
  # A summary of your Compass extension. Should be different than Description
  s.summary = %q{Style Tiles allows you to quickly build style tiles. This allows you to show your clients a number of directions that they could go with in designing a site.}
  # The names of the author(s) of the extension.
  # If more than one author, comma separate inside of the brackets
  s.authors = ["Mark Reilly"]
  # The email address(es) of the author(s)
  # If more than one author, comma separate inside of the brackets
  s.email = ["mark@alienresident.net"]
  # URL of the extension
  s.homepage = "http://alienresident.net"

  # Gem Files
  # These are the files to be included in your Compass extension.
  # Uncomment those that you use.

  # README file
  s.files = ["README.md"]

  # CHANGELOG
  s.files += ["CHANGELOG.md"]

  # Library Files
  s.files += Dir.glob("lib/**/*.*")

  # Sass Files
  s.files += Dir.glob("stylesheets/**/*.*")

  # Template Files
  s.files += Dir.glob("templates/**/*.*")

  # Gem Bookkeeping
  # Versions of Ruby and Rubygems you require
  s.required_rubygems_version = ">= 1.3.6"
  s.rubygems_version = %q{1.3.6}

  # Gems Dependencies
  # Gem names and versions that are required for your Compass extension.
  # These are Gem dependencies, not Compass dependencies. Including gems
  #  here will make sure the relevant gem and version are installed on the
  #  user's system when installing your gem.
  s.add_dependency("sass",      [">=3.2.0"])
  s.add_dependency("compass",   [">= 0.12.1"])
end
