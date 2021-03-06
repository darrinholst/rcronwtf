# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rcronwtf}
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Darrin Holst"]
  s.date = %q{2009-05-15}
  s.email = %q{darrinholst@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "lib/rcronwtf.rb",
     "lib/rcronwtf/entry.rb",
     "lib/rcronwtf/table.rb",
     "rcronwtf.gemspec",
     "test/entry_test.rb",
     "test/table_test.rb",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/darrinholst/rcronwtf}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{rcronwtf}
  s.rubygems_version = %q{1.3.3}
  s.summary = %q{translate cron entries into human readable form}
  s.test_files = [
    "test/entry_test.rb",
     "test/table_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
