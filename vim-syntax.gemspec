# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{vim-syntax}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors =  ["Fabian Streitel"]
  s.date = %q{2009-06-15}
  s.description = %q{Extension for syntax that highlights vim syntax.}
  s.email = %q{karottenreibe@gmail.com}
  s.files = %w{HISTORY.markdown README.markdown LICENSE.txt vim-syntax.gemspec lib/vim-syntax.rb}
  s.has_rdoc = false
  s.homepage = %q{http://github.com/karottenreibe/vim-syntax}
  s.rubygems_version = %q{1.3.0}
  s.summary = s.description

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<syntax>)
    else
      s.add_dependency(%q<syntax>)
    end
  else
    s.add_dependency(%q<syntax>)
  end
end

