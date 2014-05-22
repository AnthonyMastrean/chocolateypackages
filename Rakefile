require "fileutils"
require "rexml/document"
require "yaml"

def output(nuspec)
  name = File.basename(nuspec, ".nuspec")
  doc = REXML::Document.new(File.open(nuspec))
  version = REXML::XPath.first(doc, "/package/metadata/version").text

  return "#{name}.#{version}.nupkg"
end

NUSPECS = FileList["packages/**/*.nuspec"]
NUPKGS = NUSPECS.map{ |nuspec| File.join("output", output(nuspec)) }

ICONS = FileList["public/icons/*.png"]

directory "output"

task :default => [:pack]

desc "Pack all the nuspecs"
multitask :pack => NUPKGS

desc "Optimize new icons"
task :optimize do
  `git ls-files --others --exclude-standard -- *.png`.split("\n").each do |path|
    system "pngout \"#{path}\"" /q
  end
end

desc "Generate the site"
task :generate => ["public/_data/icons.yaml"]

desc "Publish the site"
task :publish => [:optimize, :generate] do 
  system "git add -A"
  system "git commit -m \"Site generated at #{Time.now.utc}\""
  system "git checkout gh-pages"
  system "git merge -s subtree master"
  system "git push origin master gh-pages"
  system "git checkout master"
end

desc "Setup gh-pages"
task :setup do |task, args|
  # http://jgoodall.me/posts/2012/10/26/keep-gh-pages-in-sync-with-master/
  raise "gh-pages exists!" if File.exist?(".git/refs/heads/gh-pages")

  system "git checkout -b gh-pages"
  
  FileList["*"].exclude("public").each{ |path| FileUtils.rm_rf(path) }
  FileUtils.cp_r(File.join("public", "."), ".")
  FileUtils.rm_rf("public")
  
  system "git add -A"
  system "git commit -am \"setup gh-pages\""
  system "git push origin master gh-pages"
  system "git checkout master"
end

NUSPECS.zip NUPKGS do |nuspec, nupkg|
  file nupkg => ["output", nuspec] do
    system "nuget pack #{nuspec} -OutputDirectory output -NoPackageAnalysis -NonInteractive -Verbosity normal"
  end
end

file "public/_data/icons.yaml" => ICONS do |task|
  data = ICONS.map do |path| 
    file = File.basename(path)
    name = File.basename(path, File.extname(path))
    
    { "name" => name, "path" => "/chocolateypackages/icons/#{file}" }
  end
  
  File.write(task.name, data.to_yaml)
end
