# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{cucumber-cinema}
  s.version = "0.7.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Ilya Katz}]
  s.date = %q{2011-08-29}
  s.description = %q{Take a series of screenshots while running your cucumber test suite}
  s.email = %q{ilyakatz@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "cucumber-cinema.gemspec",
    "lib/cucumber-cinema.rb",
    "lib/cucumber_cinema/camera.rb",
    "lib/cucumber_cinema/view_strategy.rb",
    "public/galleria/LICENSE",
    "public/galleria/galleria-1.2.5.js",
    "public/galleria/galleria-1.2.5.min.js",
    "public/galleria/themes/classic/classic-demo.html",
    "public/galleria/themes/classic/classic-loader.gif",
    "public/galleria/themes/classic/classic-map.png",
    "public/galleria/themes/classic/galleria.classic.css",
    "public/galleria/themes/classic/galleria.classic.js",
    "public/galleria/themes/classic/galleria.classic.min.js",
    "public/images/gang.JPG",
    "public/images/gang_thumb.jpg",
    "public/index.html",
    "public/javascripts/cucumber_cinema.js",
    "public/javascripts/jquery-ui.min.js",
    "public/javascripts/jquery.fileupload-ui.js",
    "public/javascripts/jquery.fileupload.js",
    "public/javascripts/jquery.iframe-transport.js",
    "public/javascripts/jquery.min.js",
    "public/javascripts/jquery.tmpl.min.js",
    "public/stylesheets/jquery-ui.css",
    "public/stylesheets/jquery.fileupload-ui.css",
    "public/test.json",
    "test/helper.rb",
    "test/test_cucumber-cinema.rb"
  ]
  s.homepage = %q{http://github.com/ilyakatz/cucumber-cinema}
  s.licenses = [%q{MIT}]
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.5}
  s.summary = %q{Take a series of screenshots while running your cucumber test suite}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<imgkit>, [">= 0"])
      s.add_runtime_dependency(%q<cucumber>, [">= 0"])
      s.add_runtime_dependency(%q<mini_magick>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
    else
      s.add_dependency(%q<imgkit>, [">= 0"])
      s.add_dependency(%q<cucumber>, [">= 0"])
      s.add_dependency(%q<mini_magick>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
    end
  else
    s.add_dependency(%q<imgkit>, [">= 0"])
    s.add_dependency(%q<cucumber>, [">= 0"])
    s.add_dependency(%q<mini_magick>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
  end
end

