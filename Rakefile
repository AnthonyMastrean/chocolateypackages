require "fileutils"
require "yaml"

icons = FileList["public/icons/*"]

task :default => [:generate]

desc "Publish the gh-pages site"
task :publish => [:optimize, :generate] do 

end

directory "public/_data"

file "public/_data/icons.yaml" do |t|
  File.write("public/_data/icons.yaml", icons.map { |path| { "name" => File.basename(path, File.extname(path)), "path" => path } }.to_yaml)
end

desc "Optimize all of the icons"
task :optimize do 
  icons.each do |path|
    system "pngout \"#{path}\" /q"
  end
end

desc "Generate the gh-pages site"
task :generate => ["public/_data/icons.yaml"]
