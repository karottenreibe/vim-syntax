
task :release do
    sh "vim HISTORY.markdown"
    sh "vim README.markdown"
    sh "vim vim-syntax.gemspec"

    print "Enter the new version number >> "
    version = $stdin.gets.strip

    unless version =~ %r{[0-9]+\.[0-9]+\.[0-9]+}
        puts "Aborting: Invalid version number given."
        exit -1
    end
    
    puts "Committing"
    sh "git commit -a -m 'Releasing v#{version}'"
    puts "Tagging"
    sh "git tag #{version}"
    puts "Pushing"
    sh "git push"
    puts "Pushing tags"
    sh "git push --tags"

    puts "Done!"
end

