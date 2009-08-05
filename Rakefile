require 'jeweler'

task :release do
    sh "vim HISTORY.markdown"
    sh "vim README.markdown"
    sh "git commit -a -m 'prerelease adjustments' || 1"
end

Jeweler::Tasks.new do |gem|
    gem.name = "vim-syntax"
    gem.summary = gem.description = "A simple (!) extension to the syntax gem, that allows you to highlight vim syntax."
    gem.email = "karottenreibe@gmail.com"
    gem.homepage = "http://github.com/karottenreibe/vim-syntax"
    gem.authors = ["Fabian Streitel"]
    gem.add_dependency('syntax')
end

