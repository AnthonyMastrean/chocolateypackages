require "fileutils"
require "open-uri"
require "yaml"

icons = Dir["public/icons/*"]

task :default => [:generate]

desc "One-time setup of gh-pages"
task :setup, [:folder] do |t, args|
  # http://jgoodall.me/posts/2012/10/26/keep-gh-pages-in-sync-with-master/
  
  raise "gh-pages branch already exists" if File.exist?(".git/refs/heads/gh-pages")

  args.with_defaults(:folder => "public")

  system "git checkout -b gh-pages"
  
  FileList["*"].exclude(args[:folder]).each { |path| FileUtils.rm_rf(path) }
  FileUtils.cp_r(File.join(args[:folder], "."), ".")
  FileUtils.rm_rf(args[:folder])
  
  system "git add -A"
  system "git commit -am \"setup gh-pages\""
  system "git push origin master gh-pages"
  system "git checkout master"
end

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
task :optimize_all do 
  puts "Optimizing all PNGs will take a while (status is hidden)..."
  icons.each do |path|
    system "pngout \"#{path}\" /q"
  end
end

desc "Optimize only new icons"
task :optimize do
  added = `git ls-files --others --exclude-standard -- *.png`.split("\n")
  added.each do |path|
    system "pngout \"#{path}\""
  end
end

desc "Generate the gh-pages site"
task :generate => ["public/_data/icons.yaml"]

NUSPECS = FileList["packages/**/*.nuspec"]

desc "Pack all the nuspecs"
task :pack => NUSPECS.pathmap("output/%n.nupkg")

directory "output"

NUSPECS.each do |nuspec|
  nupkg = nuspec.pathmap("output/%n.nupkg")
  file nupkg => ["output", nuspec] do |task|
    system("nuget pack #{nuspec} -OutputDirectory output -NoPackageAnalysis -NonInteractive -Verbosity quiet")
  end
end
