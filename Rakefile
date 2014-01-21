require "yaml"

icons = Dir["public/icons/*"]

task :default => [:generate]

desc "Publish the gh-pages site"
task :publish => [:optimize, :generate] do 
  system "git add -A"
  system "git commit -m \"Site generated at #{Time.now.utc}\""
  system "git checkout gh-pages"
  system "git merge -s subtree master"
  system "git push origin master gh-pages"
  system "git checkout master"
end

directory "public/_data"

task "public/_data/icons.yaml" do |t|  
  data = icons.map do |path| 
    f = File.basename(path)
    n = File.basename(path, File.extname(path))
    
    { "name" => n, "path" => "/chocolateypackages/icons/#{f}" }
  end
  
  File.write(t.name, data.to_yaml)
end

desc "Optimize all of the icons"
task :optimize do 
  icons.each do |path|
    system "pngout \"#{path}\" /q"
  end
end

desc "Generate the gh-pages site"
task :generate => ["public/_data/icons.yaml"]
